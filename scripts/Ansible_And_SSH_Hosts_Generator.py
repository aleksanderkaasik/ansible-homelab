import requests
import urllib3
import json

# Disable insecure warnings (optional)
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxmoxHost = ""
username = ""
password = ""
node = ""
PrintMode = ""

if PrintMode not in ["host", "ssh"]:
    exit()
    
ticketUrl = f"https://{proxmoxHost}:8006/api2/json/access/ticket"
payload = {"username": username, "password": password}

responseTicket = requests.post(ticketUrl, data=payload, verify=False)
responseTicket.raise_for_status()

cookies = {"PVEAuthCookie": responseTicket.json()["data"]["ticket"]}

content =json.loads(open("terraform.tfstate", "r").read())

vmidList = []
for x in range( len( content["resources"] )):
    if content["resources"][x]["type"] != "proxmox_lxc":
        continue
    
    for y in range( len( content["resources"][x]["instances"] )):
        answer = ""
        vmID = content["resources"][x]["instances"][y]["attributes"]["vmid"]
        configUrl = f"https://{proxmoxHost}:8006/api2/json/nodes/{node}/lxc/{vmID}/config" 
        interfaceUrl = f"https://{proxmoxHost}:8006/api2/json/nodes/{node}/lxc/{vmID}/interfaces"
        
        responseConfig = requests.get(configUrl, cookies=cookies, verify=False)
        responseInterfaces = requests.get(interfaceUrl, cookies=cookies, verify=False)
        
        responseConfig.raise_for_status()
        responseInterfaces.raise_for_status()
        
        config = responseConfig.json()["data"]["hostname"]
        ipAdresss = responseInterfaces.json()["data"][1]["ip-addresses"][0]["ip-address"]
        
        match PrintMode.lower():
            case "host":
                answer=f"\"{ipAdresss}\""
            case "ssh":
                answer=f"    HostName {ipAdresss}\n    User ansible\n    Port 22\n    IdentityFile ~/.ssh/ansible"                

        print(f"\n[{content['resources'][x]['name']}]")
        print(answer)

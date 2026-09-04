scriptPath="$(cd "$(dirname "$0")" && cd .. && pwd)"
HostPath=$scriptPath/hosts.ini
mode="$(echo $1 | tr '[:upper:]' '[:lower:]')"

if [[ $mode == "host" ]]; then
    OutputPath=$scriptPath/host_vars
    GrepSelect="-v"
elif [[ $mode == "group" ]]; then
    OutputPath=$scriptPath/group_vars
    GrepSelect=""
else
    exit
fi

HostGroupData=$(cat $HostPath | grep $GrepSelect "\[*\]" | tr -d '"[]' )

for item in $HostGroupData; do
    touch $OutputPath/$item.yml
done

checkHost=$(ls $OutputPath/ | sed "s/.yml//g")
 
DeleteHost=$(echo ${HostGroupData[@]} ${checkHost[@]} | tr ' ' '\n' | sort | uniq -u)

for item in $DeleteHost; do
    rm $OutputPath/$item.yml
done

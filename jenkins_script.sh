#!/bin/bash

login=$1
password=$2
jenkins_server=$3
project=$4
slcahook_url=$5
json=$(curl "http://${login}:${password}@${jenkins_server}/job/${project}/lastBuild/api/json")

regex='"result":"([^"]+)'

[[ $json =~ $regex ]]
text="Project - ${project} \nStatus last build - ${BASH_REMATCH[1]}"

curl -X POST -H 'Content-type: application/json' --data '{"text":"'"${text}"'"}' "${slcahook_url}"

exit 0



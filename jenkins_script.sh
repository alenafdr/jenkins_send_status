#!/bin/bash

login=$1
password=$2
jenkins_server=$3
project=$4
slcakbot_url=$5
json=$(curl "http://${login}:${password}@${jenkins_server}/job/${project}/lastBuild/api/json")

regex='"result":"([^"]+)'

[[ $json =~ $regex ]]

echo ${BASH_REMATCH[1]}

curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"project":"'"${project}"'","status":"'"${BASH_REMATCH[1]}"'"}' "${slcakbot_url}"

exit 0



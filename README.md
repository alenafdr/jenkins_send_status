# jenkins_send_status

In order to use jenkins_script.sh you must set some required parameters.


        ./jenkins_script.sh <login> <password> <jenkins_server> <jenkins_project> <slackbot_url>

Status will be sent in JSON format:

        {
            "project"="ansible_project_download_and_deploy", 
            "status"="SUCCESS"
        }
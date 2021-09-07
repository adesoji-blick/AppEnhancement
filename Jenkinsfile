pipeline {
    agent any
        environment {
            // AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
            // AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
            // AWS_DEFAULT_REGION    = credentials ('AWS_DEFAULT_REGION')
            ANSIBLE_HOSTS="ec2.py"
            EC2_INI_PATH="ec2.ini"
            PIP_PATH="/home/jenkins/.local/bin"
            WHEEL_PATH="/home/jenkins/.local/bin"
        } 
    stages {
        stage('install dependencies') {
            steps {
                // Installing ansible dependencies
                sh "sh jenkins_task.sh"        
            }
        }
        stage('Run Ansible playbook') {
            steps {
                // Run ansible playbook for project 
                sh "pwd"
                sh "ls -ltr"
                // sh "ansiblePlaybook disableHostKeyChecking: true, installation: 'ansible2', inventory: 'ec2.py', playbook: 'prod.yml'"       
                sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ec2.py -vvvvv prod.yml" 
            }
        }
    }
}

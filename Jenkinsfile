pipeline {
    agent any
        environment {
            ANSIBLE_HOSTS="ec2.py"
            EC2_INI_PATH="ec2.ini"
            // ANSIBLE_VAULT_KEY = credentials ('Ansible_Vault_Key')
            // PIP_PATH="/home/jenkins/.local/bin"
            // WHEEL_PATH="/home/jenkins/.local/bin"
        } 
    stages {
        stage('install dependencies') {
            steps {
                // Installing ansible dependencies
                sh "sh jenkins_task.sh"        
            }
        }
        stage('Manage Master Branch for Prod App') {
            when {
                branch "master"
            }
            steps {
                // Run ansible playbook for project App
                sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ec2.py -vvvvv prod.yml" 
            }
        }
        stage('Manage Develop Branch for Test App') {
            when {
                branch "development"
            }
            steps {
                // Run ansible playbook for test/dev App
                sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ec2.py -vvvvv dev.yml" 
            }
        }        
    }
}

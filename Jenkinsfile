pipeline {
    agent any
        environment {
            ANSIBLE_VAULT_PASSWORD_FILE = credentials ('Ansible_Vault_Key')
            ANSIBLE_HOSTS="ec2.py"
            EC2_INI_PATH="ec2.ini"
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

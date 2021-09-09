pipeline {
    agent any
        environment {
            ANSIBLE_VAULT_PASS = credentials ('Ansible_Vault_Pass')
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
                // Run ansible playbook for project App
                sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ec2.py prod.yml --ask-vault-pass=ANSIBLE_VAULT_PASS" 
            }
        }
    }
}

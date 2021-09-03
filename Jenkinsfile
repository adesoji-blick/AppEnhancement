pipeline {
    agent any
        environment {
            AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
            AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
            AWS_DEFAULT_REGION    = credentials ('AWS_DEFAULT_REGION')
            // PROD_SERVER_IP="35.182.224.12"
            // DEV_SERVER_IP="3.98.127.20"
        } 
    stages {
        stage('install dependencies') {
            steps {
                // Installing ansible dependencies
                sh "sh jenkins_dep.sh"        
            }
        }
        stage('Run Ansible playbook') {
            steps {
                // Run ansible playbook for project App
                sh "ansiblePlaybook disableHostKeyChecking: true, installation: 'ansible2', inventory: 'ec2.py', playbook: 'prod.yml'"        
            }
        }
    }
}

pipeline {
    agent any
        environment {
            PROD_SERVER_IP="35.182.224.12"
            DEV_SERVER_IP="3.98.127.20"
        } 
    stages {
        stage('Build Docker Image for Project-App') {
            steps {
                // Building Docker Image for project App
                sh "sudo docker build -t project-app:latest ."        
            }
        }
        stage('Manage Master Branch for Prod App') {
            when {
                branch "master"
            }
            steps {
                // tag docker image for prod app and push to docker.io
                sh "sudo docker tag project-app:latest blickng/project-app-prod:latest"
                withCredentials([string(credentialsId: 'DockerUserID', variable: 'dockerusername'), string(credentialsId: 'DockerPassword', variable: 'dockerpassword')]) {
                sh "sudo docker login -u blickng -p $dockerpassword"
                sh "sudo docker push blickng/project-app-prod:latest"
                sh "sudo docker logout"
                }   
                // ssh into prod machine Pull docker image and run container instance in remote machine
                // withCredentials([sshUserPrivateKey(credentialsId: 'jenkins-key', keyFileVariable: '')]) {
               //    sh "ssh ec2-user@15.222.7.94 sudo docker rm -f direction-app-prod"     
               sh "ssh -o StrictHostKeyChecking=no jenkins@${PROD_SERVER_IP} sudo docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=xxxxxxxx --name direction-app-prod blickng/direction-app-prod:latest"
             //  }
           }
        }
        stage('Manage Develop Branch for Test App') {
            when {
                branch "develop"
            }
            steps {
                // tag docker image for dev app and push to docker.io
                sh "sudo docker tag project-app:latest blickng/project-app-dev:latest"
                withCredentials([string(credentialsId: 'DockerUserID', variable: 'dockerusername'), string(credentialsId: 'DockerPassword', variable: 'dockerpassword')]) {
                sh "sudo docker login -u blickng -p $dockerpassword"
                sh "sudo docker push blickng/project-app-dev:latest"
                sh "sudo docker logout"
                }   
                // ssh into dev machine Pull docker image and run container instance in remote machine
                // withCredentials([sshUserPrivateKey(credentialsId: 'jenkins-key', keyFileVariable: '')]) {
                // sh "ssh ec2-user@52.60.57.220 sudo docker rm -f direction-app-dev"     
                sh "ssh -o StrictHostKeyChecking=no ec2-user@${DEV_SERVER_IP} sudo docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=xxxxxxxx --name direction-app-dev blickng/direction-app-dev:latest"
            //   }
           }
        }
    }
}

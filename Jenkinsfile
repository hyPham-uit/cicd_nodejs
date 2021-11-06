pipeline {
     agent any
     environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "hypham3012/node-app"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        //CI
        //Checkout SCM
        stage ('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/hyPham-uit/cicd_nodejs']]])
            }
        }
       
       //Build image
        stage ('Build docker image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
       
        //Uploading Docker images into registry (Docker Hub)
        stage('Upload Image') {
            steps{   
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }

        //CD
        stage('SSH server and build image') {
            steps{   
                script {
                    sshagent(credentials : ['ssh-vps']) {
                        sh 'ssh -o StrictHostKeyChecking=no -l vps 20.212.22.17 "pwd && sudo docker -v && sudo docker run -p 3000:3000 --name node-app -d hypham3012/node-app"'
                    }
                }
            }
        }
    }  
}
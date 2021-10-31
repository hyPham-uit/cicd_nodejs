pipeline {

    agent any

    stages{
        stage("build"{
            step{
                echo 'building the application...'
                sh 'npm install'
                sh 'node index.js'
            }
        })

        stage("test"{
            step{
                echo 'testing the application...'
            }
        })

        stage("deploy"{
            step{
                echo 'deploying the application...'
            }
        })
    }
}
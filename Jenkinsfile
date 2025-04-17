pipeline {

    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('mostafaahmed-dockerhub')
    }

    stages {

        stage('Build Maven') {
            steps {
                echo 'Building the application...'
                sh 'chmod +x mvnw'
                sh './mvnw clean package'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing the application...'
                sh './mvnw test'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Build & Push using Ansible') {
            steps {
                sh 'ansible-playbook ansible-playbook.yml'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}

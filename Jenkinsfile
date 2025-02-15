pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('mostafaahmed-dockerhub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/Mostafa-Ahmed3/DEPI_Final_Project'
			}
		}
		
		stage('Buildmaven') {
		    
            steps {
                echo '$USER_NAME'
                sh './mvnw clean package'
            }
            
        stage('Test') {
            steps {
                
                echo 'Test the application...'
                sh './mvnw test'
            }

		stage('Build') {

			steps {
				sh 'docker build -t mostafaahmed500/dockerhub-project:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push mostafaahmed500/dockerhub-project:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}
}

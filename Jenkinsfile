pipeline {
	environment {
		registry = "hmarks/chucknorris"
		registryCredential = 'hmarks_docker'
		dockerImage = ''
	}
	agent any
	stages {

		stage ('Checkout SCM') {
			steps {
				checkout scm
			}
		}

		stage ('Build') {
			steps {
				script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }		
			}
		}

		stage ('Deploy') {
			when {
				branch 'dev'
			}
			steps {
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}
	
	}
}

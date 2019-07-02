pipeline {
	environment {
		registry = "hmarks/chucknorris"
		registryCredential = 'hmarks_docker'
		dockerImage = ''
	}
	agent any
	when {
		branch 'dev'
	}
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

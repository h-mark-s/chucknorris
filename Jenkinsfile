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
				sh 'docker build -t chucknorris .'
			}
		}

		stage ('Deploy') {
			steps {
				docker.withRegistry( '', registryCredential ) {
				dockerImage.push()
				}
			}
		}
	
	}
}

pipeline {
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
				sh 'docker tag chucknorris hmarks/chucknorris'
				sh 'docker push hmarks/chucknorris'
			}
		}
	
	}
}

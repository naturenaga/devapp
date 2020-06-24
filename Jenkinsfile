pipeline {
    agent any
    environment {
            PROFILE = "Hudson"
    }



    stages {

        stage('build docker image') {
            steps {
                sh "docker build --no-cache --iidfile image-id ."
            }
        }

        stage('Push to AWS CRP registry') {
            steps {
                sh 'ls'
            }
        }
        stage('Email Notification') {
            steps {
                mail bcc: '', body: 'Prompt to production', cc: '', from: '', replyTo: '', subject: 'Docker Build', to: 'naturenaga.j@gmail.com'
            }
        }
		
		
    }
}

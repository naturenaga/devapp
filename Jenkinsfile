pipeline {
    agent any
    environment {
            PROFILE = "Hudson"
    }

    def hello = input id: 'CustomId', message: 'Want to continue?', ok: 'Yes', parameters: [string(defaultValue: 'world', description: '', name: 'hello')]

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
		    mail bcc: '', body: '${hello}', cc: '', from: '', replyTo: '', subject: 'Docker Build', to: 'naturenaga.j@gmail.com'
		
            }
        }
		
		
    }
}

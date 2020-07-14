pipeline {
    agent any
    environment {
            PROFILE = "Hudson"
    }

   // def hello = input id: 'CustomId', message: 'Want to continue?', ok: 'Yes', parameters: [string(defaultValue: 'world', description: '', name: 'hello')]

    stages {

        stage('build docker image') {
            steps {
                sh "docker build --no-cache --iidfile image-id ."
            }
        }

        stage('Push to AWS ERP registry') {
            steps {
                sh 'ls'
		sh aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 045368729820.dkr.ecr.us-east-1.amazonaws.com
		sh "docker tag \$(cat image-id) 045368729820.dkr.ecr.us-east-1.amazonaws.com/dev-app:${PROFILE}_${env.BUILD_NUMBER}"
                sh "docker push 045368729820.dkr.ecr.us-east-1.amazonaws.com/dev-app:${PROFILE}_${env.BUILD_NUMBER}"
            }
        }
    
    
		
    }
}

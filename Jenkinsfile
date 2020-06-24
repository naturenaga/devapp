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
                ls
            }
        }

    }
}

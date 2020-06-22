pipeline {
    agent any



    stages {

        stage('build docker image') {
            steps {
                sh "docker build --no-cache --iidfile image-id ."
            }
        }

        stage('Push to AWS CRP registry') {
            steps {
                sh "docker tag \$(cat image-id) docker-registry-default.apps.crp.ec1.aws.aztec.cloud.allianz/onemarketing/om-aem-base:${env.BUILD_NUMBER}"
                sh "docker push 045368729820.dkr.ecr.us-east-1.amazonaws.com/dev-app:${env.BUILD_NUMBER}"
            }
        }

    }
}

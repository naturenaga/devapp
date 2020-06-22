pipeline {
  agent any
  environment {
	VERSION = "${BUILD_NUMBER}"
	PROJECT = "DEVAPP"
	IMAGE = "$PROJECT:$VERSION"
	ECRURL = "https://045368729820.dkr.ecr.us-east-1.amazonaws.com/dev-app"
	ECRCRED = "ecr_access_credential"
    
  }

  stages {
    stage('GitSCM') {
      steps {

        git 'https://github.com/naturenaga/devapp.git'

      }
    }
    stage('Building image') {
      steps{
        script {
          docker.build{"$IMAGE"}
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry(ECRURL, ECRCRED) {
            docker.image(IMAGE).push()
          }
        }
      }
    }

  }
}
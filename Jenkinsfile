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
	    git branch: 'master',
        credentialsId: 'a122b66f-5fc3-4287-850f-8f3d41a8b4ea',
        url: 'https://github.com/naturenaga/devapp.git'
        

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
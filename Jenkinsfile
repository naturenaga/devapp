pipeline {
    agent any
    environment {
            PROFILE = "Hudson"
	    env_path = "/usr/local/bin"
    }

   // def hello = input id: 'CustomId', message: 'Want to continue?', ok: 'Yes', parameters: [string(defaultValue: 'world', description: '', name: 'hello')]

    stages {

        //stage('build docker image') {
          //  steps {
         //       sh "docker build --no-cache --iidfile image-id ."
         //   }
       // }

        stage('Build and Push the image in to AWS ECR Repo') {
            steps {
		    withAWS(credentials: 'ecr_access_credential', region: 'us-east-1') {
                sh 'ls'
		//sh "$(aws ecr get-login --no-include-email --region us-east-1)"
		sh "${env_path}/aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 045368729820.dkr.ecr.us-east-1.amazonaws.com"
		//sh "docker build -t ${SIA_NAME}/${CAT} ."	
		sh "docker build --no-cache --iidfile image-id ."	    
		sh "docker tag \$(cat image-id) 045368729820.dkr.ecr.us-east-1.amazonaws.com/dev-app:${PROFILE}_${env.BUILD_NUMBER}"
                sh "docker push 045368729820.dkr.ecr.us-east-1.amazonaws.com/dev-app:${PROFILE}_${env.BUILD_NUMBER}"
		    }
            }
        }
	stage('Dev Deploy') {
            steps {
		sh "cd tfvarsint/"
                sh "ls -l"
		sh "export AWS_PROFILE=int"
		sh "AWS_PROFILE=int ${env_path}/terraform init"
		sh "AWS_PROFILE=int ${env_path}/terraform validate -var-file=var.tfvars"
		sh "AWS_PROFILE=int ${env_path}/terraform plan -var-file=var.tfvars"
		sh "AWS_PROFILE=int ${env_path}/terraform apply -var-file=var.tfvars --auto-approve"

            }
        }		
    
    
		
    }
}

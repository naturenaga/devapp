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

        stage('Push to AWS CRP registry') {
            steps {
                sh 'ls'
            }
        }
	 
        stage('Approval') {
            // no agent, so executors are not used up when waiting for approvals
            agent none
            steps {
                script {
                   // def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'rkivisto,admin', parameters: [choice(choices: ['0', '1'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                    //sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
			
	           //def tok = UUID.randomUUID().toString()
		   //mail to: 'naturenaga.j@gmail.com', subject: 'Ready to roll?', mimeType: 'text/html', body: """
	  	   //Please <a href="${env.JENKINS_URL}pipeline-inputs/${tok}/proceed">approve me</a>!
		   //"""
		   //input message: 'Ready?', token: tok
		    //def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'rkivisto,admin', description: 'Hours to delay deployment?'
                    //mail to: 'naturenaga.j@gmail.com', subject: 'Ready to roll?', mimeType: 'text/html', body: """
	  	    //Please <a href="${env.JENKINS_URL}${env.JOB_BASE_NAME}${env.BUILD_NUMBER}"//proceed">approve me</a>!
			
		   mail (to: 'naturenaga.j@gmail.com',
   	 	   subject: "Job '${env.JOB_BASE_NAME}' (${env.BUILD_NUMBER}) is waiting for input",
   		   body: "Please go to console output of ${env.BUILD_URL}console to approve or Reject.");
	 	   def userInput = input(id: 'userInput', message: 'Job A Failed do you want to build Job B?', ok: 'Yes', submitter: 'rkivisto,admin', parameters: [choice(choices: ['0'], description: 'Hours to delay deployment?', name: 'deploymentDelay')])
		   sleep time: userInput.toInteger(), unit: 'HOURS'
		   
			}
            	}
        }
	
        stage('Email Notification') {
            steps {
		    
		    sh 'ls'
		  
		 		
            }
        }
		
    }
}

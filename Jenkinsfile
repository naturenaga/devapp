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
                    //def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'rkivisto,admin', parameters: [choice(choices: ['0', '1'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                    //sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
			
	           //def tok = UUID.randomUUID().toString()
		   //mail to: 'naturenaga.j@gmail.com', subject: 'Ready to roll?', mimeType: 'text/html', body: """
	  	   //Please <a href="${env.JENKINS_URL}pipeline-inputs/${tok}/proceed">approve me</a>!
		   //"""
		   //input message: 'Ready?', token: tok
		   
		   mail to: 'naturenaga.j@gmail.com', subject: 'Ready to roll?', mimeType: 'text/html', body: """
	  	   Please <a href="${env.JENKINS_URL} ${env.JOB_NAME} ${env.BUILD_NUMBER}/proceed">approve me</a>!
		   """
			

                	}
            	}
        }
	
        stage('Email Notification') {
            steps {
		    mail bcc: '', body: 'Hello', cc: '', from: '', replyTo: '', subject: 'Docker Build', to: 'naturenaga.j@gmail.com'
		    //input 'Find the URL'
		    //println "echo $hello"
		  // emailext (
   		   //subject: "Job '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
    		   //body: """<p>Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a></p>""",
		   //to: "naga7482@gmail.com",
    		   //from: "naturenaga.j@gmail.com"
		  
		    // mail (to: 'naturenaga.j@gmail.com',
    		   //subject: "Job '${env.JOB_BASE_NAME}' (${env.BUILD_NUMBER}) is waiting for input",
    		   //body: "Please go to console output of ${env.BUILD_URL} to approve or Reject.");
    		   //def userInput = input(id: 'userInput', message: 'Job A Failed do you want to build Job B?', ok: 'Yes')
		 		
            }
        }
		
		
    }
}

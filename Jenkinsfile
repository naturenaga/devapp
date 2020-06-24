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
                    def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'rkivisto,admin', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                    sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
                }
            }
        }
        stage('Email Notification') {
            steps {
		    //mail bcc: '', body: 'Hello', cc: '', from: '', replyTo: '', subject: 'Docker Build', to: 'naturenaga.j@gmail.com'
		    //input 'Find the URL'
		    //println "echo $hello"
		   emailext (
   		   subject: "Job '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
    		   body: """<p>Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a></p>""",
		   to: "naga7482@gmail.com",
    		   from: "naturenaga.j@gmail.com"
		 )
		
            }
        }
		
		
    }
}

node {
  stage 'Checkout'
  git 'https://github.com/naturenaga/devapp.git'
  
 
  stage 'Docker build'
  docker.build('demo')
 
  stage 'Docker push'
  docker.withRegistry('https://1234567890.dkr.ecr.us-east-1.amazonaws.com', 'ecr_access_credential') {
    docker.image('demo').push('latest')
  }
}
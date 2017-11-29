pipeline {
  
  agent any
  
  stages {
    stage('Build') {
      steps {
	step([$class: 'DockerBuilderPublisher', cleanImages: true, cleanupWithJenkinsJobDelete: true, cloud: 'lxdocapt14.toyota-europe.com', dockerFileDirectory: '', pullCredentialsId: '', pushCredentialsId: 'toyota-dtr', pushOnSuccess: true, tagsString: 'toyota/hellonode'])
      }
    }
  
  stage('Test') {
      steps {
          echo 'Hello from Test'
      }
    }

    stage('Deploy') {
      
      steps {
      
      	withDockerRegistry([credentialsId: 'toyota-dtr', url: 'https://dockerdtrtest.toyota-europe.com']) {
          // some block
      	}

      }
      
    }
  
  }
  
}

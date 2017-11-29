pipeline {
  
  agent any
  
  stages {
    stage('Build') {

      steps {

	step([$class: 'DockerBuilderPublisher', cleanImages: true, cleanupWithJenkinsJobDelete: true, cloud: '', dockerFileDirectory: '', pullCredentialsId: '', pushCredentialsId: '', pushOnSuccess: false, tagsString: 'toyota/hellonode'])

      }
    }

  stage('Test') {
      steps {
          echo 'Hello from Test'
      }
    }

    stage('Deploy') {
      
      steps {
          echo 'Hello from Deploy'
      }
      
    }
  
  }
  
}

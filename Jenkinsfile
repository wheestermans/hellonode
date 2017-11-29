node {

    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        echo 'Building the image'
        app = docker.build("toyota/hellonode")
        sh 'docker images'
    }

    stage('Test image') {
        echo 'Testing the image'
        app.inside {
            sh 'node --version'
        }
    }

    stage('Push image') {
        echo 'Pushing the image'
        docker.withRegistry('http://dockerdtrtest.toyota-europe.com/', 'toyota-dtr') {
	    /* app.push("${env.BUILD_NUMBER}") */
	    app.push("latest")
	
        }
    }

}


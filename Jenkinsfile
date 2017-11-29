node {

    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("toyota/hellonode")
    }

    stage('Test image') {
        app.inside {
            sh 'node --version'
        }
    }

    stage('Push image') {
        docker.withRegistry('http:\\\\dockerdtrtest.toyoyta-europe.com', 'toyota-dtr') {
	    /* app.push("${env.BUILD_NUMBER}") */
	    login
            app.push("latest")
        }
    }
}


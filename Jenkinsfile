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
            sh 'curl -f http://127.0.0.1:8000'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://dockerdtrtest.toyota-europe.com', 'toyota-dtr') {
            /* app.push("${env.BUILD_NUMBER}") */
            app.push("latest")
        }
    }
}


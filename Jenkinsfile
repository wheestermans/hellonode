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
	def userInput = input(
	    id: 'userInput', message: 'Let\'s promote?', parameters: [
		[$class: 'TextParameterDefinition', defaultValue: 'docker', description: 'User', name: 'user'],
		[$class: 'TextParameterDefinition', defaultValue: '', description: 'Password', name: 'password']
	    ])  
	echo ("User: " + userInput['user'])
	echo ("Password: " + userInput['password'])
        sh 'docker login http://dockerdtrtest.toyota-europe.com -u docker -p toydocker123'
        docker.withRegistry('http://dockerdtrtest.toyota-europe.com/', 'toyota-dtr') {
	    /* app.push("${env.BUILD_NUMBER}") */
	    app.push("latest")
	
        }
    }

}


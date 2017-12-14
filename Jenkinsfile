node ('remote-slave'){

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
	    id: 'userInput', message: 'Enter credentials for Toyota DTR', parameters: [
		[$class: 'TextParameterDefinition', defaultValue: 'docker', description: 'User', name: 'user'],
		[$class: 'TextParameterDefinition', defaultValue: '', description: 'Password', name: 'password']
	    ])  
        sh 'docker login http://dockerdtrtest.toyota-europe.com -u ' + userInput['user'] + ' -p ' + userInput['password']
        docker.withRegistry('http://dockerdtrtest.toyota-europe.com/', 'toyota-dtr') {
	    /* app.push("${env.BUILD_NUMBER}") */
	    app.push("latest")
        }
        sh 'docker logout http://dockerdtrtest.toyota-europe.com'
        sh 'cat /var/jenkins_home/.dockercfg'
        docker.withRegistry('http://dockerdtrtest.toyota-europe.com/', 'toyota-dtr') {
	    /* app.push("${env.BUILD_NUMBER}") */
	    app.push("latest")
        }

    }

}


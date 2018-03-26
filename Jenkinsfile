node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        def customImage = docker.build("dvitali/jenkins-alpine:latest")
        docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-dvitali') {}
            customImage.push()
            customImage.push("build-${env.BUILD_ID}")
        }
        //customImage.push("latest")
    }
}
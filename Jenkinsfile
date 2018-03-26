node {
    checkout scm
    def customImage = docker.build("dvitali/jenkins-alpine:${env.BUILD_ID}")
    customImage.push()
    customImage.push('latest')
}
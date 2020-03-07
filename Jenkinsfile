pipeline {
    environment {
        registry = 'sharpmind/firebase-cli'
        registryCredential = 'dockerhub'
    }
    
    agent {
        label 'docker'
    }

    options {
        timeout(time: 5, unit: 'MINUTES')
        buildDiscarder(logRotator(daysToKeepStr: '10'))
        timestamps()
    }

    triggers {
        pollSCM('H/15 * * * 1-5')
    }

    stages {
        stage('build and deploy docker image'){
            stages {

                // build docker image
                stage('build') {
                    steps {
                        checkout scm

                        echo 'Building branch ' + env.GIT_BRANCH
                        script {
                            dockerImage = docker.build registry + ":$BUILD_NUMBER"
                        }
                    }
                }
                
                // push to docker hub
                stage('push') {
                    steps {
                        script {
                            docker.withRegistry( '', registryCredential ) {
                                dockerImage.push()
                            }
                        }
                    }
                }

                // remove image
                stage('cleanup') {
                    steps {
                        sh "docker rmi $registry:$BUILD_NUMBER"                    
                    }
                }
            }
        }
    }
}

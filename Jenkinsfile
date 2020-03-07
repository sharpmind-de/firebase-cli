pipeline {
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

        // build
        stage('Build'){
            steps {
                checkout scm

                echo 'Building branch ' + env.GIT_BRANCH

                dir ('firebase-cli') {
                    sh './build.sh'
                    sh './release.sh'
                }
            }
        }
    }
}

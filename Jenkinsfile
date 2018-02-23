pipeline {
  agent any

    environment {
        GRGIT_USER  = credentials('github-access-token')
    }
  options {
    buildDiscarder(logRotator(numToKeepStr:'50'))
    timestamps()
    disableConcurrentBuilds()
  }
  stages {
    stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      steps {         
            dir("output") {
                git url: 'https://github.com/chunlinyao/chunlinyao.github.io.git', branch: 'master'
            }
      }
    }
    stage('Build') {
      // Run the maven build
      steps{
            script {
              if (isUnix()) {
                sh "./gradlew --no-daemon publish"
              }
            }
      }
    }
  }
  post {
    always {
      script {
        // current is null means still no error
        if (currentBuild.getResult() != null || (currentBuild.getPreviousBuild() &&
                                                 currentBuild.getPreviousBuild().getResult().toString() != "SUCCESS")) {

          emailext subject: '$DEFAULT_SUBJECT',
          body: '$DEFAULT_CONTENT',
          recipientProviders: [
            [$class: 'CulpritsRecipientProvider'],
            [$class: 'DevelopersRecipientProvider'],
            [$class: 'RequesterRecipientProvider']
          ],
          to: '$DEFAULT_RECIPIENTS'
        }
      }
    }
  }
}

pipeline {
  agent { label 'linux' } // Use 'agent any' if you don't use labels
  environment {
    REPO_URL = 'https://github.com/bala-anand/ip-discovery-ci.git'
    BRANCH   = 'main'
  }
  stages {
    stage('Checkout') {
      steps {
        git branch: "${BRANCH}", url: "${REPO_URL}"
      }
    }
    stage('Execute IP Check') {
      steps {
        sh 'chmod +x ip_check.sh'
        sh './ip_check.sh'
      }
    }
  }
  post {
    always {
      echo 'Pipeline completed.'
    }
  }
}

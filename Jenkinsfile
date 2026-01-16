pipeline {
    agent any   // Runs on any available Ubuntu/Linux agent
    stages {
        stage('Checkout') {
            steps {
                // Clone your GitHub repository
                git branch: 'main', url: 'https://github.com/bala-anand/ip-discovery-ci.git'
            }
        }
        stage('Run Script') {
            steps {
                // Ensure script is executable
                sh 'chmod +x ip_check.sh'
                // Run the script
                sh './ip_check.sh'
            }
        }
    }
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

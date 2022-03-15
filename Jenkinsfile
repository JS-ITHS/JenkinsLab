pipeline {
    agent any
    stages {

        stage('Build') {
            steps {
                bat "mvn compile"
            }
        }
        stage('Test') {
            steps {
                bat "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
        stage('newman') {
            steps {
                sh 'newman run Postman Labb.postman_collection.json --environment Lab Variables.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }
    }
}

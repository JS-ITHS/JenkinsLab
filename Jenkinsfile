pipeline {
    agent any
    stages {

    stage('Checkout') {
            steps {
                git 'https://github.com/JS-ITHS/JenkinsLab.git'
            }
          }

        stage('Junit Build') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Junit Test') {
            steps {
                sh "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
        
      stage('Code Coverage') {
        steps {
            sh "mvn -B cobertura:cobertura"
        }
    }
         stage('API Testing With Newman') {
            steps {
                sh 'newman run Postmanlabb.postman_collection.json --environment Labvariables.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }

        stage('Robot Framework System Tests With Selenium') {
            steps {
                sh 'robot --variable BROWSER:headlesschrome -d Results  Tests'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }
        }
    }
}

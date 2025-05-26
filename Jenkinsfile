pipeline {
    agent any
    tools {
        nodejs "NodeJS 24"
        
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ducluong16/CI-CD_Nodejs_Webpage.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                cd nodejs-webapp
                npm install
                '''
            }
        }

        // stage('Dependency Check') {
        //     steps {
        //         dependencyCheck additionalArguments: ' -- scan ./ -- format HTML ', odcInstallation: 'DP'
        //         dependencyCheckPublisher pattern: ' ** /dependency-check-report.xml'
        //     }
        // }

        stage('Docker Build and Push') {
            steps {
                withDockerRegistry(credentialsId: '9585bea6-924a-40da-891c-b5b5a67f2bba' , url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t ducluong16/nodejs:1.0 .'
                    sh 'docker push ducluong16/nodejs:1.0'
                }
            }
        }
    }
}

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
        stage('Dependency Check') {
        steps {
            dependencyCheck odcInstallation: 'DP', additionalArguments: '-f "HTML, XML,CSV" -s .'
        }
      }
         stage('Docker Build and Push'){
            steps{
                withDockerRegistry(credentialsId: '9585bea6-924a-40da-891c-b5b5a67f2bba') {
                    sh ' docker build -t ducluong16/nodejs:1.0 .'
                    sh ' docker push ducluong16/nodejs:1.0 '
}
            }
        }
    }
}

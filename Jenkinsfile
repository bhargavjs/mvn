pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/bhargavjs/mvn.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-maven-app .'
            }
        }

        stage('Cleanup Old Container') {
            steps {
                sh '''
                if [ "$(docker ps -aq -f name=jenkins-maven)" ]; then
                    echo "Stopping and removing old container..."
                    docker stop jenkins-maven || true
                    docker rm jenkins-maven || true
                else
                    echo "No existing container found"
                fi
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name jenkins-maven -p 8100:8100 jenkins-maven-app'
            }
        }
    }
}

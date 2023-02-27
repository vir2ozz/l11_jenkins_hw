pipeline {
    agent {
        docker {
            image 'vir2ozz/build-image'
            args '-u root'
        }
    }   
    stages {
        stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                sh 'rm -rf l11_jenkins_hw'
            }
        }
        stage('Build') {
            steps {
                sh 'git clone https://github.com/vir2ozz/l11_jenkins_hw.git'
                dir('l11_jenkins_hw') {
                    sh 'mvn package'
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t vir2ozz/hello-app .'
            }
        }
        stage('Deploy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred_vir2ozz', url: 'https://index.docker.io/v1/')]) {
                    sh 'docker push vir2ozz/build-image:latest'
                }
            }
        }
    }
}

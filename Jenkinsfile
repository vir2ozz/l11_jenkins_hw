pipeline {
    agent {
        docker {
            image 'vir2ozz/build-image'
            args '-u root'
        }
    }
    stages {
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
                withCredentials([usernamePassword(credentialsId: '10874465-2c8d-4045-ad92-c351a50bb30f', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                }
                sh 'docker push vir2ozz/hello-app'
            }
        }
    }
}

pipeline {
    agent {
        docker {
            image 'vir2ozz/jenkins-java-builder:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                git 'https://github.com/vir2ozz/l11_jenkins_hw.git'
                sh 'mvn package'
            }
        }
        stage('Create Image') {
            steps {
                sh 'docker build -t vir2ozz/hello-world:latest .'
            }
        }
        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: '10874465-2c8d-4045-ad92-c351a50bb30f', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                }
                sh 'docker push vir2ozz/hello-world:latest'
            }
        }
    }
}

pipeline {
    agent {
        docker {
            image 'vir2ozz/java-build:latest'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Dockerize') {
            steps {
                sh 'docker build -t vir2ozz/hello-world .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: '10874465-2c8d-4045-ad92-c351a50bb30f', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                    sh 'docker push vir2ozz/hello-world'
                }
            }
        }
    }
}

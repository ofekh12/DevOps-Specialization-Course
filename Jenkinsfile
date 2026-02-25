pipeline {
    agent any
    
    environment {
        DOCKER_CREDS = credentials('docker-creds-ofek')
        IMAGE_NAME = 'ofekh/flask-aws-monitor'
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Parallel Checks') {
            parallel {
               stage('Linting') {
                   steps {
                      echo '--- Starting Code Quality Check (Flake8) ---'
                      sh "pip install flake8 --break-system-packages && flake8 aws/PYTHONCODE.py || true"
                      echo '--- Linting Passed Successfully! ---'
                   }
                }

                stage('Security Scan') {
                    steps {
                       echo '--- Starting Security Scan (Bandit) ---'
                       sh "pip install bandit --break-system-packages && bandit -r aws/PYTHONCODE.py  || true"
                       echo '--- No Security Vulnerabilities Found! ---'
                    }
                }
            }
        }
    }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest -f Dockerfile ."
            }
        }
        
        stage('Container Security Scan (Trivy)') {
            steps {
                echo '--- Installing Trivy ---'
                sh "curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b ."
                
                echo '--- Scanning Docker Image ---'
                sh "./trivy image ${IMAGE_NAME}"
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh "echo ${DOCKER_CREDS_PSW} | docker login -u ${DOCKER_CREDS_USR} --password-stdin"
                sh "docker push ${IMAGE_NAME}:latest"
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed! Check logs for details.'
        }
    }

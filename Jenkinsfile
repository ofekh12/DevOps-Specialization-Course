pipeline {
    agent any
    
    environment {
        DOCKER_CREDS = credentials('docker-creds-ofek')
        IMAGE_NAME = 'ofekh/flask-aws-monitor'
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/ofekh12/DevOps-Specialization-Course.git'
            }
        }
        
        stage('Linting') {
            steps {
                echo '--- Starting Code Quality Check (Flake8) ---'
                sh "pip install flake8"
                sh "flake8 aws/PYTHONCODE.py --ignore=E501"
                echo '--- Linting Passed Successfully! ---'
            }
        }

        stage('Security Scan') {
            steps {
                echo '--- Starting Security Scan (Bandit) ---'
                sh "pip install bandit"
                sh "bandit -r aws/PYTHONCODE.py"
                echo '--- No Security Vulnerabilities Found! ---'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
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
                sh "docker push ${IMAGE_NAME}"
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
}
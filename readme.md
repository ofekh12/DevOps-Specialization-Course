# AWS Resource Monitor - Full CI/CD Pipeline Project

This project presents a production-ready **Flask** application designed to monitor and display AWS infrastructure components (EC2, VPCs, Load Balancers, and AMIs). The project’s core is a fully automated **CI/CD Pipeline** built with **Jenkins**, ensuring high standards of code quality, security, and delivery.

## 🛠 Project Overview
The application uses the **Boto3 SDK** to fetch real-time data from AWS and displays it through a web interface. The entire lifecycle—from code commit to deployment-ready container—is managed by a Jenkins Pipeline-as-Code.

## 🚀 The CI/CD Pipeline
The pipeline is composed of several automated stages to ensure the reliability and security of the application:

1.  **Source Control (Git)**: Automated code retrieval from GitHub.
2.  **Code Quality (Linting)**: Continuous inspection using **Flake8** to maintain clean and readable Python code.
3.  **Security Scanning (SAST)**: Static Analysis using **Bandit** to identify security vulnerabilities and "bad smells" in the code.
4.  **Containerization**: Building a customized **Docker** image for the application.
5.  **Image Security (Vulnerability Scan)**: Utilizing **Trivy** to scan the Docker image layers for known vulnerabilities (CVEs).
6.  **Artifact Distribution**: Pushing the verified, secure image to **Docker Hub**.

## 💻 Tech Stack
* **Backend**: Python / Flask
* **Cloud SDK**: Boto3 (AWS)
* **CI/CD**: Jenkins
* **Security & Quality**: Bandit, Trivy, Flake8
* **Containerization**: Docker

## ✅ Proof of Success
The following results confirm the successful execution of the entire pipeline and the delivery of the application:

### Jenkins Pipeline Stages
*Verification of all automated stages passing successfully:*
<img width="1581" height="866" alt="Jenkins_Stage_View_Success" src="https://github.com/user-attachments/assets/46098c9f-08af-4602-ba3e-ed2ae7949a1c" />

### Docker Hub Verification
*The final secured image available in the cloud registry:*
<img width="1013" height="653" alt="DockerHub_Image_Push_Verified" src="https://github.com/user-attachments/assets/8b009fec-e823-4997-97ba-c180c3162b4e" />

## 📦 Deployment
To run the final version of this project:
```bash
docker pull ofekh/flask-aws-monitor:latest
docker run -p 5001:5001 \
  -e AWS_ACCESS_KEY_ID=your_key \
  -e AWS_SECRET_ACCESS_KEY=your_secret \
  ofekh/flask-aws-monitor

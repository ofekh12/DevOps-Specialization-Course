# 🌩️ Terraform EC2 Project

This project provisions an **AWS EC2 instance** using **Terraform** in the region `us-east-1`.  
It demonstrates the use of Terraform basics such as **providers**, **variables**, **data sources**, **outputs**, and **resource configuration**.

---

## 📁 Project Structure



Terraform/
└── ec2/
├── main.tf # Main configuration – defines EC2 instance
├── data.tf # Fetches external data (AMI, VPC, Subnet)
├── provider.tf # AWS provider configuration
├── variable.tf # Variables such as instance type, key pair, and IP restriction
├── outputs.tf # Exports useful information after deployment
└── builder_key.pem # SSH key for instance access (should NOT be uploaded to GitHub)


---

## ⚙️ Features

- Automatically pulls the latest **Ubuntu 22.04 AMI**.
- Creates an **EC2 instance** with tags.
- Restricts SSH access to your **local public IP** only.
- Outputs instance **ID, public IP, and AMI ID**.
- Uses modular and organized Terraform structure.

---

## 🔑 Prerequisites

Before running the project, make sure you have:
- An **AWS account** with sufficient permissions.
- **Terraform** installed (`v1.5.0` or higher recommended).
- **AWS credentials** set in your terminal:
  ```bash
  export AWS_ACCESS_KEY_ID="your-access-key"
  export AWS_SECRET_ACCESS_KEY="your-secret-key"

🚀 Deployment Steps

Navigate to the project directory:

cd Terraform/ec2


Initialize Terraform:

terraform init


Validate the configuration:

terraform validate


Preview the resources to be created:

terraform plan


Apply the configuration:

terraform apply


When done, destroy the instance to avoid costs:

terraform destroy

🧩 Outputs Example

After running terraform apply, Terraform will display something like:

Outputs:

instance_public_ip = "3.90.120.57"
instance_id        = "i-0abcd1234ef567890"
ami_id             = "ami-0a1b2c3d4e5f6g7h8"

⚠️ Notes

The file builder_key.pem should never be uploaded to GitHub for security reasons.

If Terraform is stuck on plugin installation, delete the .terraform/ folder and re-run terraform init.

Use terraform fmt to keep files clean and formatted.

👩‍💻 Author

Ofek Harari
DevOps Student | AWS & Terraform Enthusiast
📧 Contact: ofekharari121@gmail.com
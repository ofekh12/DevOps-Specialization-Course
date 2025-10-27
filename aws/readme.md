# Project Cloud

This project displays AWS resources using a Flask web application.  
It connects to EC2, ELB, and VPC services and presents the information in HTML tables.

---

## Requirements

- Python 3.13 or higher  
- Flask  
- Boto3  
- AWS Access Key and Secret Key (recommended to use Environment Variables)

---

## Installation & Running

1. Install dependencies:

```bash
pip install flask boto3
Set your AWS credentials as environment variables:

bash
Copy code
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
Run the application:

bash
Copy code
python PYTHONCODE.py
Open your browser and go to:

http://127.0.0.1:5001

🧪 Features
Display EC2 Instances

Display VPCs

Display Load Balancers

Display available AMIs

📄 Source Code
Written in Python

Uses Flask to display AWS resources in a web browser

📚 Related Resources
AWS SDK for Python (Boto3)

🤝 Contributing
If you want to contribute, please open an Issue or submit a Pull Request. All contributions are welcome!

📧 Contact
For questions or suggestions, contact: ofekh12@example.com
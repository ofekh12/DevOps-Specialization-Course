FROM python:alpine3.17
WORKDIR /app
COPY aws/requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt
COPY . .
CMD ["python", "aws/PYTHONCODE.py"]

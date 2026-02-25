FROM python:3.12-slim
WORKDIR /app
COPY aws/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY aws/ .
EXPOSE 5001
CMD ["python", "PYTHONCODE.py"]

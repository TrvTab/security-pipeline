FROM python:3.12-slim

WORKDIR /app

# All these paths are relative to /app/ (the context)
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
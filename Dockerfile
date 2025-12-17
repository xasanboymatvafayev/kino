FROM python:3.13-slim

# System libraries for Pillow
RUN apt-get update && apt-get install -y \
    libjpeg-dev zlib1g-dev libtiff-dev libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

CMD ["python", "main.py"]

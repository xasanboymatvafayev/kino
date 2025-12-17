# Python 3.12 slim bazasidan foydalanamiz
FROM python:3.12-slim

# System kutubxonalarini o‘rnatish (Pillow va boshqa paketlar uchun kerak)
RUN apt-get update && apt-get install -y \
    libjpeg-dev zlib1g-dev libtiff-dev libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

# Ishchi katalog
WORKDIR /app

# Loyihani containerga nusxalash
COPY . /app

# pip yangilash va requirements o‘rnatish
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

# Botni ishga tushirish (root katalogdagi main.py)
CMD ["python", "main.py"]

FROM python:3.10-slim

WORKDIR /app

# Install system deps for Pathway (Rust runtime)
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

CMD ["bash"]

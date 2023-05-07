FROM python:3.10.11-alpine3.17 

COPY requirements.txt .

# installing required dependencies for building pandas
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    g++ \
    musl-dev \
    python3-dev \
    libc-dev \
    libffi-dev \
    openssl-dev \
    libstdc++ \
    make && \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt 

ENV PATH=":/py/bin:$PATH"

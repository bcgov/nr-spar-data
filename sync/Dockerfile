FROM python:3.13.0a4-slim AS build

# Packages
RUN apt update && \
    apt install -y --no-install-recommends build-essential gcc libpq-dev python3-dev

# Disable cache dir, disable upgrade message
ARG PIP_NO_CACHE_DIR="off"
ARG PIP_DISABLE_PIP_VERSION_CHECK="on"
ARG PIP_DEFAULT_TIMEOUT="100"
ARG PYTHONDONTWRITEBYTECODE="1"
ARG PYTHONUNBUFFERED="1"

# Copy files and install requirements
WORKDIR /app
COPY requirements.txt .
RUN pip install -r ./requirements.txt

# Start the app
WORKDIR /app/src
COPY src .
USER 1001
CMD python3 main.py

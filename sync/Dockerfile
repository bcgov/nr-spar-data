FROM python:3.10-slim-bullseye AS build

# Packages
RUN apt update && \
    apt install -y --no-install-recommends gcc libpq-dev python3-dev

# Disable cache dir, disable upgrade message, create .venv in project dir
ARG PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    POETRY_VIRTUALENVS_IN_PROJECT=1

# Copy files and install requirements
WORKDIR /app
COPY . .
RUN pip install -r ./requirements.txt

# Start the app
WORKDIR /app/src
RUN echo python3 main.py

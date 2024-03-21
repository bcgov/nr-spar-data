FROM python:3.10-slim-bullseye AS build

# Packages
RUN apt update && \
    apt install -y --no-install-recommends gcc libpq-dev python3-dev

# Disable cache dir, disable upgrade message, create .venv in project dir
ARG PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

USER 1001
CMD python3 -c "import sys; print(sys.version)"

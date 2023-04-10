# Use an official Python runtime as a parent image
FROM ghcr.io/onedr0p/alpine:rolling@sha256:e6a2407a15b7e557fb6617a592f672b004b6764887438502c047a567ec616e40

ARG VERSION

USER root

RUN \
  apk add --no-cache \
    python3 \
    py3-pip \
  && \
  apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    postgresql-dev \
    zlib-dev \
    jpeg-dev \
    libwebp-dev \
    openssl-dev \
    libffi-dev \
    cargo \
    openldap-dev \
    python3-dev \
    git \
    nodejs \
    yarn

RUN \
  echo -n "INPUT ( libldap.so )" > /usr/lib/libldap_r.so && \
  chown -R kah:kah /app && \
  chmod -R u=rwX,go=rX /app

USER kah

#Print all logs without buffering it.
ENV PYTHONUNBUFFERED 1

# Set the working directory to /app
WORKDIR /app

RUN \
  git clone https://github.com/TandoorRecipes/recipes.git ./ && \
  git checkout tags/${VERSION} && \
  python -m venv venv && \
  python -m pip install --upgrade pip && \
  venv/bin/pip install wheel==0.37.1 && \
  venv/bin/pip install setuptools_rust==1.1.2 && \
  venv/bin/pip install -r requirements.txt --no-cache-dir && \
  cd vue && \
  yarn install && \
  yarn build

USER root

RUN \
  apk --purge del .build-deps

USER kah
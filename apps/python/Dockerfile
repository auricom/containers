# Use an official Python runtime as a parent image
FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:defe5e1d3d576d7df31ee7cb252509bff1127bd9e540c1ccea259d2e3d1b57b8

USER root

RUN \
  apt-get -qq update && \
  apt-get -qq install -y \
    build-essential \
    python3 \
    python3-pip \
    python3-dev \
    libpq-dev

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./apps/python/requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

USER kah

CMD ["/bin/bash"]

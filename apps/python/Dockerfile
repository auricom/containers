# Use an official Python runtime as a parent image
FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:5d330223a882c288b9469758bb1841bb22b28af1c64ff105e8b288eb88b74fc6

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

# Use an official Python runtime as a parent image
FROM ghcr.io/onedr0p/alpine:rolling@sha256:5d973006bf93ba66e38758694dfed6df091a13e712b6a075f7ed7bb6fd8c2189

USER root

RUN apk add --no-cache --upgrade \
    build-base \
    postgresql-dev \
    py3-pip \
    python3-dev \
    python3

USER kah

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./apps/github-pushover-notifier/requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

CMD ["/bin/bash"]

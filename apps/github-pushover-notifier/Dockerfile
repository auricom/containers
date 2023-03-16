# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./apps/github-pushover-notifier/github_pushover_notifier.py /app
COPY ./apps/github-pushover-notifier/requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run gunicorn when the container launches
CMD ["python", "./apps/github-pushover-notifier/github_pushover_notifier.py"]

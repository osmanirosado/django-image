FROM python:3.8-alpine

ENV PYTHONUNBUFFERED 1

# Install project requirements
COPY requirements.txt /root
RUN pip install --no-cache-dir -r /root/requirements.txt

# Create the project directory
RUN mkdir -p /home/django/project

# Copy project code into container
COPY . /home/django/project

# Change to project directory
WORKDIR /home/django/project

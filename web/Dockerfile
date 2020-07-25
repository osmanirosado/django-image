FROM python:3.8

ENV PYTHONUNBUFFERED 1

# Install project requirements
COPY requirements.txt /root
RUN pip install --no-cache-dir -r /root/requirements.txt

# Create the code directory
RUN mkdir -p /home/django/code

# Copy project code into container
COPY . /home/django/code

# Change to project directory
WORKDIR /home/django/code

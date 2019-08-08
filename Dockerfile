FROM python:3.6

ARG version=1.11
ARG projectname=website

ENV PYTHONUNBUFFERED 1

ADD pip.conf /etc/pip.conf

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip
# Install Django
RUN pip install --no-cache-dir Django==${version}

# Create an user for Django
# -r To create a system user and a system group
# -m To create the user's home directory
# -g To specify the group name of the user's initial login group
# -l Do not log init, following a recomendation of docker documentation
# -g Use 1000 as group's ID to match debian systems default group's ID. 
# -u Use 1000 as user's ID to match debian systems default user's ID.
RUN groupadd -r -g 1000 django && useradd -l -r -m -u 1000 -g django django

# Change to user django
USER django
# Change to django home directory
WORKDIR /home/django

# Create a Django project
RUN django-admin startproject ${projectname}

# Change to project directory
WORKDIR /home/django/${projectname}

# Make migrations
RUN python manage.py migrate

# Run Django development server on start
CMD python manage.py runserver 0.0.0.0:8000
# Expose the server port
EXPOSE 8000

# Create a volume for django home directory
VOLUME /home/django

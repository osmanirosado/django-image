FROM python:3.8

ENV PYTHONUNBUFFERED 1

# Create an user for Django
# -r To create a system user and a system group
# -m To create the user's home directory
# -g To specify the group name of the user's initial login group
# -l Do not log init, following a recomendation of docker documentation
# -g Use 1000 as group's ID to match debian systems default group's ID.
# -u Use 1000 as user's ID to match debian systems default user's ID.
RUN groupadd -r -g 1000 django && useradd -l -r -m -u 1000 -g django django

# Install project requirements
COPY requirements.txt /root
RUN pip install --no-cache-dir -r /root/requirements.txt

# Change to django user
USER django
WORKDIR /home/django

# Create the code directory
RUN mkdir code

# Copy project code into container
COPY --chown=django:django . code

# Change to code directory
WORKDIR code

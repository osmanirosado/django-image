FROM python:3.6

ARG version=1.11

ENV PYTHONUNBUFFERED 1

ADD pip.conf /etc/pip.conf

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir Django==${version}

RUN groupadd -r django && useradd --no-log-init -r -m -g django django
USER django

WORKDIR /home/django

RUN django-admin startproject website

WORKDIR /home/django/website

RUN python manage.py migrate

RUN python manage.py startapp defaultapp

CMD python manage.py runserver 0.0.0.0:8000

EXPOSE 8000

VOLUME /home/django

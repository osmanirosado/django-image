FROM python:3.6

ARG version=1.11

ENV PYTHONUNBUFFERED 1

ADD pip.conf /etc/pip.conf

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir Django==${version}

WORKDIR /home/

RUN django-admin startproject website

WORKDIR /home/website

RUN python manage.py migrate

RUN python manage.py startapp defaultapp

CMD python manage.py runserver 0.0.0.0:8000

EXPOSE 8000

VOLUME /home/website


# Django Image

## How to use

Crear un directorio para el proyecto

```[bash]
mkdir django-example
```

Extraer el proyecto de la imagen de django

```[bash]
docker create --name django-1.11 django:1.11
docker cp django-1.11:/home/django/website website
docker rm django-1.11
```

En el directorio del proyecto crear un archivo docker-compose.yml

```
version: "3.2"

services:

  django:
    image: django:1.11
    ports:
      - 8000:8000
    volumes:
      - ./website:/home/django/website

```

Iniciar el servidor de django

```[bash]
docker-compose up
```

Todo esta listo para empezar a trabajar. 
Por ejemplo se puede crear la primera aplicacion de django.

```[bash]
docker-compose exec django python manage.py startapp polls
```

## Build

### Django 1.11

```[bash]
docker build -t django:1.11 --build-arg version=1.11 .
```

### Django 2.2

```[bash]
docker build -t django:1.11 --build-arg version=2.2 .
```

## Run

Ejecutar el servidor de desarrollo

```[bash]
docker run --rm -it -p 8000:8000 django:1.11
```

## Save

Salvar la imagen

```[bash]
docker save -o django-1.11.tar django:1.11
```

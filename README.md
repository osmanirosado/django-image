# Django Image

A simple Docker configuration to create Django examples.

## Fisrt steps

Start a Django project with name mysite. You can use a different name.

```[bash]
docker-compose run web django-admin.py startproject mysite .
```

After the docker-compose command completes, list the contents of your project.

```[bash]
ls -l web
```

Start Django development server.

```[bash]
docker-compose up
```

## Build

Build the image of web service

```[bash]
docker-compose build web
```

Save the image built

```[bash]
docker save django-image_web -o django-image_web.tar
```

## References

- [How to get Django](https://www.djangoproject.com/download/)
- [Quickstart: Compose and Django](https://docs.docker.com/compose/django/)
- [Running a Docker container as a non-root user](https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15)

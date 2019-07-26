# Django Image

## Build

### Django 1.11

```[bash]
docker build -t django:1.11 .
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

## Extract project files

Crear un contenedor

```[bash]
docker create --name django django:1.11
```

Copiar los archivos desde el contenedor

```[bash]
docker cp django:/home/website website
```

Eliminar el contenedor

```[bash]
docker rm django
```

## Save

Salvar la imagen

```[bash]
docker save -o django_1-11.tar django:1.11
```

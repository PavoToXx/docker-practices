# 🐳 Docker Essentials & Practices

Este repositorio contiene los ejercicios prácticos y apuntes de mis certificaciones y aprendizaje en Docker. El objetivo de este proyecto es demostrar el dominio en la creación, gestión y despliegue de contenedores, elementos clave para arquitecturas Cloud y MLOps.

## 📂 Estructura del Repositorio

- **Unidad 1:** Interacción básica con contenedores, despliegue de servicios (Nginx, MongoDB) y limpieza del sistema.
- **Unidad 2:** Creación de imágenes personalizadas con Dockerfile, despliegue de una API Flask y gestión de imágenes en Docker Hub.

---

## 🚀 Unidad 1: Fundamentos de Contenedores y Gestión del Sistema

En esta unidad se exploran los comandos esenciales para ejecutar, interactuar y administrar el ciclo de vida de los contenedores, así como las buenas prácticas para la limpieza de recursos.

### 1. Interacción y Ejecución de Comandos en Contenedores

Para iniciar un contenedor interactivo (en este caso, Ubuntu ejecutando el comando `top`):
```bash
docker container run -t ubuntu top
```
Para acceder a un contenedor que ya está en ejecución y abrir una terminal (bash) dentro de él:

# Listar contenedores para obtener el ID
docker container ls

# Ingresar al contenedor de forma interactiva
docker container exec -it <container_id> bash

# (Dentro del contenedor) Mirar los procesos activos
ps -ef 

# Salir del contenedor
exit

2. Pruebas y Despliegue de Imágenes desde Docker Hub
Despliegue de servicios populares utilizando ejecución en segundo plano (--detach), mapeo de puertos (--publish) y asignación de nombres personalizados (--name):

```Bash
# Desplegar un servidor web Nginx (mapeando el puerto 8080 local al 80 del contenedor)
docker container run --detach --publish 8080:80 --name nginx nginx

# Desplegar una base de datos MongoDB especificando una versión (3.4)
docker container run --detach --publish 8081:27017 --name mongo mongo:3.4

# Verificar los contenedores en ejecución
docker container ls
```
3. Detención de Contenedores y Limpieza del Entorno
Es fundamental detener los procesos que no se están utilizando y limpiar el sistema para liberar espacio en disco.

```Bash
# Parar contenedores usando su ID o su nombre asignado
docker container stop <container_id>
docker container stop nginx
docker container stop mongo
Mantenimiento con docker system prune:
```
Este comando elimina todos los objetos de Docker no utilizados (contenedores detenidos, imágenes sin uso, redes y volúmenes).

```Bash
# Eliminar recursos no utilizados (pedirá confirmación)
docker system prune

# Opciones comunes:
# -a, --all        Elimina todas las imágenes no utilizadas (no solo las colgantes o "dangling")
# -f, --force      Ejecuta la limpieza sin pedir confirmación
# --volumes        Incluye los volúmenes no utilizados en la limpieza

# Ejemplo de limpieza profunda sin confirmación:
docker system prune -a --volumes -f
```
🛠️ Unidad 2: Despliegue de una Aplicación Flask y Docker Hub
En esta unidad se aborda la creación de una API básica en Python con Flask, su contenerización y el flujo de trabajo para subir la imagen a un registro público (Docker Hub).

1. Creación de la Aplicación Flask
Primero, generamos un servidor web básico en Python (app_p4.py):
```
Bash
echo 'from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "hello world!"

if __name__ == "__main__":
    app.run(host="0.0.0.0")' > app_p4.py
```
2. Ejecución y Monitoreo del Contenedor
Ejecutamos el contenedor en segundo plano (detached mode) y mapeamos el puerto 5001 de nuestra máquina al puerto 5000 del contenedor:
```
Bash
docker run -p 5001:5000 -d python-hello-world
```
Para verificar los contenedores activos y revisar los registros (logs) del contenedor en ejecución:
```
Bash
# Listar contenedores activos para obtener el ID
docker container ls

# Ver los logs del contenedor
docker container logs [container_id]
```
3. Publicación en Docker Hub
Para compartir la imagen, nos autenticamos en Docker Hub, etiquetamos (tag) la imagen con nuestro nombre de usuario y la subimos al registro:
```
Bash
# Iniciar sesión en Docker Hub
docker login

# Etiquetar la imagen local con el formato de Docker Hub
# (Cambiar 'pavoto' por tu nombre de usuario real en Docker Hub)
docker tag python-hello-world pavoto/python-hello-world

# Subir la imagen al repositorio público
docker push pavoto/python-hello-world
```
4. Actualización de Imágenes
Si se realizan cambios en el código (por ejemplo, en app_p4.py), es necesario reconstruir la imagen antes de volver a subirla:
```
Bash
# Reconstruir la imagen con los nuevos cambios
docker image build -t pavoto/python-hello-world .

# Subir la nueva versión a Docker Hub
docker push pavoto/python-hello-world
```

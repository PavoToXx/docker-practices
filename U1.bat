docker container run -t ubuntu top
::en otra terminal
docker container ls
::para ejecutar comandos dentro del contenedor
docker container exec -it <container_id> bash
::mirar los procesos dentro del contenedor
ps -ef 
::salir del contenedor
exit

::P2

::Probar imagenes de Docker HUB
docker container run --detach --publish 8080:80 --name nginx nginx
::en otra terminal, podemos usar la version que queramos
docker container run --detach --publish 8081:27017 --name mongo mongo:3.4
::para ver los contenedores en ejecucion
docker container ls

::P3

::PARAR los contenedores
docker container stop <container_id>
::Tmabien se puede usar el nombre del contenedor
docker container stop nginx
docker container stop mongo
:: docker system prune
:: 
:: Removes all unused Docker objects (containers, images, networks, and volumes).
:: This command helps free up disk space by cleaning up resources that are no longer in use.
::
:: Usage:
::   docker system prune [OPTIONS]
::
:: Common options:
::   -a, --all              Remove all unused images (not just dangling ones)
::   -f, --force            Do not prompt for confirmation
::   --volumes              Also remove unused volumes
::
:: Examples:
::   docker system prune                    :: Remove unused objects with confirmation
::   docker system prune -f                 :: Remove without confirmation
::   docker system prune -a --volumes -f    :: Remove all unused + volumes without prompt
docker system prune
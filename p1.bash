docker container run -t ubuntu top
#en otra terminal
docker container ls
#para ejecutar comandos dentro del contenedor
docker container exec -it <container_id> bash
#mirar los procesos dentro del contenedor
ps -ef 
#salir del contenedor
exit
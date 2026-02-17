#Probar imagenes de Docker HUB
docker container run --detach --publish 8080:80 --name nginx nginx
#en otra terminal, podemos usar la version que queramos
docker container run --detach --publish 8081:27017 --name mongo mongo:3.4
#para ver los contenedores en ejecucion
docker container ls

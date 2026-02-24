echo 'from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "hello world!"

if __name__ == "__main__":
    app.run(host="0.0.0.0")' > app_p4.py


::P2

docker run -p 5001:5000 -d python-hello-world
docker container logs [container id] 
::Para ver contenedores ID es con
 docker container ls


::P3


::Ve a docker hub y logeate 
::Luego logeate en docker terminal
docker login
::Tagea tu imagen con tu nombre de usuario
docker tag python-hello-world pavoto/python-hello-world
::Luego subela 
docker push pavoto/python-hello-world


::P4

::Para hacer cambios primero buildea
docker image build -t pavoto/python-hello-world .
::Luego sube la nueva imagen
docker push pavoto/python-hello-world





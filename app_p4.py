from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello Beautiful World! YA SOY MAS GRANDE QUE EL DE LA IMAGEN"

if __name__ == "__main__":
    app.run(host="0.0.0.0")

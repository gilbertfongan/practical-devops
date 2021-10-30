import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome to the training on LPI DevOps Tools Engineer By Gilbert Fongan"

@app.route('/about')
def hellowelcome():
    return 'Welcome to the training of the LPI 701-100 Exam'
	
@app.route('/org')
def helloorg():
    return 'GF CENTER'

@app.route('/gilbert')
def helloamine():
    return 'Welcome Gilbert! You have successfully deploy this container'




if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

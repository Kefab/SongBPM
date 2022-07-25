from flask import request, send_file
from fileinput import filename
from flask import Flask
from flask_restful import Resource, Api, reqparse

from example1 import image

app = Flask(__name__)
api = Api(app)

@app.route('/get_image')
def get_image():
    image()
    filename = '2.png'
    return send_file(filename, mimetype='image/png'),200


if __name__ == '__main__':
    app.run()
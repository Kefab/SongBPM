from flask import request, send_file
from fileinput import filename
from flask import Flask
from flask_restful import Resource, Api, reqparse

from SongBPM import getPlot

app = Flask(__name__)
api = Api(app)


@app.route('/get_image')
def get_image():
    name = request.args.get('songName')
    id = request.args.get('id')
    imageName = getPlot(name, id)
    return send_file(imageName, mimetype='image/png'), 200


if __name__ == '__main__':
    app.run('0.0.0.0')

from flask import Flask, request, redirect, url_for
from datetime import datetime

app = Flask(__name__)


@app.route('/upload', methods=['POST'])
def upload_file():
    print(request.data)
    if request.method == 'POST' and 'file' in request.files:
        f = request.files['file']
        f.save(f'uploads/{datetime.now().strftime("%m%d%Y%H%M%S")}.txt')
        return "YEAH"
    return "GOWNO"



@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'


if __name__ == '__main__':
    app.run(host='installed.mattkozlowski.pl')

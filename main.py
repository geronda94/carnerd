from flask import Flask, redirect, url_for, render_template,request
import json


app = Flask(__name__)



@app.route('/')
def index():
    return render_template('index.html')



@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        service = request.form.get('service')
        return service
    else:
        return json.dump('response',200)







if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
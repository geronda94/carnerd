from flask import Flask, redirect, url_for, render_template, request, session
import json
from datetime import datetime, timedelta
import uuid
from pg import products


app = Flask(__name__)
app.secret_key = 'kl2sd34hfjkdalfads5fds46f6a1ds5fdasdsjcnflkad45damfefdsfq235346aefsdropee23'
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(days=1000)

languages = ['ro', 'en', 'ua']





@app.route('/')
def index():
    lang = session.get('lang')
    services = products.get_services(lang=lang)
    num_services = [x for x in range(len(services))] 
    
    return render_template('index.html', lang=lang, languages=languages, services=services,
                           num_services=num_services)



@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        service = request.form.get('service')
        return request.form
    else:
        return json.dump('response',200)



@app.route('/lang/<lang>')
def select_lang(lang):
    session['lang'] = str(lang)
    return redirect(url_for('index'))





























@app.before_request
def before_request():
    if 'lang' not in session:
        session['lang'] = 'ro'
		
    







if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
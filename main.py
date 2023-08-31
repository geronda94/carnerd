from flask import Flask, redirect, url_for, render_template, request, session
import json
from datetime import datetime, timedelta
import uuid
from pg import services
from functions import number_validator, booking_time_list


app = Flask(__name__)
app.secret_key = 'kl2sd34hfjkdalfads5fds46f6a1ds5fdasdsjcnflkad45damfefdsfq235346aefsdropee23'
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(days=1000)

languages = ['ro', 'en', 'ua']
title = {'ro':'Carnerd - Spălătorie auto în București','en':'Carnerd - Car Wash in  the Bucuresti','ua':'Carnerd - Автомойка в Бухаресте'}




@app.route('/')
def index():
    lang = session.get('lang')
    
    
    return render_template('index.html', lang=lang, languages=languages, services=services.get_services(lang=lang),
                            title=title.get(lang))



@app.route('/register', methods=['POST'])
def register():
    lang = session.get('lang')

    if request.method == 'POST':
        service_link = request.form.get('service')
        phone = number_validator(request.form.get('phone'))
        booking_date = request.form.get('booking-date')
        #Получаем еще раз услугу из бд
        service_dict = services.get_service(service_link=service_link, lang=lang)[0]
        service_name = service_dict.get('service_name')
        if phone:
            #Заносим полученные от пользователя данные в бд start_client если этот номер у нас в первый раз попался
            booking_id = services.start_clients(service_link=service_link, sid=str(session.get('uid')), service_name=service_name ,phone=phone, booking_date=booking_date)

            phone_failed=False
            
        else:
            phone_failed=True
            
        return render_template('register.html', title=title.get(lang), service=service_dict,
                                   booking_date=booking_date, phone=phone, time_list=booking_time_list(), phone_failed=phone_failed)


@app.route('/lang/<lang>')
def select_lang(lang):
    session['lang'] = str(lang)
    return redirect(url_for('index'))


























@app.before_request
def before_request():
    if not session.get('uid'):
        session['uid'] = uuid.uuid4()
        session['created'] = datetime.now().strftime('%Y-%m-%d %H:%M')

    if 'lang' not in session:
        session['lang'] = 'ro'

	
    







if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
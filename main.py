from flask import Flask, redirect, url_for, render_template, request, session, flash
import json
from datetime import datetime, timedelta
import uuid
from pg import services
from functions import number_validator, booking_time_list
from lang import index_lang


app = Flask(__name__)
app.secret_key = 'kl2sd34hfjkdalfads5fds46f6a1ds5fdasdsjcnflkad45damfefdsfq235346aefsdropee23'
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(days=1000)

languages = ['ro', 'en', 'ua']
title = {'ro':'Carnerd - Spălătorie auto în București','en':'Carnerd - Car Wash in  the Bucuresti','ua':'Carnerd - Автомойка в Бухаресте'}




@app.route('/')
def index():
    lang = session.get('lang')
    
    
    return render_template('index.html', lang=lang, languages=languages, services=services.get_services(lang=lang),
                            title=title.get(lang), index_lang=index_lang.get(lang))



@app.route('/register', methods=['POST'])
def register():
    lang = session.get('lang')

    if request.method == 'POST':
        phone = number_validator(request.form.get('phone'))        
        service_link = request.form.get('service_link')        
        booking_date = request.form.get('booking_date')

        #Получаем еще раз услугу из бд
        service_dict = services.get_service(service_link=service_link, lang=lang)[0]
        service_name = service_dict.get('service_name')
        
        
        if phone and request.form.get('confirm'):
            
            time_need = request.form.get('time_need')
            service_name = request.form.get('service_name')
            service_link = request.form.get('service_link')
            service_id = request.form.get('service_id')
            booking_date = request.form.get('booking_date')
            client_phone = phone
            ip_address = request.remote_addr
            session_id = str(session.get('uid'))
            

            if 'Select' not in request.form.get('booking_time'):
                booking_time = request.form.get('booking_time')
            else:
                booking_time = None


            print(booking_date)
            if 'Select' not in request.form.get('car_type') and request.form.get('car_type'):
                car_type = str(request.form.get('car_type')).split('~')[0]
                service_price = str(request.form.get('car_type')).split('~')[1]

                
            else:
                car_type, service_price = None, None

            send_order = services.service_booking(sid=session_id, 
                                                  ip_address=ip_address,
                                                  booking_date=booking_date,
                                                  booking_time=booking_time,
                                                  client_phone=client_phone,
                                                  service_name=service_name,
                                                  service_link=service_link,
                                                  service_price=service_price,
                                                  car_type=car_type, lang=lang)

            if send_order:
                flash_message = index_lang.get(lang).get('success_info')
                flash(flash_message, 'success')


            else:
                flash_message = index_lang.get(lang).get('error_info')
                flash(flash_message, 'error')

            

            return redirect(url_for('index'))
        

        if phone and not request.form.get('confirm'):
            #Заносим полученные от пользователя данные в бд start_client если этот номер у нас в первый раз попался
            services.start_clients(service_link=service_link, sid=str(session.get('uid')), service_name=service_name ,phone=phone, booking_date=booking_date)            
            
            return render_template('register.html', title=title.get(lang), service=service_dict,
                                    booking_date=booking_date, phone=phone, time_list=booking_time_list(), phone_failed=False,index_lang=index_lang.get(lang))
            
        else:
            
            return render_template('register.html', title=title.get(lang), service=service_dict, lang=session.get('lang'),
                                    booking_date=booking_date, phone=phone, time_list=booking_time_list(), phone_failed=True,index_lang=index_lang.get(lang))

    else:
        return redirect(url_for('index'))

        




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
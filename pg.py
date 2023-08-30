from datetime import datetime
import re
import psycopg2
from psycopg2 import pool
from config import DB
import math
from flask import url_for
import re


def pagintaion(pages_total, page_current):
        prev = page_current-1
        nextp = page_current +1

        pages_dict = dict()
        if page_current > 1:
            pages_dict.update({f'<': prev})

        for i in range(1, pages_total+1):
            if i in range(page_current-3, page_current)\
                  or i==page_current or i in range(page_current+1, page_current+4):
                pages_dict.update({f'{i}': i})

        if pages_total >= nextp:
            pages_dict.update({'>': nextp})
        
        return pages_dict

def slugify(s):
    return re.sub(r'[^\w+]', '-', s)

def generate_slug(title):
    return str(slugify(title))

def time():
    return datetime.now().strftime('%H:%M:%S')

def today():
    return datetime.now().strftime('%Y-%m-%d')

def datetime_now():
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    #return datetime.now().strftime('%d-%m-%Y %H:%M:%S')

def refactor_img(text):
    base = url_for('static', filename='html_img/') 
    return re.sub(r"(?P<tag><img\s+[^>]*src=)(?P<quote>[\"'])(?P<url>.+?)(?P=quote)>",
                  lambda match: f"{match.group('tag')}{base}{match.group('url')}>" if not match.group('url').startswith('http') else match.group(0),
                  text)



class PgConnect:
    def __init__(self, minconn=1, maxconn=10, **kwargs):
        self.connection_pool = psycopg2.pool.SimpleConnectionPool(
            minconn, maxconn, **kwargs)

    def __enter__(self):
        self.conn = self.connection_pool.getconn()
        return self.conn

    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type:
            self.conn.rollback()
        else:
            self.conn.commit()
        self.connection_pool.putconn(self.conn)

    def execute(self, sql, params=None):
        with self.conn:
            with self.conn.cursor() as cur:
                cur.execute(sql, params)
                return cur.fetchall()

    def push(self, sql, params=None):
        with self.conn:
            with self.conn.cursor() as cur:
                cur.execute(sql, params)


class PgRequest:
    def __init__(self, db: PgConnect):
        self.__db = db


    def execute(self, request, params=None):
        with self.__db as conn:
            with conn.cursor() as cur:
                cur.execute(request, params)
                return cur.fetchone()[0]



    def insert(self, request, params=None):
        with self.__db as conn:
            self.__db.push(request, params)

    def select(self, request, params=None):
        with self.__db as conn:
            return self.__db.execute(request, params)
        
    def selectd(self, request, params=None):
        with self.__db as conn:
            with conn.cursor() as cur:
                cur.execute(request, params)
                columns = [desc[0] for desc in cur.description]
                return [dict(zip(columns, row)) for row in cur.fetchall()]






class Products:
    def __init__(self, request: PgRequest):
        self.__request = request

    
    def get_services(self, lang: str = 'ro'):
        services = self.__request.selectd('SELECT * FROM services;')
        new_list = []
        for i in services:
            s_id = i.get('id')
            order_num = i.get('order_num')
            service_link = i.get('service_link')
            service_name = i.get('service_name_'+lang)
            avatar_link = i.get('avatar_link')
            service_li = [x for x in i.get('service_li_'+lang).split(',')]
            time_need = i.get('time_need')
            service_description = i.get('service_description_'+lang)

            #Блок по фильрации списка опций
            service_types = list()
            for key, val in i.items():
                filter_keys = []
                if 'type_' in str(key) and lang in str(key) and val is not None:
                    type_num = key.split('_')[1]
                    type_val = val
                    # service_types.append({
                    #     f'type_{type_num}_name':type_val,
                    #     f'type_{type_num}_price':i.get(f'type_{type_num}_price')
                    #     })
                    service_types.append((type_val, float(i.get(f'type_{type_num}_price')),))
            
            new_list.append(
                {
                    'service_id':s_id,
                    'order_num':order_num,
                    'service_link':service_link,
                    'service_name':service_name,
                    'avatar_link ':avatar_link,
                    'service_li':service_li,
                    'time_need':time_need,
                    'service_description':service_description,
                    'service_types':service_types
                }
        )
        return new_list
    



class Orders:
    def __init__(self, request: PgRequest):
        self.__request = request


#Для телеграм бота
    def get_orders(self):
        return self.__request.selectd('SELECT * FROM order_info WHERE order_status = %s ORDER BY id;',('posted',))


    def order_status(self, order_id, status='in process'):
        try:
            self.__request.insert("UPDATE order_info SET order_status=%s WHERE id = %s;", (status, order_id))
            return True
        except Exception as ex:
            print(ex)
            return False

    def get_products(self, order_id):
        try:
            return self.__request.selectd("SELECT * FROM order_products WHERE order_id = %s;", (order_id,))
        except Exception as ex:
            print(ex)

    def get_delivery(self, order_id):
        try:
            return self.__request.selectd("SELECT * FROM order_delivery WHERE order_id = %s;", (order_id,))
        except Exception as ex:
            print(ex)

    def get_loaders(self, order_id):
        try:
            return self.__request.selectd("SELECT * FROM order_loaders WHERE order_id = %s;", (order_id,))
        except Exception as ex:
            print(ex)



#Для списка заявок в кабинете пользователя
    def orders_for_user(self, session_id:str = None):
        res =  self.__request.selectd('SELECT * FROM order_info WHERE session_id = %s ORDER BY date_time DESC',(session_id,))
        new_list = []
        for item in res:
            if len(item)>0:
                new_list.append({
                    'id':item.get('id'),
                    'date':item.get('date_time').strftime('%d/%m/%Y'),
                    'time':item.get('date_time').strftime('%H:%M'),
                    'full_price':item.get('full_price'),
                    'product_price':item.get('product_price'),
                    'delivery_price':item.get('delivery_price'),
                    'load_price':item.get('load_price')
                })
        return new_list


    def products_for_orders(self, orders_list:str):
        return self.__request.selectd(f'SELECT * FROM order_products WHERE order_id IN({orders_list})')
    
    def loaders_for_orders(self, orders_list:str):        
        return self.__request.selectd(f'SELECT * FROM order_loaders WHERE order_id IN({orders_list})')
    
    def delivery_for_orders(self, orders_list:str):
        return self.__request.selectd(f'SELECT * FROM order_delivery WHERE order_id IN({orders_list})')
    
        











connect = PgConnect(host=DB.host, port=DB.port, database=DB.database, user=DB.user, password=DB.password)
request_db = PgRequest(connect)

products = Products(request_db)
orders = Orders(request_db)


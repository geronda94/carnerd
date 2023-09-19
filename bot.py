import time
from aiogram import Bot, Dispatcher, F
from aiogram.types import Message, ContentType
from aiogram.filters import Filter, Command
import asyncio
import logging #импортируем библиотеку логирования
from apscheduler.schedulers.asyncio import AsyncIOScheduler
from apscheduler.triggers.interval import IntervalTrigger
from pg import services


#Блок инициализации#############################
TOKEN = '6474206551:AAHVfuznKd6sC4IgYEWkthSdy7SkCoIY6T0'                      
ADMIN = '6458439503'                  
################################################

#Блок стартовых функций#########################
async def start_bot(bot: Bot): #функция срабатывает когда запускается сервер с ботом
    await bot.send_message(ADMIN, text='Бот запущен!')
async def stop_bot(bot: Bot):
    await bot.send_message(ADMIN, text='<s>Бот остановлен</s>')
async def get_start(message: Message, bot: Bot): #Функция срабатывает когда юзер дает команду /start
    await message.answer('Давай начнем!')
###############################################

async def job_function(bot: Bot):

    extract = services.check_new_orders()
    #Извлекаем не обработанные заявки
    if len(extract)> 0:
        for i in extract:
            #Проходимся по списку необработанных заявок в цикле
            booking_id = i.get('id')
            session_id = i.get('session_id')
            ip_address = i.get('ip_address')
            booking_date = i.get('booking_date')
            booking_time = i.get('booking_time')
            client_phone = i.get('client_phone')
            service_name = i.get('service_name')
            service_price = i.get('service_price')
            car_type = i.get('car_type')
            order_posted = i.get('order_posted')
            client_lang = i.get('client_lang')

            if client_phone[0] == '0':
                whatsap_link = 'https://wa.me/'+'+4'+client_phone
            elif client_phone[0] == '+':
                whatsap_link = 'https://wa.me/'+client_phone
            else:
                whatsap_link = '-'
            
            services.set_booking_status(booking_id=booking_id, booking_status='in_process')

            booking_msg = f"--- ✅ НОВАЯ ЗАЯВКА {booking_id} ✅ --- \n\nУслуга: {service_name} \
                            \nДата записи: {booking_date}\nВремя записи: {booking_time}\nТип авто: {car_type}\
                            \nЦена услуги: {service_price} RON\n\nТелефон клиента: {client_phone},\nWhatsapp: {whatsap_link}\
                            \nЯзык клиента: {client_lang}\n\n\n\n----Техническа информация----\
                            \nip address: {ip_address}\n order_posted: {order_posted} \n\nsession_id: {session_id}"

            await bot.send_message(ADMIN, text=str(booking_msg))
            await bot.send_message(ADMIN, text=str(f"☎️ Телефон заказчика: ☎️"))
            await bot.send_message(ADMIN, text=f'{client_phone}')
            await bot.send_message(ADMIN, text=f'--------- КОНЕЦ ---------')

            time.sleep(1)





#Тело бота#####################################
async def start():
    logging.basicConfig(level=logging.INFO, format="%(asctime)s - [%(levelname)s] - %(name)s -(%(filename)s).%(funcName)s(%(lineno)d) - %(message)s")

    bot = Bot(token=TOKEN, parse_mode="HTML")
    dp = Dispatcher()
    dp.startup.register(start_bot) #Регистрируем хэндлер срабатывающий при запуске
    dp.shutdown.register(stop_bot)

    scheduler = AsyncIOScheduler()
    scheduler.add_job(job_function, 'interval', seconds=5, args=(bot,))



    dp.message.register(get_start, Command(commands=['start'])) #Регистрируем хэндлер на команду /start





    try:
        #Начало сессии
        scheduler.start()
        
        await dp.start_polling(bot)
    finally:
        #Закрываем сессию
        await bot.session.close()
###############################################


#Запускаем функцию Бота########################
if __name__ == "__main__":
    asyncio.run(start())
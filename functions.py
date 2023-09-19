from datetime import datetime, timedelta


def booking_time_list():    
    # Время начала и конца интервала
    start_time = datetime.strptime('08:00', '%H:%M')
    end_time = datetime.strptime('19:00', '%H:%M')

    # Интервал в минутах
    interval_minutes = 10

    # Список для хранения временных интервалов
    time_intervals = []

    # Генерация временных интервалов
    current_time = start_time
    while current_time <= end_time:
        time_intervals.append(current_time.strftime('%H:%M'))
        current_time += timedelta(minutes=interval_minutes)

    # Вывод списка временных интервалов
    return time_intervals





def number_validator(number: str):
    new_number = ''
    for i in range(len(number)):
        if (number[0] == '+') or number[i].isdigit():
            new_number += number[i]

        else:
            return False
    if 9 >= len(new_number) >= 10 and new_number[0] != '0':
        new_number = '0'+new_number

    if len(new_number) > 10 and new_number[0] != '+':
        return False
        
    return False if 15 < len(new_number) or len(new_number) < 10 else new_number



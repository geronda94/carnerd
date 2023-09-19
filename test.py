booking_date = "12-09-2023"

if booking_date:
    date = tuple(booking_date.split('-')[::-1])

print(date)
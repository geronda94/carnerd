function getSundaysInRange(startDate, endDate) {
    const sundays = [];
    const currentDate = new Date(startDate);
  
    while (currentDate <= endDate) {
      if (currentDate.getDay() === 0) {
        sundays.push(new Date(currentDate));
      }
      currentDate.setDate(currentDate.getDate() + 1);
    }
  
    return sundays;
  }
  
  const now = new Date();
  const currentHour = now.getHours();

  // Если текущее время меньше 19:00, используйте сегодняшнюю дату
  // В противном случае, используйте завтрашнюю дату
  const dateToUse = currentHour < 19 ? now : new Date(now.getTime() + 24 * 60 * 60 * 1000);

  const year = dateToUse.getFullYear();
  const month = String(dateToUse.getMonth() + 1).padStart(2, '0');
  const day = String(dateToUse.getDate()).padStart(2, '0');

  const formattedDate = `${year}-${month}-${day}`;

  // Получаем следующий месяц
  const nextMonthDate = new Date(dateToUse);
  nextMonthDate.setMonth(nextMonthDate.getMonth() + 1);

  let nextMonthYear = nextMonthDate.getFullYear();
  let nextMonthMonth = nextMonthDate.getMonth() + 1;
  let nextMonthDay = dateToUse.getDate(); // Используем текущее число

  // Проверяем, если следующий месяц имеет меньше дней, чем текущий месяц
  if (nextMonthMonth !== 12) {
      const daysInNextMonth = new Date(nextMonthYear, nextMonthMonth, 0).getDate();
      if (nextMonthDay > daysInNextMonth) {
          nextMonthDay = daysInNextMonth; // Коррекция дня
      }
  }

  nextMonthMonth = String(nextMonthMonth).padStart(2, '0');
  nextMonthDay = String(nextMonthDay).padStart(2, '0');

  const nextMonth = `${nextMonthYear}-${nextMonthMonth}-${nextMonthDay}`;
  date = {min: formattedDate, max: nextMonth,}


  const options = {
    date:date,
    input: true,
    actions: {
      changeToInput(e, HTMLInputElement, dates, time, hours, minutes, keeping) {
        if (dates[0]) {
          HTMLInputElement.value = dates[0];
          // if you want to hide the calendar after picking a date
          calendar.HTMLElement.classList.add('vanilla-calendar_hidden');
        } else {
          HTMLInputElement.value = '';
        }
      },
    },
  };
  
  
  
document.addEventListener('DOMContentLoaded', () => {
  const calendar = new VanillaCalendar('#calendar-input', options);
  calendar.init();

});







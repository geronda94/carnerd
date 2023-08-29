$(document).ready(function () {
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Кнопка, которая открыла модальное окно
        var param = button.data('param'); // Получаем значение параметра из атрибута data-param кнопки

        // Вставляем параметр в содержимое модального окна
        var modal = $(this);
        // modal.find('.modal-title').text(param);
        modal.find('#service_input').val(param); 
});
});
  
  
  
  
const now = new Date();
const currentHour = now.getHours();

// Если текущее время меньше 19:00, используйте сегодняшнюю дату
// В противном случае, используйте завтрашнюю дату
const dateToUse = currentHour < 19 ? now : new Date(now.getTime() + 24 * 60 * 60 * 1000);


new AirDatepicker('#calendar', {
    isMobile: true,
    autoClose: true,
    input: true,
    weekends: [0],
    minDate: dateToUse,
    // position: 'right top',
    // range: true,
    // multipleDatesSeparator: ' - '
    // timepicker: true,
    // Handle render process
    /*onRenderCell({date, cellType}) {
        let dates = [1, 5, 7, 10, 15, 20, 25],
        emoji = ['💕', '😃', '🍙', '🍣', '🍻', '🎉', '🥁'],
        isDay = cellType === 'day',
        _date = date.getDate(),
        shouldChangeContent = isDay && dates.includes(_date),
        randomEmoji = emoji[Math.floor(Math.random() * emoji.length)];

        return {
            html: shouldChangeContent ? randomEmoji : false,
            classes: shouldChangeContent ? '-emoji-cell-' : false
        }
    }*/
    locale: {
        days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
        daysShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        daysMin: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
        months: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        dateFormat: 'dd-MM-yyyy',
        timeFormat: 'hh:mm aa',
        firstDay: 1,
    },
      

});


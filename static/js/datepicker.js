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





// Получите ссылки меню
const menuLinks = document.querySelectorAll('.navbar-nav a');

// Добавьте обработчик события для каждой ссылки
menuLinks.forEach(link => {
    link.addEventListener('click', () => {
        // Закройте меню (если оно открыто)
        const mobileMenu = document.querySelector('.navbar-collapse');
        if (mobileMenu.classList.contains('show')) {
            mobileMenu.classList.remove('show');
        }
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
    minDate: dateToUse,
    weekends: [0,6],
    onRenderCell({ date, cellType }) {
        // Если текущая ячейка - день (не месяц и не год)
        if (cellType === 'day') {
            // Если это воскресенье (0 - воскресенье), делаем его некликабельным
            if (date.getDay() === 0) {
                return {
                    disabled: true,
                    classes: '-disabled-'
                };
            }
        }
        // В остальных случаях оставляем ячейку как есть
        return {};
    },
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





// плавное изменение пэдингов для навигации
window.addEventListener('scroll', function () {
    document.getElementById('nav__body').classList.toggle('headernav-scroll', window.scrollY > 550);
});

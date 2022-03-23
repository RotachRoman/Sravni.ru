# Выполненное задание Sravni.ru

## Требования
* Язык программирования Swift;
* Архитектура экрана на VIPER;
* Верстка кодом, не используя storyboards;
* Иконки в PDF;
* Учесть ширину экранов на разных разрешениях;

## Задача
Необходимо реализовать один из экранов калькулятора ОСАГО.

## Задание: Информационный экран с тарифами

* Создать модуль VIPER для страницы;
* Сделать mock данных и реализовать загрузку данных в модели;
---

### Реализован header с картинкой и title

<img src="img/header.png" width="250">

---
### Реализована ячейка статичного текста
<img src="img/text.png" width="250">

---
### Реализована ячейка для списка с буллитами
<img src="img/bullit.png" width="500">

---
### Реализована ячейка с тарифом
<img src="img/price.png" width="250">


---

### Реализована ячейка выбора коэффициента
<img src="img/tax.png" width="250">

---

### Реализована ячейка "Ваш коэффициент"
<img src="img/your_tax.png" width="300">

---

### Реализована ячейка "Равновесие"
<img src="img/balance.png" width="250">

---
### Реализована ячейка "вернуться на главную"

<img src="img/back.png" width="250">

---

### На основе сверстанных ячеек реализован один общий экран, для шести наборов данных
<img src="img/1.png" width="130"> <img src="img/2.png" width="130"> <img src="img/3.png" width="130"> <img src="img/4.png" width="130"> <img src="img/5.png" width="130"> <img src="img/6.png" width="130">

* Реализовано обновление данных после выбора коэффициента;

В папке App -> AppSettings -> SetupAppRouter в инициализации AppRouter(nameInformation: ,appViewController: , fetchService: , editFetchService: ), в nameInformation из массива arrayNameInformation выбирается экран, который будем тестить.

﻿#language: ru

@tree

Функционал: Проверка расчета суммы документа Заказ 

Как Менеджер по закупкам 
Измененить количество и цену в доументе Заказ 
чтобы Проверить расчет суммы документа Заказ при изменении количества и цены 
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
Сценарий: Проверить расчет суммы документа Заказ
И я закрываю все окна клиентского приложения
* Создать документ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'	
* Заполнить шапку документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Продукты"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнить табличную часть
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '20'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"	
	* Сохраняем сумму в параметр 
		и я запоминаю значение поля с именем "ТоварыКоличество" как "$Количество$"
* Сохраняем сумму в параметр
	и я запоминаю значение поля"Сумма (итог)" как "$СуммаИтого$"
* Проверить корректность суммы документа
	//И поле "Сумма (итог)" равно переменной "$Сумма$"
	//И переменная "Сумма" имеет значение "Сумма"
	//И в поле "Сумма (итог)" я ввожу значение переменной "СуммаИтого"
	Если элемент формы "Сумма (итог)" имеет значение 'Количество' тогда
	//Тогда я нажимаю на кнопку "Записать"
	И я закрываю текущее окно
	
		
	
 


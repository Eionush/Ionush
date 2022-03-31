﻿#language: ru

@tree

Функционал: Проверка учета возвратов в отчете D2001 Продажи

Как Менеждер я хочу
проверить корректность выведения данных по возвратам   
чтобы убедиться, что отчет работает правильно 

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий 

Сценарий: подготовка данных к тестированию отчета D2001 Продажи
	Дано экспорт основных данных
	Дано загрузка данных для отчета
	И я выполняю код встроенного языка на сервере
		|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: проверка отчета D2001 Продажи способом проверки ячейки итогов
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R11C4" в течение 20 секунд
	И в табличном документе 'Result' ячейка с адресом 'R11C4' равна '-375,00'
	И я закрываю все окна клиентского приложения

Сценарий: проверка отчета D2001 Продажи способом равенства по шаблону 
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	Дано Табличный документ "Result" равен макету "D2001Продажи" по шаблону
	И я закрываю все окна клиентского приложения
	

		



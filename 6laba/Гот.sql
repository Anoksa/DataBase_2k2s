use KOV_UNIVER

select PULPIT.PULPIT_NAME, FACULTY.FACULTY
from PULPIT, FACULTY
where PULPIT.FACULTY=FACULTY.FACULTY
       and
	   PULPIT.FACULTY in( select PROFESSION.FACULTY from PROFESSION
	                     where (PROFESSION_NAME like '%технология%' or PROFESSION_NAME like '%технологии%'))



select PULPIT.PULPIT_NAME, FACULTY.FACULTY
from PULPIT inner join FACULTY
on PULPIT.FACULTY= FACULTY.FACULTY
where  PULPIT.FACULTY in( select PROFESSION.FACULTY from PROFESSION
	                     where (PROFESSION_NAME like '%технология%' or PROFESSION_NAME like '%технологии%'))


						 
select distinct PULPIT.PULPIT_NAME, FACULTY.FACULTY
from PULPIT inner join FACULTY
on PULPIT.FACULTY=FACULTY.FACULTY
    inner join PROFESSION
	on PULPIT.FACULTY=PROFESSION.FACULTY
	   where(PROFESSION_NAME like '%технология%' or PROFESSION_NAME like '%технологии%')


select AUDITORIUM_CAPACITY, AUDITORIUM_TYPE
from AUDITORIUM a
 where AUDITORIUM=(select top (1) AUDITORIUM from AUDITORIUM aa
       where aa.AUDITORIUM_TYPE=a.AUDITORIUM_TYPE
	          order by AUDITORIUM_CAPACITY desc)


select FACULTY_NAME from FACULTY
 where not exists (select * from PULPIT
                        where PULPIT.FACULTY=FACULTY.FACULTY)



select top 1
       (select avg(PROGRESS.NOTE) from PROGRESS
	        where PROGRESS.SUBJECT like 'ОАиП')[ОАиП],
       (select avg(PROGRESS.NOTE) from PROGRESS
	        where PROGRESS.SUBJECT like 'КГ')[КГ],
       (select avg(PROGRESS.NOTE) from PROGRESS
	        where PROGRESS.SUBJECT like 'СУБД')[СУБД]
from PROGRESS


select AUDITORIUM_TYPE,AUDITORIUM_CAPACITY
		from AUDITORIUM
		where AUDITORIUM_CAPACITY>=all(select AUDITORIUM_CAPACITY
											from AUDITORIUM
											where AUDITORIUM_TYPE like 'лк')



select AUDITORIUM_TYPE,AUDITORIUM_CAPACITY
		from AUDITORIUM
		where AUDITORIUM_CAPACITY>=any(select AUDITORIUM_CAPACITY
											from AUDITORIUM
											where AUDITORIUM_TYPE like 'лк')


----------------------------------------------------

use [Книжный магазин]

SELECT Книги.Название, Книги.[Год  издания], Книги.Цена
FROM   Заказы, Книги, Покупатель
Where	Заказы.[id книги] = Книги.[id книги] and
		Заказы.[id покупателя] = Покупатель.[id покупателя] and
 Покупатель.Фамилия in (select Покупатель.Фамилия from Покупатель where (Покупатель.Фамилия like 'К%'))


 SELECT Книги.Название, Книги.[Год  издания], Книги.Цена, Покупатель.Фамилия, Покупатель.Имя, Покупатель.Телефон
FROM   Заказы INNER JOIN
             Книги ON Заказы.[id книги] = Книги.[id книги] INNER JOIN
             Покупатель ON Заказы.[id покупателя] = Покупатель.[id покупателя]
Where Покупатель.Телефон in (select Покупатель.Телефон from Покупатель where (Телефон Like '12%'))

SELECT Книги.Название, Книги.[Год  издания], Книги.Цена
FROM   Заказы INNER JOIN
             Книги ON Заказы.[id книги] = Книги.[id книги] INNER JOIN
             Покупатель ON Заказы.[id покупателя] = Покупатель.[id покупателя]
Where (Фамилия like 'К%')

SELECT Книги.Название, Книги.[Год  издания], Книги.Цена, Покупатель.Фамилия, Покупатель.Имя
FROM   Заказы INNER JOIN
             Книги ON Заказы.[id книги] = Книги.[id книги] INNER JOIN
             Покупатель ON Заказы.[id покупателя] = Покупатель.[id покупателя]
Where Покупатель.Фамилия = ( select top(1) Покупатель.Фамилия from Покупатель)


select Название, Фамилия,  Имя
from Книги a, Покупатель, Заказы 
	Where Заказы.[id книги] = a.[id книги] and
		Заказы.[id покупателя] = Покупатель.[id покупателя] and
		Название in (select Название from Книги aa where
					aa.Название=a.Название  )
					order by a.Название



Select Книги.Название, Покупатель.Фамилия, Покупатель.Имя
From Книги, Покупатель, Заказы
Where Заказы.[id книги] = Книги.[id книги] and
		Заказы.[id покупателя] = Покупатель.[id покупателя] and
		Книги.Цена > any(Select Цена from Книги
						Where Название like 'Встав%')




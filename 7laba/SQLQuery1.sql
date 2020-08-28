use KOV_UNIVER


select 
       max(AUDITORIUM_CAPACITY) [Максимальная вместимость],
       min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
	   avg(AUDITORIUM_CAPACITY) [Средняя вместимость],
	   sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
	   count(*) [Количество аудиторий]
from AUDITORIUM


select AUDITORIUM.AUDITORIUM_TYPE [Тип аудитории],
       max(AUDITORIUM_CAPACITY) [Максимальная вместимость],
       min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
	   avg(AUDITORIUM_CAPACITY) [Средняя вместимость],
	   sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
	   count(*) [Количество аудиторий]
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE= AUDITORIUM_TYPE.AUDITORIUM_TYPE group by AUDITORIUM.AUDITORIUM_TYPE 
 

select * 
from (select case when NOTE between 3 and 5 then '4-5'
                  when NOTE between 5 and 7 then '6-7'
				  when NOTE between 7 and 9 then '8-9'
				  else '10'
				  end [Оценки], COUNT (*)[Количество]
from PROGRESS group by case
                  when NOTE between 3 and 5 then '4-5'
                  when NOTE between 5 and 7 then '6-7'
				  when NOTE between 7 and 9 then '8-9'
				  else '10'
				  end) as T
				       order by case [Оценки]
					   when '4-5' then 3
					   when '6-7' then 2
					   when '8-9' then 1
					   else 0
					   end


select f.FACULTY[Факультет],
       g.PROFESSION[Специальность],
	   s.IDGROUP[Группа],
	   round(avg(cast(p.NOTE as float(4))),2)[Средняя оценка]
from FACULTY f inner join  GROUPS g
   on f.FACULTY=g.FACULTY
       inner join STUDENT s
   on s.IDGROUP= g.IDGROUP
       inner join PROGRESS p
   on p.IDSTUDENT=s.IDSTUDENT
group by 
        f.FACULTY,
       g.PROFESSION,
	   s.IDGROUP 
order by [Средняя оценка] desc
		



select f.FACULTY[Факультет],
       g.PROFESSION[Специальность],
	   s.IDGROUP[Группа],
	   round(avg(cast(p.NOTE as float(4))),2)[Средняя оценка]
from FACULTY f inner join  GROUPS g
   on f.FACULTY=g.FACULTY
       inner join STUDENT s
   on s.IDGROUP= g.IDGROUP
       inner join PROGRESS p
   on p.IDSTUDENT=s.IDSTUDENT
where p.SUBJECT like 'СУБД' or p.SUBJECT = 'ОАиП'
group by 
        f.FACULTY,
       g.PROFESSION,
	   s.IDGROUP 
order by [Средняя оценка] desc




select g.PROFESSION[Специальность],
	   p.SUBJECT[Предмет],
	   round(avg(cast(p.NOTE as float(4))),2)[Средняя оценка]
from FACULTY f inner join  GROUPS g
   on f.FACULTY=g.FACULTY
       inner join STUDENT s
   on s.IDGROUP= g.IDGROUP
       inner join PROGRESS p
   on p.IDSTUDENT=s.IDSTUDENT
where f.FACULTY like 'ПИМ' 
group by  rollup(
       g.PROFESSION,
	   p.SUBJECT)
order by [Средняя оценка] desc


select g.PROFESSION[Специальность],
	   p.SUBJECT[Предмет],
	   round(avg(cast(p.NOTE as float(4))),2)[Средняя оценка]
from FACULTY f inner join  GROUPS g
   on f.FACULTY=g.FACULTY
       inner join STUDENT s
   on s.IDGROUP= g.IDGROUP
       inner join PROGRESS p
   on p.IDSTUDENT=s.IDSTUDENT
where f.FACULTY like 'ПиМ' 
group by  cube(
       g.PROFESSION,
	   p.SUBJECT)
order by [Средняя оценка] desc




select GROUPS.PROFESSION[Специальность],
       PROGRESS.SUBJECT[Предмет],
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) as 'Средняя оценка'
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ПиМ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT union 

select GROUPS.PROFESSION,
       PROGRESS.SUBJECT,
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) 
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ИТ'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT


select GROUPS.PROFESSION[Специальность],
       PROGRESS.SUBJECT[Предмет],
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) as 'Средняя оценка'
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ПиМ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT union all
select GROUPS.PROFESSION,
       PROGRESS.SUBJECT,
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) 
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ИТ'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT






---- intersect 
select GROUPS.PROFESSION[Специальность],
       PROGRESS.SUBJECT[Предмет]
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ПиМ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT intersect
select GROUPS.PROFESSION,
       PROGRESS.SUBJECT 
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ПиМ'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT





-------- except 
select GROUPS.PROFESSION[Специальность],
       PROGRESS.SUBJECT[Предмет]
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ПиМ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT except
select GROUPS.PROFESSION,
       PROGRESS.SUBJECT
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like 'ИТ'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT




select PROGRESS.IDSTUDENT[Id студента],
       PROGRESS.SUBJECT[Предемет],
	   PROGRESS.NOTE
from PROGRESS
group by PROGRESS.IDSTUDENT,
         PROGRESS.SUBJECT,
		 PROGRESS.NOTE
		 having PROGRESS.NOTE=8 or PROGRESS.NOTE=9
 


 ------------------------------
 use [Книжный магазин]

select SUM(Summa) AS Сумма 
from (select Книги.Цена, Книги.Название, ps.Количество, Книги.Цена*ps.Количество as Summa 
		from Книги INNER JOIN 
			(select Заказы.[id книги], Заказы.Количество 
				from Заказы 
					where Заказы.[id покупателя]=(select Покупатель.[id покупателя]
						from Покупатель 
							where Покупатель.Имя='Дарья' and Покупатель.Фамилия='Синицына')) ps ON Книги.[id книги]=ps.[id книги]) AS [SumRes];

SELECT AVG( Книги.Цена)
FROM   Заказы INNER JOIN
             Книги ON Заказы.[id книги] = Книги.[id книги] INNER JOIN
             Покупатель ON Заказы.[id покупателя] = Покупатель.[id покупателя]
Where Покупатель.Фамилия Like 'К%'


Select MAX(Книги.Цена)[Максимальная цена],
		MIN(Книги.Цена)[Минимальная цена]
From Книги

Select *
From (select case when Цена between 1 and 10 then 'Цена<10'
					when Цена between 10 and 20 then '10<Цена<20'
					when Цена between 20 and 50 then '<20Цена<50'
					else  'Цена больше 50'
					end [Пределы цен], COUNT(*) [Количество]
		From  Книги Group  by Case
				when Цена between 1 and 10 then 'Цена<10'
					when Цена between 10 and 20 then '10<Цена<20'
					when Цена between 20 and 50 then '<20Цена<50'
					else  'Цена больше 50'
					end) as T
					order by Case[Пределы цен]
						when  'Цена<10' then 4
						when '10<Цена<20' then 3
						when '<20Цена<50' then 2
						When  'Цена больше 50' then 1
						else 0
						end
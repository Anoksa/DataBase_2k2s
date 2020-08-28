use KOV_UNIVER

select PULPIT.PULPIT_NAME, FACULTY.FACULTY
from PULPIT, FACULTY
where PULPIT.FACULTY=FACULTY.FACULTY
       and
	   PULPIT.FACULTY in( select PROFESSION.FACULTY from PROFESSION
	                     where (PROFESSION_NAME like '%����������%' or PROFESSION_NAME like '%����������%'))



select PULPIT.PULPIT_NAME, FACULTY.FACULTY
from PULPIT inner join FACULTY
on PULPIT.FACULTY= FACULTY.FACULTY
where  PULPIT.FACULTY in( select PROFESSION.FACULTY from PROFESSION
	                     where (PROFESSION_NAME like '%����������%' or PROFESSION_NAME like '%����������%'))


						 
select distinct PULPIT.PULPIT_NAME, FACULTY.FACULTY
from PULPIT inner join FACULTY
on PULPIT.FACULTY=FACULTY.FACULTY
    inner join PROFESSION
	on PULPIT.FACULTY=PROFESSION.FACULTY
	   where(PROFESSION_NAME like '%����������%' or PROFESSION_NAME like '%����������%')


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
	        where PROGRESS.SUBJECT like '����')[����],
       (select avg(PROGRESS.NOTE) from PROGRESS
	        where PROGRESS.SUBJECT like '��')[��],
       (select avg(PROGRESS.NOTE) from PROGRESS
	        where PROGRESS.SUBJECT like '����')[����]
from PROGRESS


select AUDITORIUM_TYPE,AUDITORIUM_CAPACITY
		from AUDITORIUM
		where AUDITORIUM_CAPACITY>=all(select AUDITORIUM_CAPACITY
											from AUDITORIUM
											where AUDITORIUM_TYPE like '��')



select AUDITORIUM_TYPE,AUDITORIUM_CAPACITY
		from AUDITORIUM
		where AUDITORIUM_CAPACITY>=any(select AUDITORIUM_CAPACITY
											from AUDITORIUM
											where AUDITORIUM_TYPE like '��')


----------------------------------------------------

use [������� �������]

SELECT �����.��������, �����.[���  �������], �����.����
FROM   ������, �����, ����������
Where	������.[id �����] = �����.[id �����] and
		������.[id ����������] = ����������.[id ����������] and
 ����������.������� in (select ����������.������� from ���������� where (����������.������� like '�%'))


 SELECT �����.��������, �����.[���  �������], �����.����, ����������.�������, ����������.���, ����������.�������
FROM   ������ INNER JOIN
             ����� ON ������.[id �����] = �����.[id �����] INNER JOIN
             ���������� ON ������.[id ����������] = ����������.[id ����������]
Where ����������.������� in (select ����������.������� from ���������� where (������� Like '12%'))

SELECT �����.��������, �����.[���  �������], �����.����
FROM   ������ INNER JOIN
             ����� ON ������.[id �����] = �����.[id �����] INNER JOIN
             ���������� ON ������.[id ����������] = ����������.[id ����������]
Where (������� like '�%')

SELECT �����.��������, �����.[���  �������], �����.����, ����������.�������, ����������.���
FROM   ������ INNER JOIN
             ����� ON ������.[id �����] = �����.[id �����] INNER JOIN
             ���������� ON ������.[id ����������] = ����������.[id ����������]
Where ����������.������� = ( select top(1) ����������.������� from ����������)


select ��������, �������,  ���
from ����� a, ����������, ������ 
	Where ������.[id �����] = a.[id �����] and
		������.[id ����������] = ����������.[id ����������] and
		�������� in (select �������� from ����� aa where
					aa.��������=a.��������  )
					order by a.��������



Select �����.��������, ����������.�������, ����������.���
From �����, ����������, ������
Where ������.[id �����] = �����.[id �����] and
		������.[id ����������] = ����������.[id ����������] and
		�����.���� > any(Select ���� from �����
						Where �������� like '�����%')




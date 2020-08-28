use KOV_UNIVER


select 
       max(AUDITORIUM_CAPACITY) [������������ �����������],
       min(AUDITORIUM_CAPACITY) [����������� �����������],
	   avg(AUDITORIUM_CAPACITY) [������� �����������],
	   sum(AUDITORIUM_CAPACITY) [��������� �����������],
	   count(*) [���������� ���������]
from AUDITORIUM


select AUDITORIUM.AUDITORIUM_TYPE [��� ���������],
       max(AUDITORIUM_CAPACITY) [������������ �����������],
       min(AUDITORIUM_CAPACITY) [����������� �����������],
	   avg(AUDITORIUM_CAPACITY) [������� �����������],
	   sum(AUDITORIUM_CAPACITY) [��������� �����������],
	   count(*) [���������� ���������]
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE= AUDITORIUM_TYPE.AUDITORIUM_TYPE group by AUDITORIUM.AUDITORIUM_TYPE 
 

select * 
from (select case when NOTE between 3 and 5 then '4-5'
                  when NOTE between 5 and 7 then '6-7'
				  when NOTE between 7 and 9 then '8-9'
				  else '10'
				  end [������], COUNT (*)[����������]
from PROGRESS group by case
                  when NOTE between 3 and 5 then '4-5'
                  when NOTE between 5 and 7 then '6-7'
				  when NOTE between 7 and 9 then '8-9'
				  else '10'
				  end) as T
				       order by case [������]
					   when '4-5' then 3
					   when '6-7' then 2
					   when '8-9' then 1
					   else 0
					   end


select f.FACULTY[���������],
       g.PROFESSION[�������������],
	   s.IDGROUP[������],
	   round(avg(cast(p.NOTE as float(4))),2)[������� ������]
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
order by [������� ������] desc
		



select f.FACULTY[���������],
       g.PROFESSION[�������������],
	   s.IDGROUP[������],
	   round(avg(cast(p.NOTE as float(4))),2)[������� ������]
from FACULTY f inner join  GROUPS g
   on f.FACULTY=g.FACULTY
       inner join STUDENT s
   on s.IDGROUP= g.IDGROUP
       inner join PROGRESS p
   on p.IDSTUDENT=s.IDSTUDENT
where p.SUBJECT like '����' or p.SUBJECT = '����'
group by 
        f.FACULTY,
       g.PROFESSION,
	   s.IDGROUP 
order by [������� ������] desc




select g.PROFESSION[�������������],
	   p.SUBJECT[�������],
	   round(avg(cast(p.NOTE as float(4))),2)[������� ������]
from FACULTY f inner join  GROUPS g
   on f.FACULTY=g.FACULTY
       inner join STUDENT s
   on s.IDGROUP= g.IDGROUP
       inner join PROGRESS p
   on p.IDSTUDENT=s.IDSTUDENT
where f.FACULTY like '���' 
group by  rollup(
       g.PROFESSION,
	   p.SUBJECT)
order by [������� ������] desc


select g.PROFESSION[�������������],
	   p.SUBJECT[�������],
	   round(avg(cast(p.NOTE as float(4))),2)[������� ������]
from FACULTY f inner join  GROUPS g
   on f.FACULTY=g.FACULTY
       inner join STUDENT s
   on s.IDGROUP= g.IDGROUP
       inner join PROGRESS p
   on p.IDSTUDENT=s.IDSTUDENT
where f.FACULTY like '���' 
group by  cube(
       g.PROFESSION,
	   p.SUBJECT)
order by [������� ������] desc




select GROUPS.PROFESSION[�������������],
       PROGRESS.SUBJECT[�������],
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) as '������� ������'
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '���'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT union 

select GROUPS.PROFESSION,
       PROGRESS.SUBJECT,
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) 
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '��'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT


select GROUPS.PROFESSION[�������������],
       PROGRESS.SUBJECT[�������],
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) as '������� ������'
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '���'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT union all
select GROUPS.PROFESSION,
       PROGRESS.SUBJECT,
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) 
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '��'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT






---- intersect 
select GROUPS.PROFESSION[�������������],
       PROGRESS.SUBJECT[�������]
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '���'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT intersect
select GROUPS.PROFESSION,
       PROGRESS.SUBJECT 
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '���'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT





-------- except 
select GROUPS.PROFESSION[�������������],
       PROGRESS.SUBJECT[�������]
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '���'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT except
select GROUPS.PROFESSION,
       PROGRESS.SUBJECT
from PROGRESS inner join STUDENT
     on PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
	          inner join GROUPS
	 on GROUPS.IDGROUP=STUDENT.IDGROUP
where GROUPS.FACULTY like '��'
group by GROUPS.PROFESSION,  PROGRESS.SUBJECT




select PROGRESS.IDSTUDENT[Id ��������],
       PROGRESS.SUBJECT[��������],
	   PROGRESS.NOTE
from PROGRESS
group by PROGRESS.IDSTUDENT,
         PROGRESS.SUBJECT,
		 PROGRESS.NOTE
		 having PROGRESS.NOTE=8 or PROGRESS.NOTE=9
 


 ------------------------------
 use [������� �������]

select SUM(Summa) AS ����� 
from (select �����.����, �����.��������, ps.����������, �����.����*ps.���������� as Summa 
		from ����� INNER JOIN 
			(select ������.[id �����], ������.���������� 
				from ������ 
					where ������.[id ����������]=(select ����������.[id ����������]
						from ���������� 
							where ����������.���='�����' and ����������.�������='��������')) ps ON �����.[id �����]=ps.[id �����]) AS [SumRes];

SELECT AVG( �����.����)
FROM   ������ INNER JOIN
             ����� ON ������.[id �����] = �����.[id �����] INNER JOIN
             ���������� ON ������.[id ����������] = ����������.[id ����������]
Where ����������.������� Like '�%'


Select MAX(�����.����)[������������ ����],
		MIN(�����.����)[����������� ����]
From �����

Select *
From (select case when ���� between 1 and 10 then '����<10'
					when ���� between 10 and 20 then '10<����<20'
					when ���� between 20 and 50 then '<20����<50'
					else  '���� ������ 50'
					end [������� ���], COUNT(*) [����������]
		From  ����� Group  by Case
				when ���� between 1 and 10 then '����<10'
					when ���� between 10 and 20 then '10<����<20'
					when ���� between 20 and 50 then '<20����<50'
					else  '���� ������ 50'
					end) as T
					order by Case[������� ���]
						when  '����<10' then 4
						when '10<����<20' then 3
						when '<20����<50' then 2
						When  '���� ������ 50' then 1
						else 0
						end
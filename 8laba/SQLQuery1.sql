use KOV_UNIVER

CREATE VIEW [�������������]
	as Select TEACHER[���],
		TEACHER_NAME[��� �������������],
		GENDER[���],
		PULPIT[�������]
	From  TEACHER

Drop view [�������������]

Select * from [�������������]

Create view [���������� ������]
	as select fc.FACULTY_NAME,
	count (*) pl
	FROM FACULTY   fc join PULPIT pl
	on fc.FACULTY_NAME=pl.FACULTY

Select * from [���������� ������]

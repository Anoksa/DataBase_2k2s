use KOV_UNIVER

CREATE VIEW [Преподаватель]
	as Select TEACHER[Код],
		TEACHER_NAME[Имя преподавателя],
		GENDER[Пол],
		PULPIT[Кафедра]
	From  TEACHER

Drop view [Преподаватель]

Select * from [Преподаватель]

Create view [Количество кафедр]
	as select fc.FACULTY_NAME,
	count (*) pl
	FROM FACULTY   fc join PULPIT pl
	on fc.FACULTY_NAME=pl.FACULTY

Select * from [Количество кафедр]

USE master;
CREATE database Продажи2;


USE Продажи2;
CREATE table dbo.STUDENT
([Номер зачётки] int PRIMARY KEY NOT NULL,
[Фамилия студента] varchar(25) NOT NULL,
[Номер группы] int NOT NULL)
GO

ALTER TABLE STUDENT ADD [Дата поступления] date;
ALTER TABLE STUDENT ADD [Курс] int;

INSERT into STUDENT
Values (401, 'Борисов', 4, '2018-09-01'),
		(402, 'Карпушевич', 4, '2018-09-01'),
		(403, 'Кремень', 4, '2018-09-01'),
		(404, 'Рогалевич', 4, '2018-09-01'),
		(405, 'Невар', 4, '2018-09-01'),
		(501, 'Колесникович', 5, '2018-09-01'),
		(502, 'Ожередова', 5, '2018-09-01'),
		(503, 'Мощинская', 5, '2018-09-01');

INSERT into STUDENT
	Values (411, 'Носович', 4, '2019-09-01'),
		(412, 'Котович', 4, '2019-09-01'),
		(413, 'Рак', 4, '2019-09-01'),
		(414, 'Линич', 4, '2019-09-01'),
		(415, 'Карп', 4, '2019-09-01'),
		(511, 'Бондарева', 5, '2019-09-01'),
		(512, 'Заболотная', 5, '2019-09-01'),
		(513, 'Козлова', 5, '2019-09-01');

SELECT * From STUDENT;

SELECT [Фамилия студента], [Номер группы] From STUDENT;

SELECT COUNT(*) From STUDENT;

SELECT [Номер зачётки], [Фамилия студента] From STUDENT
		Where [Номер группы]=5;

Select Distinct Top(4) [Фамилия студента], [Номер группы]
From STUDENT

Update STUDENT set [Номер группы]  =  5;

Update  STUDENT set [Номер группы] =  3 Where [Фамилия студента]='Макаревич';
Update  STUDENT set [Номер группы] =  4 Where [Фамилия студента]='Карпушевич';
Update  STUDENT set [Номер группы] =  4 Where [Фамилия студента]='Борисов';
Update  STUDENT set [Номер группы] =  4 Where [Фамилия студента]='Кремень';
Update  STUDENT set [Номер группы] =  4 Where [Фамилия студента]='Рогалевич';
Update  STUDENT set [Номер группы] =  4 Where [Фамилия студента]='Невар';

SELECT Distinct [Фамилия студента], [Номер группы]
FROM STUDENT Where [Номер группы] between 4 and 6

Select [Фамилия студента]  FROM STUDENT
Where [Фамилия студента] Like 'К%'

Select [Фамилия студента], [Номер зачётки] FROM STUDENT
where [Номер группы] In  (3,5)



use Продажи2;
create table dbo.RESULTS
( ID int IDENTITY(1, 3) primary key  not null,
[STUDEN NAME] varchar(25) not null,
Math int not null, Prog int not null, Rus int not null,
[AVER_VALUE] as (Math+Prog+Rus)/3
)

INSERT into RESULTS
values ('Макаревич', 3, 4, 3),
		('Колесникович', 4, 4, 5),
		('Ожередова', 4, 4, 4),
		('Мощинская', 4, 4, 4),
		('Бондарева', 3, 4, 3);
		
SELECT * From RESULTS
USE master;
CREATE database �������2;


USE �������2;
CREATE table dbo.STUDENT
([����� �������] int PRIMARY KEY NOT NULL,
[������� ��������] varchar(25) NOT NULL,
[����� ������] int NOT NULL)
GO

ALTER TABLE STUDENT ADD [���� �����������] date;
ALTER TABLE STUDENT ADD [����] int;

INSERT into STUDENT
Values (401, '�������', 4, '2018-09-01'),
		(402, '����������', 4, '2018-09-01'),
		(403, '�������', 4, '2018-09-01'),
		(404, '���������', 4, '2018-09-01'),
		(405, '�����', 4, '2018-09-01'),
		(501, '������������', 5, '2018-09-01'),
		(502, '���������', 5, '2018-09-01'),
		(503, '���������', 5, '2018-09-01');

INSERT into STUDENT
	Values (411, '�������', 4, '2019-09-01'),
		(412, '�������', 4, '2019-09-01'),
		(413, '���', 4, '2019-09-01'),
		(414, '�����', 4, '2019-09-01'),
		(415, '����', 4, '2019-09-01'),
		(511, '���������', 5, '2019-09-01'),
		(512, '����������', 5, '2019-09-01'),
		(513, '�������', 5, '2019-09-01');

SELECT * From STUDENT;

SELECT [������� ��������], [����� ������] From STUDENT;

SELECT COUNT(*) From STUDENT;

SELECT [����� �������], [������� ��������] From STUDENT
		Where [����� ������]=5;

Select Distinct Top(4) [������� ��������], [����� ������]
From STUDENT

Update STUDENT set [����� ������]  =  5;

Update  STUDENT set [����� ������] =  3 Where [������� ��������]='���������';
Update  STUDENT set [����� ������] =  4 Where [������� ��������]='����������';
Update  STUDENT set [����� ������] =  4 Where [������� ��������]='�������';
Update  STUDENT set [����� ������] =  4 Where [������� ��������]='�������';
Update  STUDENT set [����� ������] =  4 Where [������� ��������]='���������';
Update  STUDENT set [����� ������] =  4 Where [������� ��������]='�����';

SELECT Distinct [������� ��������], [����� ������]
FROM STUDENT Where [����� ������] between 4 and 6

Select [������� ��������]  FROM STUDENT
Where [������� ��������] Like '�%'

Select [������� ��������], [����� �������] FROM STUDENT
where [����� ������] In  (3,5)



use �������2;
create table dbo.RESULTS
( ID int IDENTITY(1, 3) primary key  not null,
[STUDEN NAME] varchar(25) not null,
Math int not null, Prog int not null, Rus int not null,
[AVER_VALUE] as (Math+Prog+Rus)/3
)

INSERT into RESULTS
values ('���������', 3, 4, 3),
		('������������', 4, 4, 5),
		('���������', 4, 4, 4),
		('���������', 4, 4, 4),
		('���������', 3, 4, 3);
		
SELECT * From RESULTS
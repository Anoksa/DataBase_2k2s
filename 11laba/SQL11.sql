use KOV_UNIVER

declare @tv char(20), @t char(300)='';
declare subj cursor for select [subject] from [SUBJECT] where pulpit='����';
	open subj;
	fetch subj into @tv;
	print '���������� �� ������� ����';
	while @@fetch_status=0
		begin 
			set @t=rtrim(@tv)+','+@t;
			fetch subj into @tv;
		end;
	print @t;
close subj;

--------------------------------
--2

DECLARE Subjects CURSOR LOCAL                            
	             for SELECT [SUBJECT] , PULPIT from [SUBJECT];
DECLARE @tv char(20), @pulpit char(15);      
	OPEN Subjects;	  
	fetch  Subjects into @tv, @pulpit; 	
      print '1. '+@tv+@pulpit;   
      go

 DECLARE @tv char(20), @pulpit char(15);     	
	fetch  Subjects into @tv, @pulpit; 	
      print '2. '+@tv+@pulpit;  
  go   


  declare Subjects cursor global 
					for select [SUBJECT], PULPIT from [SUBJECT];
  declare @tv char(20), @pulpit char(15);
	open Subjects;
	fetch Subjects into @tv, @pulpit;
	print '1.'+@tv+@pulpit;
	go
  declare @tv char(20), @pulpit char(15);
	fetch Subjects into @tv, @pulpit;
	print '2.'+@tv+@pulpit;
	close Subjects;
	deallocate Subjects;
	go


-------------------------------------
--3


DECLARE @tid char(10), @tnm char(20);  
	DECLARE Subjects CURSOR LOCAL DYNAMIC                              
		 for SELECT [SUBJECT] , PULPIT from [SUBJECT] where PULPIT = '����';				   
	open Subjects;
	print   '���������� ����� : '+cast(@@CURSOR_ROWS as varchar(5)); 
    	UPDATE [SUBJECT] set PULPIT = '��' where [SUBJECT] = '��';
	DELETE [SUBJECT] where [SUBJECT] = '���';
	INSERT [SUBJECT] ([SUBJECT],[SUBJECT_NAME],[PULPIT]) 
	                 values ('����','��������-��������������� ���������� ����������������','����'); 
	FETCH  Subjects into @tid, @tnm;     
	while @@fetch_status = 0                                    
      begin 
          print @tid + ' '+ @tnm ;      
          fetch Subjects into @tid, @tnm; 
       end;          
   CLOSE  Subjects;



----------------------------------------------
--4


         DECLARE  @tc int, @rn char(50);  
         DECLARE Primer1 cursor local dynamic SCROLL                               
               for SELECT row_number() over (order by [SUBJECT]) N,
	                           [SUBJECT] FROM [SUBJECT] 
                                        where PULPIT = '����' 
	OPEN Primer1;
	FETCH  Primer1 into  @tc, @rn;                 
	print '��������� ������        : ' + cast(@tc as varchar(3))+' '+ rtrim(@rn);      
	FETCH  LAST from  Primer1 into @tc, @rn;       
	print '��������� ������          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn);      
	FETCH  FIRST from  Primer1 into @tc, @rn;       
	print '������ ������          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn); 
	FETCH  NEXT from  Primer1 into @tc, @rn;       
	print '��������� ������ �� �������          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn); 
	FETCH  PRIOR from  Primer1 into @tc, @rn;       
	print '���������� ������ �� �������          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn); 
	FETCH  ABSOLUTE 3 from  Primer1 into @tc, @rn;       
	print '������ ������ �� ������          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn); 
	FETCH  ABSOLUTE -3 from  Primer1 into @tc, @rn;       
	print '������ ������ �� �����          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn); 
	FETCH  RELATIVE 5 from  Primer1 into @tc, @rn;       
	print '����� ������ ����� �� �������          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn); 
	FETCH  RELATIVE -5 from  Primer1 into @tc, @rn;       
	print '����� ������ ����� �� �������          : ' +  cast(@tc as varchar(3))+' '+ rtrim(@rn); 
      CLOSE Primer1;



-------------------------------------------------
--5-6

declare @ti int,@tn nvarchar(20), @tc int, @tk int, @ts char(10);
declare Primer2 cursor local dynamic
		for select STUDENT.IDSTUDENT,STUDENT.[NAME], GROUPS.IDGROUP,PROGRESS.NOTE,PROGRESS.[SUBJECT]
							from PROGRESS join STUDENT 
		on progress.IDSTUDENT=STUDENT.IDSTUDENT
		join GROUPS on Student.IDGROUP=GROUPS.IDGROUP
		where PROGRESS.NOTE=4
		for update;
open Primer2;
fetch Primer2 into @ti,@tn, @tc, @tk, @ts;
while @@fetch_status=0
begin
	if (@ti=1005)
		update PROGRESS set NOTE=NOTE+1;
	else
		delete PROGRESS where current of Primer2;
fetch Primer2 into @ti,@tn, @tc, @tk, @ts;
end;
close Primer2;


delete from PROGRESS
insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE)
    values ('����', 1000,  '01.10.2013',6),
           ('����', 1001,  '01.10.2013',8),
           ('����', 1002,  '01.10.2013',7),
           ('����', 1003,  '01.10.2013',5),
           ('����', 1005,  '01.10.2013',4),
		   ('����', 1014,  '01.12.2013',5),
           ('����', 1015,  '01.12.2013',9),
           ('����', 1016,  '01.12.2013',5),
           ('����', 1017,  '01.12.2013',4),
		   ('��',   1018,  '06.5.2013',4),
           ('��',   1019,  '06.05.2013',7),
           ('��',   1020,  '06.05.2013',7),
           ('��',   1021,  '06.05.2013',9),
           ('��',   1022,  '06.05.2013',5),
           ('��',   1023,  '06.05.2013',6);



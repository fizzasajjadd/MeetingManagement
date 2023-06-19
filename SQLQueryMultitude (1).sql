
go
create database db;
go
use  db
go


Create Table Employee
(

ID int Identity(1,1),
Name_ nvarchar(50) NOT NULL,
CNIC nvarchar(15) NOT NULL,
Department nvarchar(10) NOT NULL,
phone_Num nvarchar(20),
email nvarchar(60) primary key
)


insert into  employee values ('Hassan', '3520224564741', 'D1', '03031111222', 'hassan123@gmail.com')
insert into  employee values ('Ali', '3520224564742', 'D2', '03032323123', 'ali123@gmail.com')
insert into  employee values ('Jibran', '3520224564743', 'D3', '03031111333', 'jibran123@gmail.com')

cREATE TABLE employeeLogIn
(
employeeemail nvarchar(60)  FOREIGN KEY  REFERENCES Employee (email),
password_ nvarchar(8)

constraint PK_employeeLogIn primary key (employeeemail,password_)
)

insert into employeeLogIn values ('ali123@gmail.com', 'hello123')
insert into employeeLogIn values ('jibran123@gmail.com', 'world321')
insert into employeeLogIn values ('hassan123@gmail.com', 'hi@1fasd')


Create Table Department
(
deptId nvarchar(10) primary key,
deptName nvarchar(50),
dept_email nvarchar(60)
)

insert into  department values ('D1','Marketing','marketing123@gmail.com')
insert into  department values ('D2','Social Media','socialmedia321@gmail.com')
insert into  department values ('D3','Sales','sales123@gmail.com')

Create Table Host(

ID INT Identity(1,1),
Name_ nvarchar(50) NOT NULL,
Department nvarchar(10) FOREIGN KEY REFERENCES Department (deptId),
phone_Num nvarchar(20),
email nvarchar(60) NOT NULL PRIMARY  KEY
)

insert into  host values ('Fatima','MarketingManager' ,'D1', '03212222999', 'fatima123@gmail.com')
insert into  host values ('Fizza','SocialMediaManager' ,'D2','03368889999' , 'fizza123@gmail.com')
insert into  host values ('Ushna','SalesManager' ,'D3', '03121111777', 'ushna123@gmail.com')
 
 truncate table host
Create Table HOSTLogIn(

hostemail nvarchar(60) FOREIGN KEY REFERENCES HOST (email),
password_ nvarchar(8)
)

insert into HOSTLogIn values ('fatima123@gmail.com', 'yello123')
insert into HOSTLogIn values ('fizza123@gmail.com', 'red12345')
insert into HOSTLogIn values ('ushna123@gmail.com.com', 'grey7890')

Create Table Venue
(
venueId varchar(10) primary key
)

insert into venue values('V1')
insert into venue values('V2')
insert into venue values('V3')
insert into venue values('V4')
insert into venue values('V5')
insert into venue values('V6')

Create table onlinevenue(

Id varchar(10) PRIMARY KEY FOREIGN KEY REFERENCES Venue (venueId),
Total_Capacity int,
venueName nvarchar(50),
Note nvarchar(max)

);

insert into  onlinevenue values ('V2',15 ,'Google Meet','Link will be Provided Later')
insert into  onlinevenue values ('V4',11 ,'Zoom','Join with your Designation In Company')
insert into  onlinevenue values ('V6',12 ,'Skype','Join with Full Name')


create table physicalvenue(

Id varchar(10) primary key FOREIGN KEY  REFERENCES Venue (venueId),
Total_Capacity int,
venueName nvarchar(50),
Note nvarchar(max),      
status_ varchar(10)


);

create table physicalVenueDetails(

venueId varchar(10) ,
timeandDate datetime ,
status_ varchar(10)
constraint PK primary key  (venueId, timeandDate)
constraint FK Foreign key(venueId) references physicalVenue(Id)
);

insert into  physicalvenue values ('V1',15 ,'Conference Room ','Projector is not working','available')
insert into  physicalvenue values ('V3',20,'Auditorium ','No eatables allowed','available')
insert into  physicalvenue values ('V5',11 ,'Office',' Office Air Conditioner Not Working','available')

insert into physicalVenueDetails values ('V1','2012-06-18 22:34:09.000','booked');
insert into physicalVenueDetails values ('V1','2022-05-30 06:50:00.000','booked');

select * from AllMeeting
Create Table AllMeeting(

meeting_ID int identity(1,1) PRIMARY KEY,
venue_Id varchar(10)  FOREIGN KEY REFERENCES Venue (venueId),
hostemail nvarchar(60) FOREIGN KEY REFERENCES Host(email),
DepartmentId nvarchar(10) FOREIGN KEY REFERENCES Department (deptId),
meetingTitle nvarchar(100),
Date_ datetime,
description_ nvarchar(max),
mode nvarchar(30),
duration varchar(20)


)

insert into AllMeeting VALUES ('V1','fatima123@gmail.com','D1','Digital Marketing',
(convert(datetime,'18-06-12 10:34:09 PM',5)) , 'a meeting on digital marketing','physical', '2 hours')


insert into AllMeeting VALUES ('V2','fizza123@gmail.com','D2','Instagram',
(convert(datetime,'22-12-22 11:36:09 PM',5)) , 'A meeting on instagram page of company','online', '2 hours')


CREATE TABLE MEETINGParticipants(

meetingid int FOREIGN KEY  REFERENCES AllMeeting (meeting_ID),
participantEmail nvarchar(60) FOREIGN KEY REFERENCES Employee (email),

constraint PK_MEETINGPARTICIPANT primary key (meetingid, participantEmail)
);

insert into MEETINGParticipants VALUES (1,'ali123@gmail.com' )
insert into MEETINGParticipants VALUES (1,'jibran123@gmail.com' )
insert into MEETINGParticipants VALUES (2,'ali123@gmail.com' )

select * from Employee
select * from Department
select * from Host
select * from HOSTLogIn
select * from AllMeeting
select * from MEETINGParticipants
select * from Venue
select * from onlinevenue
select * from physicalvenue


----view to store the info of meetings that are already planned
go
create view VIEWEXISTINGMEETING
as
select meeting_ID, hostemail, DepartmentId, meetingTitle,Date_,description_,mode,duration,participantEmail
from AllMeeting A join MEETINGParticipants M on A.meeting_ID=M.meetingid
go

select * from VIEWEXISTINGMEETING

--procedure using the above view to view the details of meeting of the specific department
go
create procedure ExistingMeeting
@departmentId nvarchar(10)
as
begin
select * from VIEWEXISTINGMEETING where  @departmentId = DepartmentId
end
go

exec ExistingMeeting 'D1'

--Count no of employees in each department
go
create procedure NoOfEmployeesinDepartment
@dept nvarchar(10)
as
begin
select E.Department,  count(*) as 'No. of Employees' from Employee E where @dept = E.Department group by E.Department
end
go

exec  NoOfEmployeesinDepartment 'D2'

--SHOW Employees before any meeting is scheduled
go
create view EmployeeDetail
as
select * from Employee
go

select * from EmployeeDetail

--Update Employee Password

go
Create Procedure ResetPassword
 @ID nvarchar(60) , @Oldpass varchar(8) , @newpass varchar(8) ,@confirmPass varchar(8),@flag int output
 as
 begin
 if exists
(select * from employeeLogIn E where E.employeeemail=@ID and E.password_=@Oldpass and @newPass= @confirmPass and len(@newpass)=8)

begin

UPDATE employeeLogIn  set password_=@newpass where employeeemail=@ID AND password_=@Oldpass
set @flag=1
PRINT 'Password restored'
END

ELSE
BEGIN
 if exists
(select * from HOSTLogIn E where E.hostemail=@ID and E.password_=@Oldpass and @newPass= @confirmPass and len(@newpass)=8)

begin

UPDATE HOSTLogIn  set password_=@newpass where hostemail=@ID AND password_=@Oldpass
set @flag=1;

END
else
begin
set @flag=0;
end
END

END
go

declare @flag int
exec ResetPassword 'tayyab123@gmail.com' , 'red12345' , 'hwerfre','hi1456',@flag output
select @flag

select * from HOSTLogIn
select * from employeeLogIn

--Host Password Reset

go

--update host password
Create Procedure ResetHostPassword
 @ID nvarchar(60) , @Oldpass varchar(8) , @newpass varchar(8)
 as
 begin
 if exists
(select * from HOSTLogIn H where H.hostemail=@ID and H.password_=@Oldpass and len(@newpass)=8)

begin

UPDATE HOSTLogIn  set password_=@newpass where hostemail=@ID AND password_=@Oldpass

PRINT 'Password restored'
END

ELSE
BEGIN
PRINT'ERROR! Password not updated'
END
END
go

create procedure MyMeetings
@email nvarchar(60)
as
begin
if exists(select * from AllMeeting a where a.hostemail=@email)
select M.meeting_ID, M.meetingTitle, M.hostemail , d.deptName , m.mode, m.Date_ from AllMeeting M join Department d on d.deptId=M.DepartmentId join Venue v on m.venue_Id=v.venueId where m.hostemail=@email
end

exec MyMeetings 'hussain123@gmail.com'

exec ResetHostPassword 'hussain123@gmail.com' , 'yello123' , 'yellow23'

select * from Host
select * from HOSTLogIn



--view meeting details
go
create view physicalmeetingDetails
as
select H.Name_,d.deptName, a.meetingTitle, A.description_,A.Date_,A.mode, P.Type_ as 'RoomType' ,
P.Floor_,P.Note,P.status_ ,a.duration
from AllMeeting A join Venue V on V.venueId=A.venue_Id join physicalvenue P on P.Id=V.venueId
join Host H on A.hostemail=H.email
join  Department D on a.DepartmentId=D.deptId
go

select * from physicalmeetingDetails

--Online meeting details

go
create view onlinemeetingDetails
as
select H.Name_,d.deptName, a.meetingTitle, A.description_,A.Date_,A.mode, O.OnlinePlatform,O.Link,O.Note,a.duration
from AllMeeting A join Venue V on V.venueId=A.venue_Id join onlinevenue O on O.Id=V.venueId
join Host H on A.hostemail=H.email  
join  Department D on a.DepartmentId=D.deptId
go

select * from onlinemeetingDetails




--Display meeting details
go
create view displayMeetingDetails
as
select A.meeting_ID,T.deptName,H.Name_ ,A.meetingTitle, A.description_, A.mode,A.Date_,A.duration,V.venueId from AllMeeting A
join Department T on A.DepartmentId=T.deptId join Host H on H.email=A.hostemail join venue V on V.venueId=A.venue_Id
go

select * from displayMeetingDetails


--filter by department

go
create procedure FilterMeetingbyDept
@dept nvarchar(20),
@flag int output
as
begin
if exists (select * from displayMeetingDetails D where @dept=D.deptName)
begin
select * from displayMeetingDetails D where @dept=D.deptName
set @flag=1;
end
else
begin
set @flag=0;
end
end
go

--FilterMeetingbyDateTime

go
create procedure FilterMeetingbyDateTime
@datetime_ dateTIME,
@flag int output
as
begin
if exists (select * from displayMeetingDetails D where @datetime_=D.Date_)
begin

select * from displayMeetingDetails D where @datetime_=D.Date_
set @flag=1;
end
else
begin
set @flag=0;
end
end
go


--Filter by Venue
go
create procedure FilterbyVenue
@venue nvarchar(50), @flag int output
as
begin
if exists (select * from displayMeetingDetails D where @venue=D.venueId)
begin

select * from displayMeetingDetails D where @venue=D.venueId
set @flag=1;
end
else
begin
set @flag=0;
END
END

declare @flag int
exec FilterbyVenue 'V1', @flag output
select @flag



--Details of meetings
create procedure meetingView
as
begin
select M.meeting_ID,M.meetingTitle, M.hostemail , d.deptName , m.mode, m.Date_ from AllMeeting M join Department d on d.deptId=M.DepartmentId join Venue v on m.venue_Id=v.venueId  
end

exec meetingView

--Login for employee and host
create procedure LoginCheck
@email nvarchar(60),
@password varchar(10),
@flag int output
as
begin
if exists ( select * from employeeLogIn e where  e.employeeemail = @email and  e.password_ = @password )
begin
print 'VALID Email or Passward'
set @flag = 1;
end
else
begin
if exists ( select * from HOSTLogIn h where  h.hostemail = @email and  h.password_ = @password )
begin
print 'VALID Email or Passward'
set @flag = 2;

end
else
begin
print 'Invalid Email or Passward'
set @flag = 0;

end

end
end

declare @flag int,@s nvarchar(50)
exec LoginCheck 'tayyab123@gmail.com','red12345' ,@flag output
select @flag as 'output', @s as 'na'


--View to get all employees(view employees)
Create Procedure Employee_View
as
Select * from Employee
go

exec Employee_View

--Employee details for add participants
Create Procedure Employee_Detail
as
Select e.Name_,e.email from Employee e



--SignUp for employee

go
create procedure EmployeesignUp
@FullName nvarchar(50),
@CNIC nvarchar(15),
@Department nvarchar(10),
@phnNo nvarchar(20),
@Email nvarchar(60),
@passowrd nvarchar(8),
@flag int output

as
begin

if exists (select * from Employee E where E.email=@Email )
begin
set @flag=0
print 'User alreday exists'
end

else
begin
set @flag=1

insert into Employee values(@FullName,@CNIC,@Department,@phnNo,@Email)
insert into employeeLogIn values (@Email,@passowrd)
print 'succesfully signed up'
end
end
go


--Sign Up Host
go
create procedure Host_signUp
@FullName nvarchar(50),
@Department nvarchar(10),
@phnNo nvarchar(20),
@Email nvarchar(60),
@passowrd nvarchar(8),
@flag int output

as
begin

if exists (select * from Host E where E.email=@Email )
begin
set @flag=0
print 'User alreday exists'
end

else
begin
set @flag=1

insert into Host values(@FullName,@Department,@phnNo,@Email)
insert into HOSTLogIn values (@Email,@passowrd)
print 'succesfully signed up'
end
end
go

declare @flag int
exec Host_signUp 'Aslam','D3','03211111777','aslam13@gmail.com','grey1890', @flag output
select @flag as 'output'



--View to get all employees
Create Procedure Employee_View
as
Select * from Employee


exec Employee_View;

--View all participants in a meeting
go
create view ViewMeetingParticipants
as
select p.meetingid, m.meetingTitle , m.Date_, p.participantemail  from MEETINGParticipants p join  AllMeeting m on p.meetingid=m.meeting_ID join Employee e on e.email=p.participantemail
go

select * from ViewMeetingParticipants
go
create procedure MeetingId
@id int output
as
begin
select @id=Max(meeting_ID) from AllMeeting
end

declare @idd int
exec MeetingId @idd output
select @idd
select * from MEETINGParticipants
--ADD PARTICIPANT IN A MEETING
go
create procedure AddParticipants
@meetingId int,
@employeeemail nvarchar(60),
@flag int output
as
begin
if exists (select * from Employee e where e.email=@employeeemail )
begin
set @flag=1
insert into MEETINGParticipants values (@meetingId,@employeeemail)
end
else
begin
set @flag=0
end

end
go

declare @flag int
exec AddParticipants '3', 'ali123@gmail.com' , @flag output
select @flag

--SCHEDULE A MEETING

go
create procedure ScheduleaMeeting
@Title nvarchar(100),
@description nvarchar(max),
@mode nvarchar(30),
@date datetime,
@duration varchar(10),
@department nvarchar(10),
@hostinfo nvarchar(60),
@venue nvarchar(10),
@flag int output
as
begin
if exists (select * from AllMeeting m where m.Date_=@date and m.meetingTitle=@Title)
begin
set @flag=0
end
else
begin
if exists (select * from Venue v join physicalVenueDetails p on p.venueId=v.venueId where  @mode='physical' and p.status_='booked' and p.timeandDate=@date )
begin
set @flag=1;
end
else
begin
set @flag=2;
set @date=FORMAT(@date,'dd-MM-yyyy hh:mm')
insert into AllMeeting values (@venue,@hostinfo,@department,@Title,@date,@description,@mode,@duration)

if exists(select * from physicalVenueDetails p where @mode='physical' and @venue=p.venueId)
insert into physicalVenueDetails values(@venue,@date,'booked')



end
end
end
go

declare @flag2 int
exec ScheduleaMeeting 'Important Discussion11', 'Discussion related to quiz','online','2022-010-30 22:38:09.000','1 hour','D2','hussain123@gmail.com','V2',@flag2 output
select @flag2 as 'output'



SELECT * FROM AllMeeting
SELECT * FROM physicalVenueDetails
SELECT * FROM physicalVenue
drop procedure ScheduleaMeeting

--Cancel Meeting

go
create procedure cancelMeeting
@id int,
@flag int output
as
begin
if exists (select * from AllMeeting m where m.meeting_ID=@id)
begin
set @flag=1

declare @venue varchar(10)
select @venue= venue_Id from AllMeeting m where m.meeting_ID=@id
declare @date datetime
select @date= Date_ from AllMeeting m where m.meeting_ID=@id
delete from MEETINGParticipants where meetingid=@id
delete from AllMeeting where meeting_ID=@id



   if exists(select * from AllMeeting m join physicalvenue p on m.venue_Id=p.Id join physicalVenueDetails d on p.Id=d.venueId where m.mode='physical' and m.Date_=d.timeandDate and p.Id=@venue)

update physicalvenue set status_='available' where @venue=id
delete from physicalVenueDetails where venueId=@venue and timeandDate=@date

end
else
begin
set @flag=0
print 'cannot cancel the meeting'
end
end
go

select * from AllMeeting
select * from MEETINGParticipants
select * from physicalvenue
select * from physicalVenueDetails

declare @flag3 int
exec cancelMeeting 17 , @flag3 output
select @flag3

--procedure to reschedule Meetings
go
create procedure rescheduleMeeting
 @id int,
@dateTime datetime,
@flag int output
as
begin
if exists (select *from AllMeeting a where a.meeting_ID=@id)
begin
declare @venue varchar(10)
select @venue= venue_Id from AllMeeting m where m.meeting_ID=@id


update AllMeeting set Date_=@dateTime where meeting_ID=@id
update physicalVenueDetails set timeandDate=@dateTime where venueId=@venue
set @flag=1;
end
else
begin
set @flag=0
end
end

select * from AllMeeting
select * from physicalVenueDetails

declare @flag4 int
exec rescheduleMeeting 15, '2022-06-20 01:00:00' ,@flag4 output
select @flag4



--Procedure to view Employee Meetings
go
create Procedure EmpMeetings
@email nvarchar(60)
as
begin
if exists
(select * from MeetingParticipants M where  @email =M.participantEmail )
begin
Select p.meeting_ID,   p.meetingTitle, p.hostemail , d.deptName, p.mode,p.Date_ from MEETINGParticipants  M  join AllMeeting p on M.meetingid = p.meeting_ID join Department d on d.deptId = p.DepartmentId where M.participantEmail = @email

end
else
begin

print 'No Meetings Scehduled'
end
end
go

select * from employeeLogIn
declare @flag int
exec EmpMeetings 'ali123@gmail.com' , @flag output
select @flag


--procedure to view one meeting  participants
create Procedure OneMeetingParticipants
@ID int, @flag int output
as
begin
if exists
(select * from MeetingParticipants M where  @ID =M.meetingid )
begin
select m.participantEmail from MEETINGParticipants m where @ID = m.meetingid
set @flag =1
end
else
begin
set @flag = 0
print 'No Participants'
end
end


declare @flag int
exec OneMeetingParticipants '1' , @flag output
select @flag


--Procedure to show meeting details

create Procedure OneMeetingDetail
@ID nvarchar(60) , @flag int output
as
begin
if exists
(select * from AllMeeting M where  @ID = M.meeting_ID and M.mode = 'online' )
begin
Select  M.meetingTitle, M.hostemail , d.deptName, v.venueName  , v.Note, M.description_, M.Date_ , M.duration, M.mode  from AllMeeting M join Department d on d.deptId = M.DepartmentId join onlinevenue v on v.Id = M.venue_Id where M.meeting_ID = @ID
set @flag = 1
end
else
if exists
(select * from AllMeeting M where  @ID = M.meeting_ID and M.mode = 'physical')
begin
Select  M.meetingTitle, M.hostemail , d.deptName , M.Date_ , M.duration, M.mode , v.Note, v.venueName,M.description_ from AllMeeting M join Department d on d.deptId = M.DepartmentId join physicalvenue v on v.Id = M.venue_Id where M.meeting_ID = @ID
set @flag = 1
end
else
begin
set @flag = 0
end
end



declare @flag int
exec OneMeetingDetail '1' , @flag output
select @flag


select * from employeeLogIn



------------------------------------------------------------------------------------------------------------------------------------------
go
create database db;
go
use  db
go


Create Table Employee
(

ID int Identity(1,1),
Name_ nvarchar(50) NOT NULL,
CNIC nvarchar(15) NOT NULL,
Department nvarchar(10) NOT NULL,
phone_Num nvarchar(20),
email nvarchar(60) primary key
)


insert into  employee values ('Hassan', '3520224564741', 'D1', '03031111222', 'hassan123@gmail.com')
insert into  employee values ('Ali', '3520224564742', 'D2', '03032323123', 'ali123@gmail.com')
insert into  employee values ('Jibran', '3520224564743', 'D3', '03031111333', 'jibran123@gmail.com')

cREATE TABLE employeeLogIn
(
employeeemail nvarchar(60)  FOREIGN KEY  REFERENCES Employee (email),
password_ nvarchar(8)

constraint PK_employeeLogIn primary key (employeeemail,password_)
)

insert into employeeLogIn values ('ali123@gmail.com', 'hello123')
insert into employeeLogIn values ('jibran123@gmail.com', 'world321')
insert into employeeLogIn values ('hassan123@gmail.com', 'hi@1fasd')


Create Table Department
(
deptId nvarchar(10) primary key,
deptName nvarchar(50),
dept_email nvarchar(60)
)

insert into  department values ('D1','Marketing','marketing123@gmail.com')
insert into  department values ('D2','Social Media','socialmedia321@gmail.com')
insert into  department values ('D3','Sales','sales123@gmail.com')

Create Table Host(

ID INT Identity(1,1),
Name_ nvarchar(50) NOT NULL,
Department nvarchar(10) FOREIGN KEY REFERENCES Department (deptId),
phone_Num nvarchar(20),
email nvarchar(60) NOT NULL PRIMARY  KEY
)

insert into  host values ('Fatima','MarketingManager' ,'D1', '03212222999', 'fatima123@gmail.com')
insert into  host values ('Fizza','SocialMediaManager' ,'D2','03368889999' , 'fizza123@gmail.com')
insert into  host values ('Ushna','SalesManager' ,'D3', '03121111777', 'ushna123@gmail.com')
 
 truncate table host
Create Table HOSTLogIn(

hostemail nvarchar(60) FOREIGN KEY REFERENCES HOST (email),
password_ nvarchar(8)
)

insert into HOSTLogIn values ('fatima123@gmail.com', 'yello123')
insert into HOSTLogIn values ('fizza123@gmail.com', 'red12345')
insert into HOSTLogIn values ('ushna123@gmail.com.com', 'grey7890')

Create Table Venue
(
venueId varchar(10) primary key
)

insert into venue values('V1')
insert into venue values('V2')
insert into venue values('V3')
insert into venue values('V4')
insert into venue values('V5')
insert into venue values('V6')

Create table onlinevenue(

Id varchar(10) PRIMARY KEY FOREIGN KEY REFERENCES Venue (venueId),
Total_Capacity int,
venueName nvarchar(50),
Note nvarchar(max)

);

insert into  onlinevenue values ('V2',15 ,'Google Meet','Link will be Provided Later')
insert into  onlinevenue values ('V4',11 ,'Zoom','Join with your Designation In Company')
insert into  onlinevenue values ('V6',12 ,'Skype','Join with Full Name')


create table physicalvenue(

Id varchar(10) primary key FOREIGN KEY  REFERENCES Venue (venueId),
Total_Capacity int,
venueName nvarchar(50),
Note nvarchar(max),      
status_ varchar(10)


);

create table physicalVenueDetails(

venueId varchar(10) ,
timeandDate datetime ,
status_ varchar(10)
constraint PK primary key  (venueId, timeandDate)
constraint FK Foreign key(venueId) references physicalVenue(Id)
);

insert into  physicalvenue values ('V1',15 ,'Conference Room ','Projector is not working','available')
insert into  physicalvenue values ('V3',20,'Auditorium ','No eatables allowed','available')
insert into  physicalvenue values ('V5',11 ,'Office',' Office Air Conditioner Not Working','available')

insert into physicalVenueDetails values ('V1','2012-06-18 22:34:09.000','booked');
insert into physicalVenueDetails values ('V1','2022-05-30 06:50:00.000','booked');

select * from AllMeeting
Create Table AllMeeting(

meeting_ID int identity(1,1) PRIMARY KEY,
venue_Id varchar(10)  FOREIGN KEY REFERENCES Venue (venueId),
hostemail nvarchar(60) FOREIGN KEY REFERENCES Host(email),
DepartmentId nvarchar(10) FOREIGN KEY REFERENCES Department (deptId),
meetingTitle nvarchar(100),
Date_ datetime,
description_ nvarchar(max),
mode nvarchar(30),
duration varchar(20)


)

insert into AllMeeting VALUES ('V1','fatima123@gmail.com','D1','Digital Marketing',
(convert(datetime,'18-06-12 10:34:09 PM',5)) , 'a meeting on digital marketing','physical', '2 hours')


insert into AllMeeting VALUES ('V2','fizza123@gmail.com','D2','Instagram',
(convert(datetime,'22-12-22 11:36:09 PM',5)) , 'A meeting on instagram page of company','online', '2 hours')


CREATE TABLE MEETINGParticipants(

meetingid int FOREIGN KEY  REFERENCES AllMeeting (meeting_ID),
participantEmail nvarchar(60) FOREIGN KEY REFERENCES Employee (email),

constraint PK_MEETINGPARTICIPANT primary key (meetingid, participantEmail)
);

insert into MEETINGParticipants VALUES (1,'ali123@gmail.com' )
insert into MEETINGParticipants VALUES (1,'jibran123@gmail.com' )
insert into MEETINGParticipants VALUES (2,'ali123@gmail.com' )

select * from Employee
select * from Department
select * from Host
select * from HOSTLogIn
select * from AllMeeting
select * from MEETINGParticipants
select * from Venue
select * from onlinevenue
select * from physicalvenue


----view to store the info of meetings that are already planned
go
create view VIEWEXISTINGMEETING
as
select meeting_ID, hostemail, DepartmentId, meetingTitle,Date_,description_,mode,duration,participantEmail
from AllMeeting A join MEETINGParticipants M on A.meeting_ID=M.meetingid
go

select * from VIEWEXISTINGMEETING

--procedure using the above view to view the details of meeting of the specific department
go
create procedure ExistingMeeting
@departmentId nvarchar(10)
as
begin
select * from VIEWEXISTINGMEETING where  @departmentId = DepartmentId
end
go

exec ExistingMeeting 'D1'

--Count no of employees in each department
go
create procedure NoOfEmployeesinDepartment
@dept nvarchar(10)
as
begin
select E.Department,  count(*) as 'No. of Employees' from Employee E where @dept = E.Department group by E.Department
end
go

exec  NoOfEmployeesinDepartment 'D2'

--SHOW Employees before any meeting is scheduled
go
create view EmployeeDetail
as
select * from Employee
go

select * from EmployeeDetail

--Update Employee Password

go
Create Procedure ResetPassword
 @ID nvarchar(60) , @Oldpass varchar(8) , @newpass varchar(8) ,@confirmPass varchar(8),@flag int output
 as
 begin
 if exists
(select * from employeeLogIn E where E.employeeemail=@ID and E.password_=@Oldpass and @newPass= @confirmPass and len(@newpass)=8)

begin

UPDATE employeeLogIn  set password_=@newpass where employeeemail=@ID AND password_=@Oldpass
set @flag=1
PRINT 'Password restored'
END

ELSE
BEGIN
 if exists
(select * from HOSTLogIn E where E.hostemail=@ID and E.password_=@Oldpass and @newPass= @confirmPass and len(@newpass)=8)

begin

UPDATE HOSTLogIn  set password_=@newpass where hostemail=@ID AND password_=@Oldpass
set @flag=1;

END
else
begin
set @flag=0;
end
END

END
go

declare @flag int
exec ResetPassword 'tayyab123@gmail.com' , 'red12345' , 'hwerfre','hi1456',@flag output
select @flag

select * from HOSTLogIn
select * from employeeLogIn

--Host Password Reset

go

--update host password
Create Procedure ResetHostPassword
 @ID nvarchar(60) , @Oldpass varchar(8) , @newpass varchar(8)
 as
 begin
 if exists
(select * from HOSTLogIn H where H.hostemail=@ID and H.password_=@Oldpass and len(@newpass)=8)

begin

UPDATE HOSTLogIn  set password_=@newpass where hostemail=@ID AND password_=@Oldpass

PRINT 'Password restored'
END

ELSE
BEGIN
PRINT'ERROR! Password not updated'
END
END
go

create procedure MyMeetings
@email nvarchar(60)
as
begin
if exists(select * from AllMeeting a where a.hostemail=@email)
select M.meeting_ID, M.meetingTitle, M.hostemail , d.deptName , m.mode, m.Date_ from AllMeeting M join Department d on d.deptId=M.DepartmentId join Venue v on m.venue_Id=v.venueId where m.hostemail=@email
end

exec MyMeetings 'hussain123@gmail.com'

exec ResetHostPassword 'hussain123@gmail.com' , 'yello123' , 'yellow23'

select * from Host
select * from HOSTLogIn



--view meeting details
go
create view physicalmeetingDetails
as
select H.Name_,d.deptName, a.meetingTitle, A.description_,A.Date_,A.mode, P.Type_ as 'RoomType' ,
P.Floor_,P.Note,P.status_ ,a.duration
from AllMeeting A join Venue V on V.venueId=A.venue_Id join physicalvenue P on P.Id=V.venueId
join Host H on A.hostemail=H.email
join  Department D on a.DepartmentId=D.deptId
go

select * from physicalmeetingDetails

--Online meeting details

go
create view onlinemeetingDetails
as
select H.Name_,d.deptName, a.meetingTitle, A.description_,A.Date_,A.mode, O.OnlinePlatform,O.Link,O.Note,a.duration
from AllMeeting A join Venue V on V.venueId=A.venue_Id join onlinevenue O on O.Id=V.venueId
join Host H on A.hostemail=H.email  
join  Department D on a.DepartmentId=D.deptId
go

select * from onlinemeetingDetails




--Display meeting details
go
create view displayMeetingDetails
as
select A.meeting_ID,T.deptName,H.Name_ ,A.meetingTitle, A.description_, A.mode,A.Date_,A.duration,V.venueId from AllMeeting A
join Department T on A.DepartmentId=T.deptId join Host H on H.email=A.hostemail join venue V on V.venueId=A.venue_Id
go

select * from displayMeetingDetails


--filter by department

go
create procedure FilterMeetingbyDept
@dept nvarchar(20),
@flag int output
as
begin
if exists (select * from displayMeetingDetails D where @dept=D.deptName)
begin
select * from displayMeetingDetails D where @dept=D.deptName
set @flag=1;
end
else
begin
set @flag=0;
end
end
go

--FilterMeetingbyDateTime

go
create procedure FilterMeetingbyDateTime
@datetime_ dateTIME,
@flag int output
as
begin
if exists (select * from displayMeetingDetails D where @datetime_=D.Date_)
begin

select * from displayMeetingDetails D where @datetime_=D.Date_
set @flag=1;
end
else
begin
set @flag=0;
end
end
go


--Filter by Venue
go
create procedure FilterbyVenue
@venue nvarchar(50), @flag int output
as
begin
if exists (select * from displayMeetingDetails D where @venue=D.venueId)
begin

select * from displayMeetingDetails D where @venue=D.venueId
set @flag=1;
end
else
begin
set @flag=0;
END
END

declare @flag int
exec FilterbyVenue 'V1', @flag output
select @flag



--Details of meetings
create procedure meetingView
as
begin
select M.meeting_ID,M.meetingTitle, M.hostemail , d.deptName , m.mode, m.Date_ from AllMeeting M join Department d on d.deptId=M.DepartmentId join Venue v on m.venue_Id=v.venueId  
end

exec meetingView

--Login for employee and host
create procedure LoginCheck
@email nvarchar(60),
@password varchar(10),
@flag int output
as
begin
if exists ( select * from employeeLogIn e where  e.employeeemail = @email and  e.password_ = @password )
begin
print 'VALID Email or Passward'
set @flag = 1;
end
else
begin
if exists ( select * from HOSTLogIn h where  h.hostemail = @email and  h.password_ = @password )
begin
print 'VALID Email or Passward'
set @flag = 2;

end
else
begin
print 'Invalid Email or Passward'
set @flag = 0;

end

end
end

declare @flag int,@s nvarchar(50)
exec LoginCheck 'tayyab123@gmail.com','red12345' ,@flag output
select @flag as 'output', @s as 'na'


--View to get all employees(view employees)
Create Procedure Employee_View
as
Select * from Employee
go

exec Employee_View

--Employee details for add participants
Create Procedure Employee_Detail
as
Select e.Name_,e.email from Employee e



--SignUp for employee

go
create procedure EmployeesignUp
@FullName nvarchar(50),
@CNIC nvarchar(15),
@Department nvarchar(10),
@phnNo nvarchar(20),
@Email nvarchar(60),
@passowrd nvarchar(8),
@flag int output

as
begin

if exists (select * from Employee E where E.email=@Email )
begin
set @flag=0
print 'User alreday exists'
end

else
begin
set @flag=1

insert into Employee values(@FullName,@CNIC,@Department,@phnNo,@Email)
insert into employeeLogIn values (@Email,@passowrd)
print 'succesfully signed up'
end
end
go


--Sign Up Host
go
create procedure Host_signUp
@FullName nvarchar(50),
@Department nvarchar(10),
@phnNo nvarchar(20),
@Email nvarchar(60),
@passowrd nvarchar(8),
@flag int output

as
begin

if exists (select * from Host E where E.email=@Email )
begin
set @flag=0
print 'User alreday exists'
end

else
begin
set @flag=1

insert into Host values(@FullName,@Department,@phnNo,@Email)
insert into HOSTLogIn values (@Email,@passowrd)
print 'succesfully signed up'
end
end
go

declare @flag int
exec Host_signUp 'Aslam','D3','03211111777','aslam13@gmail.com','grey1890', @flag output
select @flag as 'output'



--View to get all employees
Create Procedure Employee_View
as
Select * from Employee


exec Employee_View;

--View all participants in a meeting
go
create view ViewMeetingParticipants
as
select p.meetingid, m.meetingTitle , m.Date_, p.participantemail  from MEETINGParticipants p join  AllMeeting m on p.meetingid=m.meeting_ID join Employee e on e.email=p.participantemail
go

select * from ViewMeetingParticipants
go
create procedure MeetingId
@id int output
as
begin
select @id=Max(meeting_ID) from AllMeeting
end

declare @idd int
exec MeetingId @idd output
select @idd
select * from MEETINGParticipants
--ADD PARTICIPANT IN A MEETING
go
create procedure AddParticipants
@meetingId int,
@employeeemail nvarchar(60),
@flag int output
as
begin
if exists (select * from Employee e where e.email=@employeeemail )
begin
set @flag=1
insert into MEETINGParticipants values (@meetingId,@employeeemail)
end
else
begin
set @flag=0
end

end
go

declare @flag int
exec AddParticipants '3', 'ali123@gmail.com' , @flag output
select @flag

--SCHEDULE A MEETING

go
create procedure ScheduleaMeeting
@Title nvarchar(100),
@description nvarchar(max),
@mode nvarchar(30),
@date datetime,
@duration varchar(10),
@department nvarchar(10),
@hostinfo nvarchar(60),
@venue nvarchar(10),
@flag int output
as
begin
if exists (select * from AllMeeting m where m.Date_=@date and m.meetingTitle=@Title)
begin
set @flag=0
end
else
begin
if exists (select * from Venue v join physicalVenueDetails p on p.venueId=v.venueId where  @mode='physical' and p.status_='booked' and p.timeandDate=@date )
begin
set @flag=1;
end
else
begin
set @flag=2;
set @date=FORMAT(@date,'dd-MM-yyyy hh:mm')
insert into AllMeeting values (@venue,@hostinfo,@department,@Title,@date,@description,@mode,@duration)

if exists(select * from physicalVenueDetails p where @mode='physical' and @venue=p.venueId)
insert into physicalVenueDetails values(@venue,@date,'booked')



end
end
end
go

declare @flag2 int
exec ScheduleaMeeting 'Important Discussion11', 'Discussion related to quiz','online','2022-010-30 22:38:09.000','1 hour','D2','hussain123@gmail.com','V2',@flag2 output
select @flag2 as 'output'



SELECT * FROM AllMeeting
SELECT * FROM physicalVenueDetails
SELECT * FROM physicalVenue
drop procedure ScheduleaMeeting

--Cancel Meeting

go
create procedure cancelMeeting
@id int,
@flag int output
as
begin
if exists (select * from AllMeeting m where m.meeting_ID=@id)
begin
set @flag=1

declare @venue varchar(10)
select @venue= venue_Id from AllMeeting m where m.meeting_ID=@id
declare @date datetime
select @date= Date_ from AllMeeting m where m.meeting_ID=@id
delete from MEETINGParticipants where meetingid=@id
delete from AllMeeting where meeting_ID=@id



   if exists(select * from AllMeeting m join physicalvenue p on m.venue_Id=p.Id join physicalVenueDetails d on p.Id=d.venueId where m.mode='physical' and m.Date_=d.timeandDate and p.Id=@venue)

update physicalvenue set status_='available' where @venue=id
delete from physicalVenueDetails where venueId=@venue and timeandDate=@date

end
else
begin
set @flag=0
print 'cannot cancel the meeting'
end
end
go

select * from AllMeeting
select * from MEETINGParticipants
select * from physicalvenue
select * from physicalVenueDetails

declare @flag3 int
exec cancelMeeting 17 , @flag3 output
select @flag3

--procedure to reschedule Meetings
go
create procedure rescheduleMeeting
 @id int,
@dateTime datetime,
@flag int output
as
begin
if exists (select *from AllMeeting a where a.meeting_ID=@id)
begin
declare @venue varchar(10)
select @venue= venue_Id from AllMeeting m where m.meeting_ID=@id


update AllMeeting set Date_=@dateTime where meeting_ID=@id
update physicalVenueDetails set timeandDate=@dateTime where venueId=@venue
set @flag=1;
end
else
begin
set @flag=0
end
end

select * from AllMeeting
select * from physicalVenueDetails

declare @flag4 int
exec rescheduleMeeting 15, '2022-06-20 01:00:00' ,@flag4 output
select @flag4



--Procedure to view Employee Meetings
go
create Procedure EmpMeetings
@email nvarchar(60)
as
begin
if exists
(select * from MeetingParticipants M where  @email =M.participantEmail )
begin
Select p.meeting_ID,   p.meetingTitle, p.hostemail , d.deptName, p.mode,p.Date_ from MEETINGParticipants  M  join AllMeeting p on M.meetingid = p.meeting_ID join Department d on d.deptId = p.DepartmentId where M.participantEmail = @email

end
else
begin

print 'No Meetings Scehduled'
end
end
go

select * from employeeLogIn
declare @flag int
exec EmpMeetings 'ali123@gmail.com' , @flag output
select @flag


--procedure to view one meeting  participants
create Procedure OneMeetingParticipants
@ID int, @flag int output
as
begin
if exists
(select * from MeetingParticipants M where  @ID =M.meetingid )
begin
select m.participantEmail from MEETINGParticipants m where @ID = m.meetingid
set @flag =1
end
else
begin
set @flag = 0
print 'No Participants'
end
end


declare @flag int
exec OneMeetingParticipants '1' , @flag output
select @flag


--Procedure to show meeting details

create Procedure OneMeetingDetail
@ID nvarchar(60) , @flag int output
as
begin
if exists
(select * from AllMeeting M where  @ID = M.meeting_ID and M.mode = 'online' )
begin
Select  M.meetingTitle, M.hostemail , d.deptName, v.venueName  , v.Note, M.description_, M.Date_ , M.duration, M.mode  from AllMeeting M join Department d on d.deptId = M.DepartmentId join onlinevenue v on v.Id = M.venue_Id where M.meeting_ID = @ID
set @flag = 1
end
else
if exists
(select * from AllMeeting M where  @ID = M.meeting_ID and M.mode = 'physical')
begin
Select  M.meetingTitle, M.hostemail , d.deptName , M.Date_ , M.duration, M.mode , v.Note, v.venueName,M.description_ from AllMeeting M join Department d on d.deptId = M.DepartmentId join physicalvenue v on v.Id = M.venue_Id where M.meeting_ID = @ID
set @flag = 1
end
else
begin
set @flag = 0
end
end



declare @flag int
exec OneMeetingDetail '1' , @flag output
select @flag


select * from employeeLogIn
-- פרויקט זה עוסק על סטודיו המציע שיעורי ספורט
use master
GO

IF NOT EXISTS(
	SELECT [name]
	FROM sys.databases
	WHERE [name] = 'StudioDB'
)
CREATE DATABASE StudioDB;
GO

USE StudioDB;
GO

CREATE TABLE Customers(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	customerName varchar(50) NOT NULL,
	phoneNo varchar(15) NOT NULL,
	customerAddress varchar(80)
);

CREATE TABLE Trainers(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TrainerName varchar(50) NOT NULL,	
	phoneNo varchar(15) NOT NULL,
);

CREATE TABLE ClassType(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ClassName varchar(50) NOT NULL,	
	Price int NOT NULL,
);

CREATE TABLE ClassesSchedule(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ClassTypeId int NOT NULL FOREIGN KEY REFERENCES ClassType(id),
	TrainerId int NOT NULL FOREIGN KEY REFERENCES Trainers(id),
	ClassDate DATE NOT NULL,
	HourClass time(0) NOT NULL,
	ClassNo int NOT NULL,
);

CREATE TABLE RegistrarionToClasses(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	customerId int NOT NULL FOREIGN KEY REFERENCES Customers(id),
	ClassesScheduleId int NOT NULL FOREIGN KEY REFERENCES ClassesSchedule(id),
);


INSERT INTO ClassType VALUES ('Pilates', '40');
INSERT INTO ClassType VALUES ('yoga', '50');
INSERT INTO ClassType VALUES ('Zumba', '25');
INSERT INTO ClassType VALUES ('Aerobic Dance', '35');
INSERT INTO ClassType VALUES ('Spinning', '45');
INSERT INTO ClassType VALUES ('Strength Training', '30');
INSERT INTO ClassType VALUES ('TRX', '55');
INSERT INTO ClassType VALUES ('Trampolines', '60');


INSERT INTO Customers VALUES 
('Lital Azizzada','050-8762536', 'Weitzman 94, Netanya'),
('Sahar Hason','050-8936592', 'Begin 9, Tel Aviv'),
('Liron Zehavi','054-8264836',  'Hatarsat 34, Tel Aviv'),
('Adam Cohen','052-9872346', 'Geffen 7, Tel Aviv'),
('Shelly Mizrahi','050-3749584', 'Kaplan 22, Tel Aviv'),
('Tal Askenazi','053-4829384', 'Weitzman 9, Tel Aviv'),
('Tamar Gans', '052738236', 'Golda meir 23, Haifa'),
('Gila Naftchi', '0536726384','Amnon N Tamar 87, Netanya'),
('Amir Fridman', '0542374823', 'Hanotea 63, Bat Yam'),
('Eti Pos','0502639456','Sokolov 41, Hadera'),
('Livnat Moshe','052-6458945','Carmel 34, Herzliya'),
('Mirit Lahmi','052-7848752','Bialik 21, Netanya'),
('Rina Melamed','054-7539572','Ben Tzion 1, Haifa'),
('Rotem Zagory','050-3638481','Even Gvirol 8, Hadera'),
('Aviram Haim','050-6978478','Ben Gurion 12, Netanya'),
('Eli Shalom','054-7856541','Sokolov 87, Haifa'),
('Julia Robert','052-3192208','Weizman 102, Hadera'),
('Bred Pit','054-4624667','Namir 18, Hadera'),
('Limor Ezra','054-7448365','Neomi Shemer 65 Herzliya'),
('Yoni Ben David','054-2520966','Rambam 75, Haifa'),
('Tal Menahem','050-2467345','Iris 12, Netanya'),
('Ayala Itzhaki','050-9283974','Oranim 3, Herzliya'),
('Oz David','054-9282347','Ben Gurion 9, Herzliya'),
('Tal Tamin','054-3748625','Bialik 22, Haifa'),
('Rona Flor','052-3827364','Carmel 34, Hadera');

INSERT INTO Trainers VALUES 
('Jenifer Lopez','052-8263746'),
('Ariana Grande','053-8273847'),
('Lana Del Rey', '054-2738493'),
('Noa kirel','052-6384765'),
('Dudu Tasa','050-2837283');



INSERT INTO ClassesSchedule VALUES 

(1,5,'1-FEB-2022','16:00',1),
(2,4,'1-FEB-2022','16:00',2),
(3,3,'1-FEB-2022','17:00',3),
(4,2,'1-FEB-2022','17:00',2),


(6,5,'2-FEB-2022','16:00',3),
(7,4,'2-FEB-2022','17:00',2),
(5,2,'2-FEB-2022','19:00',1),
(3,1,'2-FEB-2022','20:00',3),
(1,4,'2-FEB-2022','21:00',1),

(8,4,'3-FEB-2022','16:00',2),
(7,2,'3-FEB-2022','17:00',3),
(6,1,'3-FEB-2022','18:00',2),
(5,3,'3-FEB-2022','19:00',1),


(1,4,'6-FEB-2022','16:00',3),
(2,2,'6-FEB-2022','16:00',2),
(1,1,'6-FEB-2022','17:00',1),
(5,3,'6-FEB-2022','17:00',3),
(7,1,'6-FEB-2022','19:00',2),

(2,4,'7-FEB-2022','16:00',3),
(5,2,'7-FEB-2022','16:00',2),
(6,1,'7-FEB-2022','17:00',1);


INSERT INTO RegistrarionToClasses VALUES 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),

(7,2),
(8,2),
(9,2),
(10,2),
(11,2),

(12,3),
(13,3),
(14,3),
(15,3),
(15,3),
(16,3),

(17,4),
(18,4),
(19,4),
(20,4),
(21,4),

(22,5),
(23,5),
(24,5),
(25,5),
(1,5),
(2,5),

(3,6),
(4,6),
(5,6),
(6,6),
(7,6),
(8,6),

(9,7),
(10,7),
(17,7),
(8,7),
(23,7),

(25,8),
(17,8),
(3,8),
(12,8),
(9,8),

(11,9),
(9,9),
(18,9),
(22,9),
(25,9),
(3,9),

(24,10),
(1,10),
(3,10),
(13,10),
(19,10),
(24,10),
(15,10),

(8,11),
(20,11),
(10,11),
(3,11),
(23,11),
(4,11),
(9,11),
(12,11),


(1,12),
(2,12),
(3,12),
(4,12),
(5,12),
(5,12),
(6,12),
(7,12),
(8,12),
(9,12),

(10,13),
(11,13),
(12,13),
(13,13),
(14,13),
(15,13),
(16,13),
(17,13),
(18,13),
(19,13),

(20,14),
(21,14),
(22,14),
(23,14),
(24,14),
(25,14),
(1,14),
(2,14),
(3,14),
(4,14),

(5,15),
(6,15),
(7,15),
(8,15),
(9,15),
(10,15),
(11,15),
(12,15),
(13,15),
(14,15),
(15,15),
(16,15),
(17,15),
(18,15),
(19,15),
(20,15),


(21,16),
(22,16),
(23,16),
(24,16),
(25,16),
(1,16),


(2,17),
(3,17),
(4,17),
(5,17),
(6,17),
(7,17),


(8,18),
(9,18),
(10,18),
(11,18),
(12,18),
(13,18),
(14,18),

(15,19),
(16,19),
(17,19),
(18,19),
(19,19),
(20,19),
(21,19),

(22,20),
(23,20),
(24,20),
(25,20),

(1,21),
(2,21),
(3,21),
(4,21),
(5,21),
(6,21);


select *
from Customers
select *
from Trainers
select *
from ClassType
select *
from RegistrarionToClasses
select *
from ClassesSchedule


-- stored procedure 1: All Registrarion By Customer number

CREATE Proc spAllRegistrarionByCustomerNo
@Customerid int,
@UntilDate DATETIME
as
Begin
	SELECT Customers.Id, RegistrarionToClasses.id, ClassesSchedule.ClassDate, ClassesSchedule.HourClass
	FROM Customers JOIN RegistrarionToClasses ON Customers.id = RegistrarionToClasses.customerId
	JOIN ClassesSchedule on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	WHERE Customers.id = @Customerid AND ClassesSchedule.ClassDate < @UntilDate
end

exec spAllRegistrarionByCustomerNo '22' , '2022-02-10'

-- stored procedure 2: All revenue per customer

CREATE Proc spAllRevenuePerCustomerByCustomerName
@CustomerName varchar(50)
as
Begin
   SELECT Customers.customerName, sum(ClassType.price)
	FROM Customers JOIN RegistrarionToClasses ON Customers.id = RegistrarionToClasses.customerId
	JOIN ClassesSchedule on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	where Customers.customerName = @CustomerName
	group by Customers.customerName
end

exec spAllRevenuePerCustomerByCustomerName 'Tal Tamin'

go


-- stored procedure 3: Which Lessons Does The Trainer
drop Proc spWhichLessonsDoesTheTrainer
CREATE Proc spWhichLessonsDoesTheTrainer
@trainerName varchar(50)

as
Begin
	SELECT trainers.TrainerName ,ClassType.ClassName, ClassesSchedule.ClassDate, ClassesSchedule.HourClass
	FROM trainers JOIN classesschedule ON trainers.id = classesschedule.TrainerId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	where trainers.TrainerName=@trainerName
end

exec spWhichLessonsDoesTheTrainer 'Noa Kirel'


-- stored procedure 4: Trainer Lesson's Sum 

CREATE Proc spTrainerLessonSum
@TrainerName varchar(50)

as
Begin
	SELECT trainers.TrainerName , count(*)
	FROM trainers JOIN classesschedule ON trainers.id = classesschedule.TrainerId
	JOIN RegistrarionToClasses on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
    where Trainers.TrainerName = @TrainerName
	group by trainers.TrainerName 
	
end
 exec spTrainerLessonSum  'noa Kirel'


-- stored procedure 5: Lesson detail

CREATE Proc spLessonDetail
@LessonName varchar(50),
@LessonDate DATETIME,
@LessonHour time

as
Begin
	 SELECT customers.customerName, trainers.TrainerName, ClassType.price, classesschedule.classno 
	FROM trainers JOIN classesschedule ON trainers.id = classesschedule.TrainerId
	JOIN RegistrarionToClasses on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	join customers on Customers.id = RegistrarionToClasses.customerId
	where  ClassType.ClassName  =@LessonName AND
             ClassesSchedule.ClassDate =@LessonDate AND
			ClassesSchedule.HourClass= @LessonHour
end

exec spLessonDetail 'Pilates', '2022-02-06', '17:00:00'

select *
from classesschedule


-- stored procedure 6: finding Customers or Trainers by Letters 

CREATE Proc SPfindingCustomersOrTrainers
@TableName varchar(50),        
@PersonNameIncludes varchar(50)          
as
Begin
	IF @TableName = 'Customers'
		BEGIN
			SELECT customerName, phoneNo
			FROM Customers 
			WHERE customerName LIKE '%'+@PersonNameIncludes+'%'
		END
	ELSE
		IF @TableName = 'trainers'
			BEGIN
				SELECT trainerName, phoneNo
				FROM trainers 
				WHERE trainerName LIKE '%'+@PersonNameIncludes+'%'
			END
		ELSE
			BEGIN 
				SELECT 'Please use either Customers or Trainers for param 1'
			END
end

exec SPfindingCustomersOrTrainers 'Trainers','du';

-- stored procedure 7: How Many Registration Per Customer

CREATE PROCEDURE spHowManyRegistrationPerCustomer
as
begin
	SELECT customers.customerName, COUNT(RegistrarionToClasses.id) as 'Count'
	FROM Customers JOIN RegistrarionToClasses ON Customers.id = RegistrarionToClasses.customerId
	GROUP BY customerId, customers.customerName
end
GO

exec spHowManyRegistrationPerCustomer
GO

-- window function 8: Avg revenue per customer

 	SELECT customers.customerName, AVG(ClassType.price) OVER(PARTITION BY customerName ORDER BY customerName) AS AVERAGE_Customer
	FROM trainers JOIN classesschedule ON trainers.id = classesschedule.TrainerId
	JOIN RegistrarionToClasses on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	join customers on Customers.id = RegistrarionToClasses.customerId


-- stored procedure 9: How Many Registration Per ClassType Between Dates

CREATE PROCEDURE spHowManyOrdersPerCustomerBetweenDates
@JohnDate DATETIME,
@EndDate DATETIME
as
begin
select classtype.className, COUNT(RegistrarionToClasses.id) as 'count'
from ClassesSchedule JOIN RegistrarionToClasses on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	where classesschedule.classdate between @JohnDate and @EndDate
	GROUP BY classtype.className
end
GO
exec spHowManyOrdersPerCustomerBetweenDates '2022-02-01','2022-02-07'

-- stored procedure 10: Total revenue per day

CREATE Proc spTotalRevenuePerDay
@Date DATETIME
as
Begin
   SELECT  sum(ClassType.price) as Sum
	FROM Customers JOIN RegistrarionToClasses ON Customers.id = RegistrarionToClasses.customerId
	JOIN ClassesSchedule on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	where classesschedule.classdate = @Date
	
end
 go

  exec spTotalRevenuePerDay '2022-02-01'

-- view 1 All Cities Customers

DROP VIEW IF EXISTS vAllCitiesCustomers

CREATE VIEW vAllCitiesCustomers AS
	SELECT customeraddress,customerName FROM Customers;

SELECT * FROM vAllCitiesCustomers
where customeraddress like 'b%'
  ORDER BY customeraddress,customerName

-- view 2: Revenues Per Customer

DROP VIEW IF EXISTS vRevenuesPerCustomernues

CREATE VIEW vRevenuesPerCustomernues AS
 
    SELECT Customers.customerName, sum(ClassType.price) as sum
	FROM Customers JOIN RegistrarionToClasses ON Customers.id = RegistrarionToClasses.customerId
	JOIN ClassesSchedule on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	group by Customers.customerName

	go

	select * from vRevenuesPerCustomernues
	where sum>200


-- view 3: Lesson Detail

DROP VIEW IF EXISTS vLessonDetail

CREATE VIEW vLessonDetail as
	 SELECT customers.customerName, trainers.TrainerName,ClassType.ClassName, ClassType.price,ClassesSchedule.ClassDate, ClassesSchedule.HourClass, classesschedule.classno 
	FROM trainers JOIN classesschedule ON trainers.id = classesschedule.TrainerId
	JOIN RegistrarionToClasses on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	join customers on Customers.id = RegistrarionToClasses.customerId
	
    select * from  vLessonDetail

-- view 4: Trainer Lesson's Sum 

DROP VIEW IF EXISTS vTrainerLessonSum

CREATE VIEW vTrainerLessonSum as

	SELECT trainers.TrainerName , count(*) as count
	FROM trainers JOIN classesschedule ON trainers.id = classesschedule.TrainerId
	JOIN RegistrarionToClasses on  ClassesSchedule.id=RegistrarionToClasses.ClassesScheduleId
	join ClassType on ClassType.id=ClassesSchedule.ClassTypeId
	group by trainers.TrainerName 
	
	select * from vTrainerLessonSum
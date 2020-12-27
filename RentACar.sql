create database RentACar

use RentACar


CREATE TABLE Vehicles (
    Id int IDENTITY(1,1) PRIMARY KEY,
	Brand nvarchar(100) NOT NULL,
	Model nvarchar(100) NOT NULL,
	Colour nvarchar(100) NOT NULL,
	VehicleTypeName nvarchar(100) NOT NULL,
    SummerPricePerHafDay decimal(7,2) NOT NULL,
    WinterPricePerHafDay decimal(7,2) NOT NULL,
	Mileage int
);

CREATE TABLE Registrations (
    Id int IDENTITY(1,1) PRIMARY KEY,
	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
	StartOfRegistration datetime2 NOT NULL,
	EndOfRegistration datetime2 NOT NULL,
);

CREATE TABLE Employees (
    Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
);



CREATE TABLE VehicleRents(
	Id int IDENTITY(1,1) PRIMARY KEY,
	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id),
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id),
	RentStartDate datetime2 NOT NULL,
	RentEndDate datetime2 NOT NULL,
	RentStartFullDay int CHECK(RentStartFullDay BETWEEN 0 AND 1),
	RentEndFullDay int CHECK(RentEndFullDay BETWEEN 0 AND 1),
	PurchaserFirstName nvarchar(100) NOT NULL,
	PurchaserLastName nvarchar(100) NOT NULL,
	PurchaserOIB nvarchar(100) NOT NULL,
	PurchaserBirthDate datetime2,
	PurchaserDrivingLicenceNumber nvarchar(100) NOT NULL,
	PurchaserCreditCardNumber nvarchar(100) NOT NULL,
);

insert into  Employees(FirstName, LastName) VALUES
('Petra','Ivić'),
('Dominik','Krupić'),
('Marija','Dobrić'),
('Luka','Marić'),
('Ivna','Baković'),
('Luka','Tomić')



insert into Vehicles(Brand,Model, Colour,VehicleTypeName,SummerPricePerHafDay,WinterPricePerHafDay,Mileage) VALUES
('BMW','6','Black','luxury car', 600.00, 550.00,NULL),
('BMW','6','White','luxury car', 600.00, 550.00,NULL),
('BMW','6','Metallic','luxury car', 600.00, 550.00,NULL),
('Audi','8','Black','luxury car', 600.00, 550.00,NULL),
('Audi','8','White','luxury car', 600.00, 550.00,NULL),
('Audi','8','Metallic','luxury car', 600.00, 550.00,NULL),
('Golf','3','Black','standard car', 400.00, 350.00,NULL),
('Golf','3','White','standard car', 400.00, 350.00,NULL),
('Golf','4','Metallic','standard car', 400.00, 350.00,NULL),
('Toyota','Hiace','Black','van', 550.00, 500.00,NULL),
('Toyota','Hiace','White','van', 550.00, 500.00,NULL),
('Toyota','Sienna','Metallic','van', 550.00, 500.00,NULL),
('Ford','Oyo','Black','scooter', 200.00, 150.00,NULL),
('Peugeot','e-Vivacity','White','scooter', 200.00, 150.00,NULL),
('Toyota','i-Road','Metallic','scooter', 200.00, 150.00,NULL),
('Kawasaki','Versys','Black','motor>500', 350.00, 300.00,NULL),
('Honda','Crosstouer','White','motor>500', 350.00, 300.00,NULL),
('Yamaha','FZ6','Metallic','motor>500', 350.00, 300.00,NULL),
('Piaggio','Beverly','Black','motor<500', 250.00, 200.00,NULL),
('Piaggio','Typhoon','White','motor<500', 250.00, 200.00,NULL),
('Malaguti','Madison','Metallic','motor<500', 250.00, 200.00,NULL)


insert into VehicleRents(VehicleId,EmployeeId,RentStartDate,RentEndDate,RentStartFullDay,RentEndFullDay, 
PurchaserFirstName,PurchaserLastName,PurchaserOIB, PurchaserDrivingLicenceNumber,PurchaserCreditCardNumber) VALUES
(1,1,'2020-01-01','2020-05-02',0,0,'Dora','Dorić','0123','2345','2367'),
(1,1,'2020-09-15','2020-10-15',0,0,'Dora','Dorić','0123','2345','2367'),
(1,1,'2020-03-05','2020-03-20',0,0,'Dora','Dorić','0123','2345','2367'),
(3,1,'2020-03-05','2020-10-15',0,0,'Dora','Dorić','0123','2345','2367'),
(2,1,'2019-06-08','2019-06-08',0,0,'Dora','Dorić','0123','2345','2367'),
(1,1,'2020-02-01','2020-02-05',0,0,'Dora','Dorić','0123','2345','2367'),
(1,1,'2018-01-01','2018-02-05',0,0,'Dora','Dorić','0123','2345','2367'),
(1,1,'2019-12-01','2019-12-05',0,0,'Dora','Dorić','0123','2345','2367'),
(1,2,'2020-12-01','2020-12-05',1,0,'Dora','Dorić','0123','2345','2367'),
(3,1,'2018-12-01','2018-12-05',0,0,'Marino','Marić','123','12345','12367'),
(4,2,'2019-12-01','2019-12-05',0,0,'Ivano','Ivanić','4123','42345','24367'),
(5,3,'2020-08-01','2020-12-05',1,0,'Dominik','Dominiković','6123','62345','62367'),
(6,4,'2019-12-08','2019-12-13',0,1,'Dora','Plazibat','70123','72345','72367'),
(8,1,'2018-06-01','2018-12-05',0,0,'Dora','Dorić','0123','2345','2367'),
(9,1,'2019-12-01','2019-12-05',0,0,'Dora','Dorić','0123','2345','2367'),
(10,2,'2020-02-01','2020-12-05',1,0,'Dora','Dorić','0123','2345','2367'),
(11,1,'2019-12-08','2019-12-13',0,1,'Dora','Dorić','0123','2345','2367'),
(12,1,'2018-12-01','2018-12-05',0,0,'Marino','Marić','123','12345','12367'),
(13,2,'2019-12-01','2019-12-05',0,0,'Ivano','Ivanić','4123','42345','24367'),
(5,3,'2020-07-27','2021-01-05',1,0,'Dominik','Dominiković','6123','62345','62367'),
(6,4,'2020-08-25','2021-01-01',0,1,'Dora','Plazibat','70123','72345','72367'),
(18,5,'2019-11-01','2019-12-05',0,0,'Petra','Petrić','54123','542345','524367'),
(19,5,'2020-12-30','2021-01-05',1,0,'Nora','Norić','16123','162345','162367'),
(10,4,'2020-11-25','2020-12-30',0,1,'Stipe','Stipić','470123','472345','472367')

INSERT INTO Registrations (VehicleId,StartOfRegistration,EndOfRegistration) VALUES
(1,'2020-06-15','2020-11-30'),
(2,'2018-01-01','2019-11-30'),
(3,'2020-05-06','2020-12-05'),
(4,GETDATE(),'2021-05-01'),
(5,'2020-06-15','2021-06-15'),
(6,'2020-07-01','2021-07-01'),
(7,'2020-01-01','2020-12-30'),
(8,'2020-04-12','2020-12-30'),
(9,'2020-02-19','2021-02-19'),
(10,'2020-07-01','2021-07-01'),
(11,'2020-01-01','2020-12-30'),
(12,'2020-04-12','2020-12-30'),
(13,'2020-02-19','2021-02-19'),
(14, GETDATE(),'2021-04-02'),
(15,'2020-10-12','2021-04-02'),
(16,'2020-01-01','2021-06-15'),
(17,'2020-01-01','2020-06-15'),
(18,'2020-01-01','2020-06-15'),
(19,'2020-06-15','2021-06-15'),
(20,'2019-06-15','2020-12-15'),
(21,'2020-04-11','2021-04-11')

--Dohvatiti sva vozila kojima je istekla registracija

select * from Vehicles v
JOIN Registrations r on v.Id = r.VehicleId
WHERE r.EndOfRegistration<GETDATE()

--Dohvatiti sva vozila kojima registracija ističe unutar idućih mjesec dana

select * from Vehicles v
JOIN Registrations r on v.Id = r.VehicleId
WHERE r.EndOfRegistration<DATEADD(month, 1, GETDATE())

--Dohvatiti koliko vozila postoji po vrsti
SELECT COUNT(DISTINCT(VehicleTypeName))  FROM Vehicles

--Dohvatiti zadnjih 5 najmova koje je ostvario neki zaposlenik
select TOP (5) * from VehicleRents vr
JOIN Employees e on vr.EmployeeId=e.Id
where e.Id=1
ORDER BY vr.RentStartDate DESC

--Izračunati ukupnu cijenu najma za određeni najam
--hint: pripaziti na najmove koji imaju miješanu zimsku i ljetnu tarifu tijekom trajanja)
select vr.*,
CASE
WHEN vr.RentEndDate=vr.RentStartDate AND (MONTH(vr.RentEndDate) BETWEEN MONTH(3) AND MONTH(9)) THEN 2*v.SummerPricePerHafDay
WHEN vr.RentEndDate=vr.RentStartDate AND (MONTH(vr.RentEndDate) < MONTH(3) OR MONTH(vr.RentEndDate)>MONTH(9)) THEN 2*v.WinterPricePerHafDay
WHEN (MONTH(vr.RentStartDate) > 3 and MONTH(vr.RentStartDate)<10 and MONTH(vr.RentEndDate) >9)
THEN (DATEDIFF(DAY, vr.RentStartDate, '2020-09-30')*2-vr.RentStartFullDay)*v.SummerPricePerHafDay + (DATEDIFF(DAY, '2020-09-30', vr.RentEndDate)*2- vr.RentEndFullDay)*v.WinterPricePerHafDay
WHEN MONTH(vr.RentStartDate) >= MONTH(3) AND MONTH(vr.RentEndDate) < MONTH(10)
THEN DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2*v.SummerPricePerHafDay
WHEN (MONTH(vr.RentStartDate) < MONTH(3) AND MONTH(vr.RentEndDate) < MONTH(3)) OR 
     (MONTH(vr.RentStartDate) > MONTH(10) AND MONTH(vr.RentEndDate) > MONTH(10)) OR
	 (MONTH(vr.RentStartDate) > MONTH(10) AND MONTH(vr.RentEndDate) < MONTH(3))
THEN (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2-vr.RentStartFullDay - vr.RentEndFullDay)*v.WinterPricePerHafDay
WHEN (MONTH(vr.RentStartDate) < MONTH(3) OR MONTH(vr.RentEndDate) >= MONTH(3) OR MONTH(vr.RentEndDate) < MONTH(10))
THEN (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2-vr.RentStartFullDay)*v.WinterPricePerHafDay + (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2- vr.RentEndFullDay)*v.SummerPricePerHafDay
WHEN (MONTH(vr.RentStartDate) < MONTH(3) OR MONTH(vr.RentEndDate) > MONTH(9))
THEN (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2-vr.RentStartFullDay)*v.WinterPricePerHafDay + DATEDIFF(DAY, '2020-03-01', '2020-09-30')*2*v.SummerPricePerHafDay + (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2- vr.RentEndFullDay)*v.WinterPricePerHafDay
END AS RentPrice
from VehicleRents vr
JOIN Vehicles v ON vr.VehicleId = v.Id
WHERE vr.Id=12



--Dohvatiti sve kupce najmova ikad, s tim da se ne ponavljaju u rezultatima
SELECT DISTINCT(vr.PurchaserOIB), vr.PurchaserFirstName, vr.PurchaserLastName FROM VehicleRents vr

--Dohvatiti za svakog zaposlenika timestamp zadnjeg najma kojeg je ostvario

SELECT MIN(e.FirstName) as FirstName, MIN(e.LastName) as LastName, MAX(vr.RentStartDate) as LastRent FROM VehicleRents vr
JOIN Employees e ON e.Id = vr.EmployeeId
GROUP BY e.Id

--Dohvatiti broj vozila svake marke koji rent-a-car ima
SELECT DISTINCT(v.Brand), COUNT(v.Brand) as NumberOfVehicles FROM Vehicles v
GROUP BY v.Brand

--Arhivirati sve najmove koji su završili u novu tablicu. 
--Osim već postojećih podataka u najmu, arhivirana tablica će sadržavati i podatak koliko je taj najam koštao.

SELECT 
vr.*,
CASE
WHEN vr.RentEndDate=vr.RentStartDate AND (MONTH(vr.RentEndDate) BETWEEN MONTH(3) AND MONTH(9)) THEN 2*v.SummerPricePerHafDay
WHEN vr.RentEndDate=vr.RentStartDate AND (MONTH(vr.RentEndDate) < MONTH(3) OR MONTH(vr.RentEndDate)>MONTH(9)) THEN 2*v.WinterPricePerHafDay
WHEN (MONTH(vr.RentStartDate) > 3 and MONTH(vr.RentStartDate)<10 and MONTH(vr.RentEndDate) >9)
THEN (DATEDIFF(DAY, vr.RentStartDate, '2020-09-30')*2-vr.RentStartFullDay)*v.SummerPricePerHafDay + (DATEDIFF(DAY, '2020-09-30', vr.RentEndDate)*2- vr.RentEndFullDay)*v.WinterPricePerHafDay
WHEN MONTH(vr.RentStartDate) >= MONTH(3) AND MONTH(vr.RentEndDate) < MONTH(10)
THEN DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2*v.SummerPricePerHafDay
WHEN (MONTH(vr.RentStartDate) < MONTH(3) AND MONTH(vr.RentEndDate) < MONTH(3)) OR 
     (MONTH(vr.RentStartDate) > MONTH(10) AND MONTH(vr.RentEndDate) > MONTH(10)) OR
	 (MONTH(vr.RentStartDate) > MONTH(10) AND MONTH(vr.RentEndDate) < MONTH(3))
THEN (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2-vr.RentStartFullDay - vr.RentEndFullDay)*v.WinterPricePerHafDay
WHEN (MONTH(vr.RentStartDate) < MONTH(3) OR MONTH(vr.RentEndDate) >= MONTH(3) OR MONTH(vr.RentEndDate) < MONTH(10))
THEN (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2-vr.RentStartFullDay)*v.WinterPricePerHafDay + (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2- vr.RentEndFullDay)*v.SummerPricePerHafDay
WHEN (MONTH(vr.RentStartDate) < MONTH(3) OR MONTH(vr.RentEndDate) > MONTH(9))
THEN (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2-vr.RentStartFullDay)*v.WinterPricePerHafDay + DATEDIFF(DAY, '2020-03-01', '2020-09-30')*2*v.SummerPricePerHafDay + (DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate)*2- vr.RentEndFullDay)*v.WinterPricePerHafDay
END AS RentPrice
INTO FinishedRentVehicles
from VehicleRents vr
JOIN Vehicles v ON vr.VehicleId = v.Id
WHERE vr.RentEndDate < GETDATE();



--Pobrojati koliko je najmova bilo po mjesecu, u svakom mjesecu 2020. godine
SELECT MONTH(vr.RentStartDate) as MonthRent, COUNT(vr.Id) as NumberOfRents FROM VehicleRents vr
WHERE((SELECT YEAR(vr.RentStartDate)) = 2020)
GROUP BY MONTH((vr.RentStartDate))

--Za sva vozila određene vrste, osim informaciju o vozilu, ispisati tekstualnu informaciju 
--treba li registrirati vozilo unutar idućih mjesec dana (‘Treba registraciju’, ‘Ne treba registraciju’)
select v.*, r.EndOfRegistration, 
CASE
    WHEN EndOfRegistration < DATEADD(month, 1, GETDATE()) THEN 'Soon needs registration.'
	ELSE 'Does not need registration soon.'
END AS 'RegistrationStatus'
from Vehicles v
JOIN Registrations r on v.Id = r.VehicleId
WHERE v.VehicleTypeName='luxury car'


--Dohvatiti broj najmova po vrsti vozila čija duljina najma (razdoblje) prelazi prosječnu duljinu najma
SELECT v.VehicleTypeName, COUNT(vr.Id) AS NumberOfRents FROM Vehicles v
JOIN VehicleRents vr ON vr.VehicleId = v.Id
WHERE DATEDIFF(DAY, vr.RentStartDate,vr.RentEndDate) > 
(SELECT AVG(CAST(DATEDIFF(DAY, vr.RentStartDate, vr.RentEndDate) AS float)) FROM VehicleRents vr)
GROUP BY v.VehicleTypeName

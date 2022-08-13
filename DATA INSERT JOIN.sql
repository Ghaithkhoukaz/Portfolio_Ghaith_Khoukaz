
CREATE TABLE Leases (
LeaseID int NOT NULL ,
ContractDate datetime,
FirstPaymentDate datetime,
MonthlyPayment money,
NumOfPayments int,
VehicleID nvarchar(30),
CustomerID int,
TermsID int
);
GO

CREATE TABLE Payments(
PaymentID int identity NOT NULL,
LeaseID int,
PaymentDate datetime,
Amount money
);
GO


CREATE TABLE Customers (
CustomerID int identity NOT NULL,
FirstName nvarchar(15),
LastName nvarchar(15),
Address nvarchar(30),
City nvarchar(15),
Province nvarchar(15),
Zipcode nvarchar(8),
Phone nvarchar(10),
);

CREATE TABLE LeaseTerms (
LeaseTermID int NOT NULL,
NumOfYears int,
MaxKM int,
PremiumCharge money,
);
GO



CREATE TABLE Vehicles(
VIN	nvarchar(30) NOT NULL,
ModelID	int,
TypeID	int,
ColorID	int,
Year nvarchar(4),
Kilometers	int,
NewLease bit,
BookValue money,
AutoTransmission bit,
AC	bit,
PowerLocks	bit
);
GO

CREATE TABLE Models (
ModelID int identity NOT NULL,
Description nvarchar(15)
);
GO

CREATE TABLE Colors (
ColorID int identity NOT NULL,
Description nvarchar(15)
);
GO

CREATE TABLE Types (
TypeID int identity NOT NULL,
Description nvarchar(15)
);
GO

ALTER TABLE Leases ADD 
CONSTRAINT PK_LeaseID PRIMARY KEY (LeaseID);

ALTER TABLE Payments ADD 
CONSTRAINT PK_PaymentID PRIMARY KEY (PaymentID);

ALTER TABLE Customers ADD 
CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID);

ALTER TABLE LeaseTerms ADD 
CONSTRAINT PK_LeaseTermID PRIMARY KEY (LeaseTermID);

ALTER TABLE Models ADD 
CONSTRAINT PK_ModelID PRIMARY KEY (ModelID);

ALTER TABLE Types ADD 
CONSTRAINT PK_TypeID PRIMARY KEY (TypeID);

ALTER TABLE Colors ADD 
CONSTRAINT PK_ColorID PRIMARY KEY (ColorID);

ALTER TABLE Vehicles ADD 
CONSTRAINT PK_VIN PRIMARY KEY (VIN);

------
ALTER TABLE Vehicles ADD 
CONSTRAINT FK_ColorID FOREIGN KEY(ColorID) 
REFERENCES Colors (ColorID);

ALTER TABLE Vehicles ADD 
CONSTRAINT FK_ModelID FOREIGN KEY(ModelID) 
REFERENCES Models (ModelID);

ALTER TABLE Vehicles ADD 
CONSTRAINT FK_TypeID FOREIGN KEY(TypeID) 
REFERENCES Types (TypeID);

ALTER TABLE Leases ADD 
CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID)
REFERENCES Customers (CustomerID)

ALTER TABLE Leases ADD 
CONSTRAINT FK_VehicleID FOREIGN KEY(VehicleID) 
REFERENCES Vehicles (VIN)


ALTER TABLE Leases ADD 
CONSTRAINT FK_TermsID FOREIGN KEY (TermsID) 
REFERENCES LeaseTerms (LeaseTermID);

ALTER TABLE  Payments ADD 
CONSTRAINT FK_LeaseID FOREIGN KEY (LeaseID)
REFERENCES Leases (LeaseID);


SELECT*FROM Types
SELECT*FROM Models
SELECT*FROM Colors
SELECT*FROM Customers
SELECT*FROM LeaseTerms
SELECT*FROM Vehicles
SELECT*FROM Leases
SELECT*FROM Payments


--Insérer dans  Colors
insert into Colors (Description) values('Deep Blue');
insert into Colors (Description)  values('Racey Red');
insert into Colors (Description) values('Lemon Yellow');
insert into Colors (Description) values('Lime Green');
insert into Colors (Description) values ('Silver Grey')
--Insérer dans  Models

insert into Models (Description) values ('SC-430');
insert into Models (Description) values ('Pirate');
insert into Models (Description) values ('Expensive');
insert into Models (Description) values ('Rock');
insert into Models (Description) values ('Speedy');

--Insérer dans  Types
insert into Types (Description) values ('2dr Coupe');
insert into Types (Description) values ('4dr Sedan');
insert into Types (Description) values ('Truck');
insert into Types (Description) values ('SUV');
insert into Types (Description) values ('Van');

--Insérer dans LeaseTerms
insert into LeaseTerms values ( 1001, 3, 120000, 0.25);

insert into LeaseTerms values (1002, 1, 85000, 0.2);

insert into LeaseTerms values (1003, 2, 150000, 0.2);

insert into LeaseTerms values (1004, 4, 130000, 0.15);

insert into LeaseTerms values (1005, 1, 150000, 0.35);

insert into LeaseTerms values (1006, 1, 100000, 0.25);


--Insérer dans  Customers
insert into Customers (FirstName,LastName,Address,City,Province,Zipcode,Phone)
values ('Candie','Wrapper','1000 Lollopop Lane','Halifax','NS','B1X1X1','9021234567');

insert into Customers (FirstName,LastName,Address,City,Province,Zipcode,Phone)
values ('Scali','Wag','80 Plank Walk','Halifax','NS','B2L1L1','9028124567');

insert into Customers (FirstName,LastName,Address,City,Province,Zipcode,Phone)
values ('Inna','Chambers','2 Politician Street','Halifax','NS','B3M1M1','9023414212');


--Insérer dans  Vehicles
insert into Vehicles values ('3W9T1-2Q10D-12D0P-2E1R2',
(select ModelID from Models where Description = 'SC-430'), 
(select TypeID from Types where Description = '2dr Coupe'), 
(select ColorID from Colors where Description = 'Deep Blue'),
'2003',0, 0, 90000, 1,1,1);


insert into Vehicles values ('7D901-9W120-Z0029-021P2',
(select ModelID from Models where Description = 'Pirate'), 
(select TypeID from Types where Description = '2dr Coupe'), 
(select ColorID from Colors where Description = 'Racey Red'),
'2000', 100000, 1, 45000, 0,1,1);

insert into Vehicles values ('Z1221-X129A-KO212-9021J',
(select ModelID from Models where Description = 'Expensive'), 
(select TypeID from Types where Description = '4dr Sedan'), 
(select ColorID from Colors where Description = 'Lemon Yellow'),
'2003', 0, 0, 70000, 1,1,0);

insert into Vehicles values ('M21L1-3129S-V1292-L12X1',
(select ModelID from Models where Description = 'Rock'), 
(select TypeID from Types where Description = 'Truck'), 
(select ColorID from Colors where Description = 'Silver Grey'),
'2001', 0, 0, 85000, 0,1,1);

insert into Vehicles values ('M21L1-3129S-V1292-L12X2',
(select ModelID from Models where Description = 'Rock'), 
(select TypeID from Types where Description = 'Truck'), 
(select ColorID from Colors where Description = 'Silver Grey'),
'2001', 127000, 1, 45000, 0,1,1);

insert into Vehicles values ('K219M-K129P-V12BP-210G4',
(select ModelID from Models where Description = 'Speedy'), 
(select TypeID from Types where Description = '2dr Coupe'), 
(select ColorID from Colors where Description = 'Silver Grey'),
'2003', 0, 0, 60000, 0,1,1);


--Insérer dans  Leases
insert into Leases (LeaseID, ContractDate,FirstPaymentDate,MonthlyPayment,NumOfPayments,VehicleID,CustomerID,TermsID)
values (2001, '2004-01-15','2004-02-15',650,36,
(select VIN from Vehicles where VIN = '3W9T1-2Q10D-12D0P-2E1R2'), 
(select CustomerID from Customers where FirstName='Candie' and LastName = 'Wrapper'), 1001);

insert into Leases (LeaseID,ContractDate,FirstPaymentDate,MonthlyPayment,NumOfPayments,VehicleID,CustomerID,TermsID)
values (2002,'2004-03-16','2004-04-16',350,12, 
(select VIN from Vehicles where VIN = '7D901-9W120-Z0029-021P2'), 
(select CustomerID from Customers where FirstName='Scali' and LastName = 'Wag'), 1002);

insert into Leases (LeaseID, ContractDate,FirstPaymentDate,MonthlyPayment,NumOfPayments,VehicleID,CustomerID,TermsID)
values (2003,'2004-04-01','2004-05-01',600,24,
(select VIN from Vehicles where VIN = 'Z1221-X129A-KO212-9021J'), 
(select CustomerID from Customers where FirstName='Inna' and LastName = 'Chambers'), 1003);

insert into Leases (LeaseID, ContractDate,FirstPaymentDate,MonthlyPayment,NumOfPayments,VehicleID,CustomerID,TermsID)
values (2004, '2002-02-20','2002-03-01',450,48,
(select VIN from Vehicles where VIN = 'M21L1-3129S-V1292-L12X1'), 
(select CustomerID from Customers where FirstName='Candie' and LastName = 'Wrapper'), 1004);

insert into Leases (LeaseID, ContractDate,FirstPaymentDate,MonthlyPayment,NumOfPayments,VehicleID,CustomerID,TermsID)
values (2005, '2004-07-01','2004-07-15',300,12,
(select VIN from Vehicles where VIN = 'M21L1-3129S-V1292-L12X2'), 
(select CustomerID from Customers where FirstName='Inna' and LastName = 'Chambers'), 1005);

insert into Leases (LeaseID, ContractDate,FirstPaymentDate,MonthlyPayment,NumOfPayments,VehicleID,CustomerID,TermsID)
values (2006, '2006-07-01','2006-07-15',300,12,
(select VIN from Vehicles where VIN = 'M21L1-3129S-V1292-L12X2'), 
(select CustomerID from Customers where FirstName='Inna' and LastName = 'Chambers'), 1006);


--Insérer dans  Payments
insert into Payments (LeaseID, Amount, PaymentDate) values (2001,650,'2004-02-15');
insert into Payments (LeaseID, Amount, PaymentDate) values (2002,350,'2004-04-16');
insert into Payments (LeaseID, Amount, PaymentDate) values (2003,600,'2004-05-01');
insert into Payments (LeaseID, Amount, PaymentDate) values (2004,450,'2002-03-01');
insert into Payments (LeaseID, Amount, PaymentDate) values (2005,300,'2004-07-15');
insert into Payments (LeaseID, Amount, PaymentDate) values (2001,300,'2006-07-15');



CREATE VIEW INFO_VEHICLES 
AS SELECT V.VIN, V.TypeID,V.ColorID,V.Year,V.Kilometers,V.NewLease ,V.BookValue ,V.AutoTransmission ,V.AC,V.PowerLocks,M.ModelID,M.Description
FROM Vehicles V JOIN Models M
ON M.ModelID = V.ModelID 

SELECT*FROM Customers C JOIN Leases L 
ON C.CustomerID = L.CustomerID
WHERE NumOfPayments = 24

SELECT DISTINCT C.ColorID ,C.Description 
FROM Vehicles V 
JOIN Colors C ON V.ColorID = C.ColorID 
JOIN Types T ON V.TypeID = T.TypeID
WHERE T.Description = 'Truck'


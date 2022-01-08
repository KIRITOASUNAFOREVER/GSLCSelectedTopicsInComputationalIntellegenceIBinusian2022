CREATE DATABASE FishingMania
GO
USE FishingMania
GO

CREATE TABLE [MsCustomer] (
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
	CustomerEmail VARCHAR(50) NOT NULL,
	CustomerDOB DATE NOT NULL
);

INSERT INTO MsCustomer VALUES 
('CU001', 'Dirk Titterell', 'Male', '74 Melvin Point', 'dtitterell0@yellowpages.com', '2020-10-29'),
('CU002', 'Dukey Diano', 'Male', '92 Sugar Alley', 'ddiano1@state.com', '2020-09-27'),
('CU003', 'Alex Meekins', 'Male', '577 Dovetail Park', 'ameekins2@blogs.com', '2020-11-06'),
('CU004', 'Cherice Jermey', 'Female', '811 Debs Street', 'cjermey3@guardian.com', '2021-05-18'),
('CU005', 'Ingamar Carlin', 'Male', '389 Surrey Pass', 'icarlin4@shareasale.com', '2020-08-08'),
('CU006', 'Pooh McCutcheon', 'Male', '7 Melby Trail', 'pmccutcheon5@salon.com', '2020-08-03'),
('CU007', 'Silvain Jozsa', 'Female', '19269 Maryland Hill', 'sjozsa6@omniture.com', '2020-12-30'),
('CU008', 'Javier Drewson', 'Female', '8 Moulton Point', 'jdrewson7@home.com', '2020-08-20'),
('CU009', 'Wilbur Francino', 'Female', '21840 Golden Leaf Avenue', 'wfrancino8@wunderground.com', '2020-10-06'),
('CU010', 'Sadie Snow', 'Female', '70 Eagle Crest Hill', 'ssnow9@github.com', '2021-04-25'),
('CU011', 'Sofie Carmen', 'Female', '20196 Springview Plaza', 'scarmena@gov.com', '2020-11-20'),
('CU012', 'Amy Grenkov', 'Male', '2263 Weeping Birch Center', 'agrenkovb@aol.com', '2020-06-06'),
('CU013', 'Gabriela Scarf', 'Female', '920 Bobwhite Trail', 'gscarfc@skype.com', '2021-03-12'),
('CU014', 'Westley Boram', 'Female', '47 Darwin Terrace', 'wboramd@sun.com', '2020-09-03'),
('CU015', 'Hadleigh Playfoot', 'Female', '49 6th Junction', 'hplayfoote@msu.com', '2021-04-14');

CREATE TABLE [MsFisherman] (
	FishermanID CHAR(5) PRIMARY KEY CHECK (FishermanID LIKE 'FS[0-9][0-9][0-9]'),
	FishermanName VARCHAR(50) NOT NULL,
	FishermanGender VARCHAR(10) NOT NULL,
	FishermanAddress VARCHAR(50) NOT NULL
);

INSERT INTO MsFisherman VALUES 
('FS001', 'Clem', 'Male', '0975 Forest Dale Trail'),
('FS002', 'Dene', 'Male', '2 Grayhawk Parkway'),
('FS003', 'Lethia', 'Female', '905 Goodland Lane'),
('FS004', 'Tyrone', 'Male', '51745 Bowman Hill'),
('FS005', 'Shanda', 'Male', '848 New Castle Center'),
('FS006', 'Nani', 'Male', '3455 Village Green Court'),
('FS007', 'Dorothea', 'Male', '772 Goodland Park'),
('FS008', 'Chet', 'Female', '1 Merchant Street'),
('FS009', 'Darsie', 'Female', '31718 Toban Point'),
('FS010', 'Don', 'Male', '936 Lyons Plaza'),
('FS011', 'Tabby', 'Male', '10787 School Drive'),
('FS012', 'Desmond', 'Male', '8 Lien Junction'),
('FS013', 'Robenia', 'Female', '4 Dapin Avenue'),
('FS014', 'Curr', 'Female', '2 Veith Terrace'),
('FS015', 'Rudd', 'Male', '2 Hermina Park');

CREATE TABLE [MsFishType] (
	FishTypeID CHAR(5) PRIMARY KEY CHECK (FishTypeID Like 'FT[0-9][0-9][0-9]'),
	FishTypeName VARCHAR(50) NOT NULL
);

INSERT INTO MsFishType VALUES
('FT001', 'Bass'),
('FT002', 'Grouper'),
('FT003', 'Tuna'),
('FT004', 'Marlin'),
('FT005', 'Catfish');

CREATE TABLE [MsFish] (
	FishID CHAR(5) PRIMARY KEY CHECK (FishID LIKE 'FI[0-9][0-9][0-9]'),
	FishTypeID CHAR(5) FOREIGN KEY REFERENCES MsFishType(FishTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FishName VARCHAR(50) NOT NULL,
	FishPrice FLOAT NOT NULL
);

INSERT INTO MsFish VALUES 
('FI001', 'FT005', 'Channel Catfish', 12.5),
('FI002', 'FT004', 'Blue Marlin', 20.3),
('FI003', 'FT003', 'Albacore', 10.3),
('FI004', 'FT004', 'Sailfish', 30.5),
('FI005', 'FT002', 'Red Grouper', 10.7),
('FI006', 'FT003', 'Atlantic Bonito', 20.3),
('FI007', 'FT004', 'Swordfish', 31.4),
('FI008', 'FT003', 'Bigeye Tuna', 10.2),
('FI009', 'FT004', 'White Marlin', 20.3),
('FI010', 'FT001', 'Spotted Bass', 35.3),
('FI011', 'FT003', 'Blackfin Tuna', 12.3),
('FI012', 'FT003', 'King Mackerel', 15.3),
('FI013', 'FT001', 'Striped Bass', 16.3),
('FI014', 'FT005', 'Flathead Catfish', 8.1),
('FI015', 'FT002', 'Gag Grouper', 39.4),
('FI016', 'FT005', 'Blue Catfish', 7.4);

CREATE TABLE [TransactionHeader] (
	TransactionID CHAR(5) PRIMARY KEY CHECK (TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FishermanID CHAR(5) FOREIGN KEY REFERENCES MsFisherman(FishermanID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL
);

INSERT INTO TransactionHeader (TransactionID, FishermanID, CustomerID, TransactionDate) VALUES 
('TR001', 'FS002', 'CU004', '2020-09-06'),
('TR002', 'FS013', 'CU015', '2020-06-05'),
('TR003', 'FS007', 'CU015', '2020-12-18'),
('TR004', 'FS011', 'CU015', '2020-12-15'),
('TR005', 'FS010', 'CU012', '2020-08-04'),
('TR006', 'FS005', 'CU005', '2021-02-19'),
('TR007', 'FS006', 'CU011', '2021-01-01'),
('TR008', 'FS009', 'CU013', '2021-04-28'),
('TR009', 'FS001', 'CU001', '2020-06-22'),
('TR010', 'FS012', 'CU009', '2020-06-13'),
('TR011', 'FS005', 'CU007', '2020-06-04'),
('TR012', 'FS003', 'CU001', '2020-07-28'),
('TR013', 'FS015', 'CU008', '2021-03-18'),
('TR014', 'FS006', 'CU001', '2020-08-22'),
('TR015', 'FS003', 'CU013', '2020-05-31');

CREATE TABLE [TransactionDetail] (
	TransactionID CHAR(5) FOREIGN KEY REFERENCES TransactionHeader(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FishID CHAR(5) FOREIGN KEY REFERENCES MsFish(FishID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY(TransactionID, FishID)
);

INSERT INTO TransactionDetail VALUES
('TR001', 'FI011', 9),
('TR001', 'FI015', 2),
('TR002', 'FI006', 4),
('TR002', 'FI016', 23),
('TR003', 'FI015', 27),
('TR003', 'FI007', 2),
('TR004', 'FI014', 27),
('TR004', 'FI001', 6),
('TR005', 'FI014', 21),
('TR005', 'FI003', 28),
('TR006', 'FI015', 4),
('TR006', 'FI002', 9),
('TR007', 'FI015', 26),
('TR007', 'FI004', 16),
('TR008', 'FI007', 17),
('TR008', 'FI005', 20),
('TR009', 'FI002', 17),
('TR009', 'FI005', 20),
('TR010', 'FI010', 9),
('TR010', 'FI004', 15),
('TR011', 'FI012', 14),
('TR011', 'FI014', 8),
('TR012', 'FI016', 5),
('TR012', 'FI009', 24),
('TR013', 'FI004', 3),
('TR013', 'FI005', 26),
('TR014', 'FI014', 27),
('TR014', 'FI010', 2),
('TR015', 'FI005', 26),
('TR015', 'FI002', 21);

-- Jawaban Nomor 1
CREATE VIEW [ViewFemaleCoupon] AS
SELECT MsCustomer.CustomerName, STUFF(MsCustomer.CustomerID,1,2,'#') AS [Coupon] FROM MsCustomer
WHERE MsCustomer.CustomerGender = 'Female' AND DATENAME(YEAR,MsCustomer.CustomerDOB) = '2020'

SELECT * FROM ViewFemaleCoupon

-- Jawaban Nomor 2
CREATE VIEW [ViewCustomerMembership] AS
SELECT MsCustomer.CustomerName, MsCustomer.CustomerGender, STUFF(MsCustomer.CustomerEmail, CHARINDEX('@', MsCustomer.CustomerEmail), LEN(MsCustomer.CustomerEmail)-CHARINDEX('@', MsCustomer.CustomerEmail)+1, '@fmania.com') AS [Email],
MsCustomer.CustomerAddress AS [Address] FROM MsCustomer
WHERE LEN(SUBSTRING(CustomerAddress, 1, CHARINDEX(' ', CustomerAddress) - 1)) = 2

SELECT * FROM ViewCustomerMembership

-- Jawaban Nomor 3
CREATE VIEW [ViewTuna] AS
SELECT MF.FishName, MFT.FishTypeName, ('$'+CAST((MF.FishPrice) AS VARCHAR(MAX))) AS [Price] FROM MsFishType MFT
JOIN MsFish MF ON MFT.FishTypeID = MF.FishTypeID
WHERE MFT.FishTypeName LIKE 'Tuna' AND MF.FishPrice BETWEEN 12 AND 16

SELECT * FROM ViewTuna

-- Jawaban Nomor 4
CREATE VIEW [ViewCustomerTransaction] AS
SELECT MC.CustomerName, COUNT(TH.TransactionID) AS [NumberOfTransaction] FROM MsCustomer MC
JOIN TransactionHeader TH ON MC.CustomerID = TH.CustomerID
WHERE MC.CustomerGender LIKE 'Male'
GROUP BY MC.CustomerName

SELECT * FROM ViewCustomerTransaction

-- Jawaban Nomor 5
CREATE VIEW [ViewMostExpensiveTransaction] AS
SELECT TOP(3) TH.TransactionID ,CustomerName, TH.TransactionDate, SUM(MF.FishPrice * TD.Quantity) AS [Money Spent] FROM MsCustomer MC
JOIN TransactionHeader TH ON MC.CustomerID = TH.CustomerID
JOIN TransactionDetail TD ON TH.TransactionID = TD.TransactionID
JOIN MsFish MF ON MF.FishID = TD.FishID
GROUP BY TH.TransactionID ,CustomerName, TH.TransactionDate
ORDER BY [Money Spent] DESC

SELECT * FROM ViewMostExpensiveTransaction

-- Jawaban Nomor 6
CREATE VIEW [ViewYearlyIncomePerTypeIn2020] AS
SELECT DATEPART(YEAR,TH.TransactionDate) AS [Year], MFT.FishTypeName, SUM(MF.FishPrice * TD.Quantity) AS [Income] FROM TransactionHeader TH
JOIN TransactionDetail TD ON TH.TransactionID = TD.TransactionID
JOIN MsFish MF ON MF.FishID = TD.FishID
JOIN MsFishType MFT ON MFT.FishTypeID = MF.FishTypeID
WHERE DATEPART(YEAR,TH.TransactionDate) = '2020'
GROUP BY MFT.FishTypeName, DATEPART(YEAR,TH.TransactionDate)

SELECT * FROM ViewYearlyIncomePerTypeIn2020

-- Jawaban Nomor 7
CREATE VIEW [ViewNonGrouperTransaction] AS
SELECT CustomerName, NumberOfTransactions FROM 
	(
		SELECT CustomerID , COUNT(CustomerID) AS NumberOfTransactions FROM TransactionHeader 
			WHERE TransactionID NOT IN 
			(
				SELECT TransactionID FROM TransactionDetail WHERE FishID IN 
				(
					SELECT FishID FROM MsFish WHERE FishTypeID IN 
					(
						SELECT FishTypeID FROM MsFishType WHERE FishTypeName = 'Grouper')
					)
				) GROUP BY CustomerID
			) t1, MsCustomer
WHERE MsCustomer.CustomerID = t1.CustomerID

SELECT * FROM ViewNonGrouperTransaction ORDER BY CustomerName;

-- Jawaban Nomor 8
CREATE VIEW [ViewVIPCustomer] AS
SELECT MC.CustomerName, SUM(MF.FishPrice * TD.Quantity) AS [MoneySpent]
FROM MsFish MF JOIN TransactionDetail TD ON MF.FishID = TD.FishID JOIN TransactionHeader TH ON TH.TransactionID = TD.TransactionID JOIN MsCustomer MC ON MC.CustomerID = TH.CustomerID
GROUP BY MC.CustomerName
HAVING SUM(MF.FishPrice * TD.Quantity) > (
 SELECT AVG(X.MoneySpent) AS [AverageMoneySpent]
 FROM (
  SELECT MC.CustomerID, SUM(MF.FishPrice * TD.Quantity) AS [MoneySpent]
  FROM MsFish MF JOIN TransactionDetail TD ON MF.FishID = TD.FishID JOIN TransactionHeader TH ON TH.TransactionID = TD.TransactionID JOIN MsCustomer MC ON MC.CustomerID = TH.CustomerID
  GROUP BY MC.CustomerID
 ) AS X
)

SELECT * FROM ViewVIPCustomer

-- Jawaban Nomor 9
CREATE VIEW [ViewFavoriteFishType] AS
SELECT FishTypeName, TotalTransactions FROM (SELECT FishTypeID , SUM(TransactionsPerFish) AS TotalTransactions FROM (SELECT FishID, COUNT(*) AS TransactionsPerFish 
FROM TransactionDetail GROUP BY FishID) AS t1, MsFish WHERE MsFish.FishID = t1.FishID GROUP BY FishTypeID) AS t2 , MsFishType WHERE
MsFishType.FishTypeID = t2.FishTypeID AND TotalTransactions >= (SELECT AVG(TotalTransactions) FROM (SELECT FishTypeID , SUM(TransactionsPerFish) AS TotalTransactions FROM (SELECT FishID, COUNT(*) AS TransactionsPerFish 
FROM TransactionDetail GROUP BY FishID) AS t1, MsFish WHERE MsFish.FishID = t1.FishID GROUP BY FishTypeID) AS t2) order by FishTypeName

SELECT * FROM ViewFavoriteFishType order by FishTypeName;

-- Jawaban Nomor 10
DROP VIEW ViewYearlyIncomePerTypeIn2020
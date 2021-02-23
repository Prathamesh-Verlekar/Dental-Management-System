/*
Created: 11/15/2019
Modified: 12/10/2019
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table DentistSchedule

CREATE TABLE [DentistSchedule]
(
 [DentistSchedule_ID] Int IDENTITY(1,1) NOT NULL,
 [Dentist_ID] Int NOT NULL,
 [Schedule_ID] Int NOT NULL,
 [Day] Varchar(10) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table DentistSchedule

ALTER TABLE [DentistSchedule] ADD CONSTRAINT [PK_DentistSchedule] PRIMARY KEY ([DentistSchedule_ID])
go

-- Table Dentist Type

CREATE TABLE [Dentist Type]
(
 [DentistType_ID] Int IDENTITY(1,1) NOT NULL,
 [Name] Varchar(50) NOT NULL,
 [Description] Varchar(250) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table Dentist Type

ALTER TABLE [Dentist Type] ADD CONSTRAINT [PK_Dentist Type] PRIMARY KEY ([DentistType_ID])
go

-- Table DentistLicenseDetail

CREATE TABLE [DentistLicenseDetail]
(
 [DentistLicenseDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [Dentist_ID] Int NOT NULL,
 [LicenseNumber] Varchar(20) NULL,
 [ExpireDate] Datetime NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table DentistLicenseDetail

ALTER TABLE [DentistLicenseDetail] ADD CONSTRAINT [PK_DentistLicenseDetail] PRIMARY KEY ([DentistLicenseDetail_ID])
go

-- Table Dentist

CREATE TABLE [Dentist]
(
 [Dentist_ID] Int IDENTITY(1,1) NOT NULL,
 [First_Name] Varchar(50) NOT NULL,
 [Last_Name] Varchar(50) NOT NULL,
 [Middle_Name] Varchar(50) NULL,
 [SSN] Varchar(9) NOT NULL,
 [Gender] Varchar(5) NULL,
 [PhoneNumber] Varchar(10) NOT NULL,
 [WorkExperience] Int NULL,
 [DentistType_ID] Int NOT NULL,
 [User_ID] Int NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table Dentist

ALTER TABLE [Dentist] ADD CONSTRAINT [PK_Dentist] PRIMARY KEY ([Dentist_ID])
go

-- Table Schedule

CREATE TABLE [Schedule]
(
 [Schedule_ID] Int IDENTITY(1,1) NOT NULL,
 [Start_Time] Time NULL,
 [End_Time] Time NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table Schedule

ALTER TABLE [Schedule] ADD CONSTRAINT [PK_Schedule] PRIMARY KEY ([Schedule_ID])
go

-- Table User

CREATE TABLE [User]
(
 [User_ID] Int IDENTITY(1,1) NOT NULL,
 [UserName] Varchar(20) NOT NULL,
 [Password] Nvarchar(40) NOT NULL,
 [RoleName] Varchar(10) NOT NULL,
 [Is_Active] Bit NOT NULL,
 [LastLogin_Datetime] Datetime NOT NULL
)
go

-- Add keys for table User

ALTER TABLE [User] ADD CONSTRAINT [PK_User] PRIMARY KEY ([User_ID])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [DentistSchedule] ADD CONSTRAINT [Dentist_DentistSchedule_FK] FOREIGN KEY ([Dentist_ID]) REFERENCES [Dentist] ([Dentist_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DentistSchedule] ADD CONSTRAINT [ScheduleFK] FOREIGN KEY ([Schedule_ID]) REFERENCES [Schedule] ([Schedule_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Dentist] ADD CONSTRAINT [DentistTypeFK] FOREIGN KEY ([DentistType_ID]) REFERENCES [Dentist Type] ([DentistType_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DentistLicenseDetail] ADD CONSTRAINT [DentistFK] FOREIGN KEY ([Dentist_ID]) REFERENCES [Dentist] ([Dentist_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Dentist] ADD CONSTRAINT [user_FK] FOREIGN KEY ([User_ID]) REFERENCES [User] ([User_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





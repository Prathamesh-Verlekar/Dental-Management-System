/*
Created: 11/15/2019
Modified: 12/10/2019
Model: PatientCluster
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table InsuranceCompany

CREATE TABLE [InsuranceCompany]
(
 [InsuranceCompany_ID] Int IDENTITY(1,1) NOT NULL,
 [Name] Varchar(50) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table InsuranceCompany

ALTER TABLE [InsuranceCompany] ADD CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY ([InsuranceCompany_ID])
go

-- Table Patient

CREATE TABLE [Patient]
(
 [Patient_ID] Int IDENTITY(1,1) NOT NULL,
 [First_Name] Varchar(50) NOT NULL,
 [Last_Name] Varchar(50) NOT NULL,
 [Middle_Name] Varchar(50) NULL,
 [Date_of_Birth] Datetime NOT NULL,
 [Address] Varchar(250) NOT NULL,
 [City_ID] Int NOT NULL,
 [Zip_Code] Char(5) NOT NULL,
 [Emergency_Contact_Number] Varchar(10) NOT NULL,
 [Emergency_Contact_name] Varchar(50) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDateTime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDateTime] Datetime NULL
)
go

-- Add keys for table Patient

ALTER TABLE [Patient] ADD CONSTRAINT [PK_Patient] PRIMARY KEY ([Patient_ID])
go

-- Table PatientMedicalHistory

CREATE TABLE [PatientMedicalHistory]
(
 [PatientMedicalHistory_ID] Int IDENTITY(1,1) NOT NULL,
 [Patient_ID] Int NOT NULL,
 [AllergyDetails] Varchar(250) NULL,
 [OtherDiseases] Varchar(250) NULL,
 [Medical_Report_File_Path] Varchar(200) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Date NULL
)
go

-- Add keys for table PatientMedicalHistory

ALTER TABLE [PatientMedicalHistory] ADD CONSTRAINT [PK_PatientMedicalHistory] PRIMARY KEY ([PatientMedicalHistory_ID])
go

-- Table PatientInsuranceDetails

CREATE TABLE [PatientInsuranceDetails]
(
 [InsuranceCompany_ID] Int IDENTITY(1,1) NOT NULL,
 [Patient_ID] Int NOT NULL,
 [InsuranceNumber] Varchar(20) NOT NULL,
 [Max_Coverage_Amount] Money NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table PatientInsuranceDetails

ALTER TABLE [PatientInsuranceDetails] ADD CONSTRAINT [PK_PatientInsuranceDetails] PRIMARY KEY ([InsuranceCompany_ID],[Patient_ID])
go



-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [PatientInsuranceDetails] ADD CONSTRAINT [Patient_PatientInsuranceDetail_FK] FOREIGN KEY ([Patient_ID]) REFERENCES [Patient] ([Patient_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PatientMedicalHistory] ADD CONSTRAINT [Patient_PatientMedicalHistory_FK] FOREIGN KEY ([Patient_ID]) REFERENCES [Patient] ([Patient_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PatientInsuranceDetails] ADD CONSTRAINT [InsuranceCompany_PatientInsuranceDetail_FK] FOREIGN KEY ([InsuranceCompany_ID]) REFERENCES [InsuranceCompany] ([InsuranceCompany_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go









/*
Created: 11/15/2019
Modified: 12/10/2019
Model: TreatmentCluster
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Payment

CREATE TABLE [Payment]
(
 [Invoice_Prescription_ID] Int IDENTITY(1,1) NOT NULL,
 [Invoice_ID] Int NOT NULL,
 [PatientTreatment_ID] Int NULL,
 [TreatmentFee] Money NOT NULL,
 [PaymentMode] Varchar(10) NULL,
 [PaymentBy] Varchar(20) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table Payment

ALTER TABLE [Payment] ADD CONSTRAINT [PK_Payment] PRIMARY KEY ([Invoice_Prescription_ID])
go

-- Table AppointmentDetail

CREATE TABLE [AppointmentDetail]
(
 [AppointmentDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [Patient_ID] Int NOT NULL,
 [Dentist_ID] Int NOT NULL,
 [Room_ID] Int NOT NULL,
 [Start_Time] Time NOT NULL,
 [End_Time] Time NOT NULL,
 [Appointment_Datetime] Date NOT NULL,
 [Comment] Varchar(250) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table AppointmentDetail

ALTER TABLE [AppointmentDetail] ADD CONSTRAINT [PK_AppointmentDetail] PRIMARY KEY ([AppointmentDetail_ID])
go

-- Table PatientTreatmentHistory

CREATE TABLE [PatientTreatmentHistory]
(
 [PatientTreatmentHistory_ID] Int IDENTITY(1,1) NOT NULL,
 [PatientTreatment_ID] Int NOT NULL,
 [AppointmentDetail_ID] Int NOT NULL,
 [TreatmentComment] Varchar(500) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table PatientTreatmentHistory

ALTER TABLE [PatientTreatmentHistory] ADD CONSTRAINT [PK_PatientTreatmentHistory] PRIMARY KEY ([PatientTreatmentHistory_ID])
go

-- Table PatientTreatment

CREATE TABLE [PatientTreatment]
(
 [PatientTreatment_ID] Int IDENTITY(1,1) Not NULL,
 [AppointmentDetail_ID] Int NOT NULL,
 [TreatmentComments] Varchar(500) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table PatientTreatment

ALTER TABLE [PatientTreatment] ADD CONSTRAINT [PK_PatientTreatment] PRIMARY KEY ([PatientTreatment_ID])
go

-- Table PatientClinicalData

CREATE TABLE [PatientClinicalData]
(
 [PatientClinicalData_ID] Int IDENTITY(1,1) NOT NULL,
 [PatientTreatment_ID] Int NULL,
 [Total_Tooths] Int NOT NULL,
 [Plaque] Bit NULL,
 [Strains] Varchar(50) NULL,
 [Abrasions] Bit NULL,
 [Contact_Points] Bit NULL,
 [OverHangs] Bit NULL,
 [GingivalTissues] Varchar(10) NULL,
 [Color] Varchar(10) NULL,
 [Recession] Bit NULL,
 [Pockets] Bit NULL,
 [Palate] Varchar(5) NULL,
 [Frenum] Bit NULL,
 [Tongue] Bit NULL,
 [Ridge] Bit NULL,
 [Exudate] Bit NULL,
 [AreaofFoodRetention] Bit NULL,
 [Saliva] Bit NULL,
 [Calculus] Varchar(10) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table PatientClinicalData

ALTER TABLE [PatientClinicalData] ADD CONSTRAINT [PK_PatientClinicalData] PRIMARY KEY ([PatientClinicalData_ID])
go

-- Table Invoice

CREATE TABLE [Invoice]
(
 [Invoice_ID] Int IDENTITY(1,1) Not NULL,
 [TreatmentFees] Money NOT NULL,
 [OtherCharges] Money NULL,
 [FinalAmount] Money NULL,
 [Description] Varchar(500) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table Invoice

ALTER TABLE [Invoice] ADD CONSTRAINT [PK_Invoice] PRIMARY KEY ([Invoice_ID])
go

-- Table Prescription

CREATE TABLE [Prescription]
(
 [Prescription_ID] Int IDENTITY(1,1) NOT NULL,
 [PatientTreatment_ID] Int NOT NULL,
 [DentistComments] Varchar(500) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table Prescription

ALTER TABLE [Prescription] ADD CONSTRAINT [PK_Prescription] PRIMARY KEY ([Prescription_ID])
go

-- Table PrescriptionDrugDetail

CREATE TABLE [PrescriptionDrugDetail]
(
 [PrescriptionDrugDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [DrugDetail_ID] Int NOT NULL,
 [Prescription_ID] Int NOT NULL,
 [Quantity] Smallint NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table PrescriptionDrugDetail

ALTER TABLE [PrescriptionDrugDetail] ADD CONSTRAINT [PK_PrescriptionDrugDetail] PRIMARY KEY ([PrescriptionDrugDetail_ID])
go

-- Table DrugDetail

CREATE TABLE [DrugDetail]
(
 [DrugDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [Name] Varchar(20) NOT NULL,
 [Description] Varchar(50) NOT NULL,
 [DrugType] Varchar(50) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table DrugDetail

ALTER TABLE [DrugDetail] ADD CONSTRAINT [PK_DrugDetail] PRIMARY KEY ([DrugDetail_ID])
go

-- Table XRayDetail

CREATE TABLE [XRayDetail]
(
 [XRayDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [PatientTreatment_ID] Int NOT NULL,
 [Tooth_Name] Varchar(10) NULL,
 [FilePath] Varchar(200) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table XRayDetail

ALTER TABLE [XRayDetail] ADD CONSTRAINT [PK_XRayDetail] PRIMARY KEY ([XRayDetail_ID])
go




-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Payment] ADD CONSTRAINT [Invoice_Invoice_Prescription_FK] FOREIGN KEY ([Invoice_ID]) REFERENCES [Invoice] ([Invoice_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PatientTreatment] ADD CONSTRAINT [Treatment] FOREIGN KEY ([AppointmentDetail_ID]) REFERENCES [AppointmentDetail] ([AppointmentDetail_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PatientTreatmentHistory] ADD CONSTRAINT [PatientTreatment_PatientTreatmentHistory_FK] FOREIGN KEY ([PatientTreatment_ID]) REFERENCES [PatientTreatment] ([PatientTreatment_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [XRayDetail] ADD CONSTRAINT [XRayDetail_PatientTreatment_FK] FOREIGN KEY ([PatientTreatment_ID]) REFERENCES [PatientTreatment] ([PatientTreatment_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Prescription] ADD CONSTRAINT [Prescription_PatientTreatment_FK] FOREIGN KEY ([PatientTreatment_ID]) REFERENCES [PatientTreatment] ([PatientTreatment_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PrescriptionDrugDetail] ADD CONSTRAINT [DrugDetail_PrescriptionDrugDetail] FOREIGN KEY ([DrugDetail_ID]) REFERENCES [DrugDetail] ([DrugDetail_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PrescriptionDrugDetail] ADD CONSTRAINT [Prescription_PrescriptionDrugDetail_FK] FOREIGN KEY ([Prescription_ID]) REFERENCES [Prescription] ([Prescription_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [AppointmentDetail] ADD CONSTRAINT [Patient_AppointmentDetail_FK] FOREIGN KEY ([Patient_ID]) REFERENCES [Patient] ([Patient_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





ALTER TABLE [AppointmentDetail] ADD CONSTRAINT [Dentist_AppointmentDetail_FK] FOREIGN KEY ([Dentist_ID]) REFERENCES [Dentist] ([Dentist_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PatientTreatmentHistory] ADD CONSTRAINT [AppointmentDetail_PatientTreatmentHistory_FK] FOREIGN KEY ([AppointmentDetail_ID]) REFERENCES [AppointmentDetail] ([AppointmentDetail_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PatientClinicalData] ADD CONSTRAINT [PatientClinicalData_PatientTreatment_FK] FOREIGN KEY ([PatientTreatment_ID]) REFERENCES [PatientTreatment] ([PatientTreatment_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Payment] ADD CONSTRAINT [Relationship1] FOREIGN KEY ([PatientTreatment_ID]) REFERENCES [PatientTreatment] ([PatientTreatment_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





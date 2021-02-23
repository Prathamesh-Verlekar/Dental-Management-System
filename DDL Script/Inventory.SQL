/*
Created: 11/15/2019
Modified: 12/10/2019
Model: InventoryClustor
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Location

CREATE TABLE [Location]
(
 [Location_ID] Int IDENTITY(1,1) NOT NULL,
 [Location_Name] Varchar(50) NULL,
 [Location_Address] Varchar(250) NULL,
 [City_ID] Int NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table Location

ALTER TABLE [Location] ADD CONSTRAINT [PK_Location] PRIMARY KEY ([Location_ID])
go

-- Table State

CREATE TABLE [State]
(
 [State_Code] Char(2) NOT NULL,
 [Name] Varchar(50) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table State

ALTER TABLE [State] ADD CONSTRAINT [PK_State] PRIMARY KEY ([State_Code])
go

-- Table City

CREATE TABLE [City]
(
 [City_ID] Int IDENTITY(1,1) NOT NULL,
 [Name] Varchar(50) NOT NULL,
 [State_Code] Char(2) NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table City

ALTER TABLE [City] ADD CONSTRAINT [PK_City] PRIMARY KEY ([City_ID])
go

-- Table RoomSuppliesDetail

CREATE TABLE [RoomSuppliesDetail]
(
 [RoomSuppliesDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [Room_ID] Int NOT NULL,
 [SuppliesDetail_ID] Int NOT NULL,
 [Quantity] Int NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table RoomSuppliesDetail

ALTER TABLE [RoomSuppliesDetail] ADD CONSTRAINT [PK_RoomSuppliesDetail] PRIMARY KEY ([RoomSuppliesDetail_ID])
go

-- Table RoomEquipmentDetail

CREATE TABLE [RoomEquipmentDetail]
(
 [RoomEquipmentDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [Room_ID] Int NOT NULL,
 [EquipmentDetail_ID] Int NOT NULL,
 [Quantity] Int NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table RoomEquipmentDetail

ALTER TABLE [RoomEquipmentDetail] ADD CONSTRAINT [PK_RoomEquipmentDetail] PRIMARY KEY ([RoomEquipmentDetail_ID])
go

-- Table SuppliesDetail

CREATE TABLE [SuppliesDetail]
(
 [SuppliesDetail_ID] Int NOT NULL,
 [Name] Varchar(50) NOT NULL,
 [Description] Varchar(250) NOT NULL,
 [TotalQuantity] Int NOT NULL,
 [Vendor_ID] Int NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table SuppliesDetail

ALTER TABLE [SuppliesDetail] ADD CONSTRAINT [PK_SuppliesDetail] PRIMARY KEY ([SuppliesDetail_ID])
go

-- Table Vendor

CREATE TABLE [Vendor]
(
 [Vendor_ID] Int IDENTITY(1,1) NOT NULL,
 [Name] Varchar(50) NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table Vendor

ALTER TABLE [Vendor] ADD CONSTRAINT [PK_Vendor] PRIMARY KEY ([Vendor_ID])
go

-- Table Room

CREATE TABLE [Room]
(
 [Location_ID] Int IDENTITY(1,1) NOT NULL,
 [Room_ID] Int NOT NULL,
 [Room_Name] Varchar(50) NULL,
 [Room_Number] Varchar(5) NULL,
 [Floor] Int NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL
)
go

-- Add keys for table Room

ALTER TABLE [Room] ADD CONSTRAINT [PK_Room] PRIMARY KEY ([Room_ID])
go

-- Table EquipmentDetail

CREATE TABLE [EquipmentDetail]
(
 [EquipmentDetail_ID] Int IDENTITY(1,1) NOT NULL,
 [EquipmentName] Varchar(50) NOT NULL,
 [Description] Varchar(250) NOT NULL,
 [EquipmentType] Varchar(20) NOT NULL,
 [IsPortable] Bit NOT NULL,
 [Contract_EndDate] Datetime NULL,
 [TotalQuantity] Int NOT NULL,
 [Vendor_ID] Int NOT NULL,
 [CreatedBy] Int NULL,
 [CreatedDatetime] Datetime NULL,
 [ModifiedBy] Int NULL,
 [ModifiedDatetime] Datetime NULL
)
go

-- Add keys for table EquipmentDetail

ALTER TABLE [EquipmentDetail] ADD CONSTRAINT [PK_EquipmentDetail] PRIMARY KEY ([EquipmentDetail_ID])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [City] ADD CONSTRAINT [State_City_FK] FOREIGN KEY ([State_Code]) REFERENCES [State] ([State_Code]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SuppliesDetail] ADD CONSTRAINT [Vendor_SupplieDetail_FK] FOREIGN KEY ([Vendor_ID]) REFERENCES [Vendor] ([Vendor_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [EquipmentDetail] ADD CONSTRAINT [Vendor_EquipmentDetail_FK] FOREIGN KEY ([Vendor_ID]) REFERENCES [Vendor] ([Vendor_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [RoomSuppliesDetail] ADD CONSTRAINT [SuppliesDetail_RoomSuppliesDetail_FK] FOREIGN KEY ([SuppliesDetail_ID]) REFERENCES [SuppliesDetail] ([SuppliesDetail_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [RoomEquipmentDetail] ADD CONSTRAINT [RoomEquipmentDetail_EquipmentDetail_FK] FOREIGN KEY ([EquipmentDetail_ID]) REFERENCES [EquipmentDetail] ([EquipmentDetail_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Room] ADD CONSTRAINT [Location_Room_FK] FOREIGN KEY ([Location_ID]) REFERENCES [Location] ([Location_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [RoomSuppliesDetail] ADD CONSTRAINT [Room_RoomSupplies_FK] FOREIGN KEY ([Room_ID]) REFERENCES [Room] ([Room_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [RoomEquipmentDetail] ADD CONSTRAINT [Room_RoomEquipmentDetail_FK] FOREIGN KEY ([Room_ID]) REFERENCES [Room] ([Room_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Location] ADD CONSTRAINT [City_Location_FK] FOREIGN KEY ([City_ID]) REFERENCES [City] ([City_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





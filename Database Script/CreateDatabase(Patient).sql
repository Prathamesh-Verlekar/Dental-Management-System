Create Database DentalDB1
GO
Use DentalDB1
GO  
Create Table Patient1
(
Patient_id int identity(1,1) Primary Key,
First_Name varchar(50),
Last_Name varchar(50),
Middle_Name varchar(50),
Date_Of_Birth datetime,
Address varchar(250),
City_ID int,
Zip_Code char(5),
Emergency_Contact_Number varchar(15),
Emergency_Contact_Name varchar(50),
Created_By int,
Created_Datetime datetime default(GETDATE()),
Modified_By int,
Modified_Datetime datetime default(GETDATE()),
User_ID int,
Is_Active bit default(1)
)

GO 
CREATE Procedure InsertPatient
(
@Patient_id				int,
@First_Name		varchar(50),	
@Last_Name		varchar(50),
@Middle_Name	varchar(50),
@Date_Of_Birth datetime,
@Address varchar(250),
@City_ID int,
@Zip_Code char(5),
@Emergency_Contact_Number varchar(15),
@Emergency_Contact_Name varchar(50),
@Created_By int,
@Created_Datetime datetime,
@Modified_By int,
@Modified_Datetime datetime,
@User_ID				int
)
AS
Begin
	IF(@Patient_id = -1)
		BEGIN
			INSERT INTO Patient 
			(
			First_Name
			,Last_Name
			,Middle_Name
			,Date_of_Birth
			,Address
			,City_ID
			,Zip_Code
			,Emergency_Contact_Number
			,Emergency_Contact_Name
			,CreatedBy
			,CreatedDateTime
			,ModifiedBy
			,ModifiedDateTime
			)
			values 
			(
			@First_Name
			,@Last_Name
			,@Middle_Name
			,@Date_of_Birth
			,@Address
			,@City_ID
			,@Zip_Code
			,@Emergency_Contact_Number
			,@Emergency_Contact_Name
			,@User_ID
			,@User_ID
			)

		END
		ELSE
		Begin
			UPDATE Patient SET 
			First_Name=@First_Name
			,Last_Name=@Last_Name
			,Middle_Name=@Middle_Name
			,Date_of_Birth = @Date_Of_Birth
			,Address = @Address
			,City_ID = @City_ID
			,Zip_Code = @Zip_Code
			,Emergency_Contact_Number = @Emergency_Contact_Number
			,Emergency_Contact_name = @Emergency_Contact_Name
			where Patient_id=@Patient_id



		END

END


GO

CREATE procedure getPatientData
as
Begin 

Select Patient_id,First_Name+' '+Last_Name as PatientName, Date_of_Birth, Address, City_ID, Zip_Code, Emergency_Contact_Number, Emergency_Contact_name from Patient
where Is_Active=1

END 
GO

Create procedure getPatientByPatientID
(
@Patient_ID int
)
as
Begin 

Select 
Patient_id
,First_Name
,Last_Name
,Middle_Name
,Date_of_Birth
,Address
,City_ID
,Zip_Code
,Emergency_Contact_Number
,Emergency_Contact_Name
,Coalesce(User_ID,1) as User_ID
,Is_Active
from Patient1
Where Patient_id=@Patient_ID

END 

GO

create procedure removePatient(
@Patient_ID int
)
as
Begin
	Update Patient1 set Is_Active=0 where Patient_id=@Patient_id


END
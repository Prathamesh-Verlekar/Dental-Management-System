
Create Database DentistDB
GO
Use DentistDB
GO  
Create Table Dentist
(
Dentist_id int identity(1,1) Primary Key,
First_Name varchar(50),
Last_Name varchar(50),
Middle_Name varchar(50),
SSN varchar(10),
Gender varchar(5),
Phone varchar(10),
Dentist_Type_ID int,
WorkExp int,
User_ID int,
Is_Active bit default(1),
Created_By int,
Created_Datetime Datetime default(getdate())
)

GO 
CREATE Procedure InsertDentist
(
@Dentist_id				int,
@First_Name		varchar(50),	
@Last_Name		varchar(50),
@Middle_Name	varchar(50),
@SSN			varchar(10),
@Gender			varchar(5),
@Phone			varchar(10),
@Dentist_Type_ID		int,
@WorkExp				int,
@User_ID				int
)
AS
Begin
	IF(@Dentist_id = -1)
		BEGIN
			INSERT INTO Dentist 
			(
			First_Name
			,Last_Name
			,Middle_Name
			,SSN
			,Gender
			,Phone
			,Dentist_Type_ID
			,WorkExp
			,Created_By
						
			)
			values 
			(
			@First_Name
			,@Last_Name
			,@Middle_Name
			,@SSN
			,@Gender
			,@Phone
			,@Dentist_Type_ID
			,@WorkExp
			,@User_ID
			)

		END
		ELSE
		Begin
			UPDATE Dentist  SET 
			First_Name=@First_Name
			,Last_Name=@Last_Name
			,Middle_Name=@Middle_Name
			,SSN=@SSN
			,Gender=@Gender
			,Phone=@Phone
			,Dentist_Type_ID=@Dentist_Type_ID
			,WorkExp=@WorkExp
			where Dentist_id=@Dentist_id



		END

END


GO

CREATE procedure getDentistData
as
Begin 

Select Dentist_id,First_Name+' '+Last_Name as DentistName,Gender from Dentist
where Is_Active=1

END 
GO

Create procedure getDentistByDentistID
(
@Dentist_ID int
)
as
Begin 

Select 
Dentist_id
,First_Name
,Last_Name
,Middle_Name
,SSN
,Gender
,Phone
,Dentist_Type_ID
,WorkExp
,Coalesce(User_ID,1) as User_ID
,Is_Active
,Created_By
,Created_Datetime
from Dentist
Where Dentist_id=@Dentist_ID

END 

GO

create procedure removeDentist(
@Dentist_ID int
)
as
Begin
	Update Dentist set Is_Active=0 where Dentist_id=@Dentist_id


END
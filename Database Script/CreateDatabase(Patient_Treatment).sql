Create Database DentistDB
GO
Use DentistDB
GO  
Create Table Patient_Treatment
(
int Patient_Treatment_Id(1,1) Primary Key,
Appointment_Id int Foriegn Key,
Treatment_Comment Varchar(500),
Created_By int,
Created_Datetime Datetime default(getdate())
)

GO 
CREATE Procedure InsertPatientTreatment
(
@Patient_Treatment_Id		 int,
@Appointment_Id				 int,
@Treatment_Comment  varchar(500),
)
AS
Begin
	IF(@Patient_Treatment_Id = -1)
		BEGIN
			INSERT INTO Patient_Treatment
				(
				Appointment_Id,
				Treatment_Comment
				)
				values
				(
				@Appointment_Id,
				@Treatment_Comment
				)
		END
		ELSE
		Begin
			UPDATE Patient_Treatment  SET
			Appointment_Id=@Appointment_Id,
			Treatment_Comment=@Treatment_Comment
			where Patient_Treatment_Id=@Patient_Treatment_Id
			
			

END

END


GO

CREATE procedure getPatientTreatmentData
as
Begin

Select Patient_Treatment_Id,Treatment_Comment from Patient_Treatment

END 
GO

Create procedure getPatientTreatmentByPatientTreatmentId
(
@Patient_Treatment_Id int
)
as
Begin		

select
Patient_Treatment_Id,
Appointment_Id,
Treatment_Comment
where Patient_Treatment_Id=@Patient_Treatment_Id

END 

GO

create procedure removePatientTreatment(
@Patient_Treatment_Id int
)
as
Begin
	Update Patient_Treatment where Patient_Treatment_Id=@Patient_Treatment_Id


END
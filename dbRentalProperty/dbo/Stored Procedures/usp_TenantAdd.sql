CREATE PROCEDURE [dbo].[usp_TenantAdd]

@p_chrFirstName varchar(50),
@p_chrLastName varchar(50),                                          
@p_chrDOB varchar(50),                                                
@p_chrDriverLicenseNo varchar(50),                                    
@p_chrGender varchar(10),     
@p_chrEmail varchar(50),                                             
@p_chrPhone varchar(50),                                              
@p_chrEmergencyContact varchar(50),                                                                                                                                                                                                                                                 
@p_intAge int,
@p_intPropertyId int,
@p_chrNotes varchar(2048),                                                                                                                                                                                                                                                           
@p_chrMoveInDate varchar(50),
@p_chrMoveOutDate varchar(50),
@p_chrDepositAmount money,
@p_chrDepositWithHold money,
@p_chrDepositReturned money,
@p_chrMontlyRent money,
@p_chrProratedRent money

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255), @TenantStatusId int
	
	
	IF EXISTS(SELECT TOP 1 * FROM Tenant WITH(NOLOCK) WHERE LastName = @p_chrLastName AND DriverLicenseNo = @p_chrDriverLicenseNo )

		BEGIN
			RAISERROR('This tenant already exists.', 16, 1)
			RETURN -1;

		END
  
    BEGIN TRY
			SELECT @TenantStatusId = StatusId FROM [Status] WHERE StatusName = 'Active';  

            INSERT INTO Tenant(FirstName, LastName, DOB, DriverLicenseNo, Gender, Email, Phone, EmergencyContact, Age, PropertyId, Notes, MoveInDate, MoveOutDate, StatusId, 
			                    DepositAmount, DepositReturned, DepositWithHold, CreatedDate, UpdatedDate, MonthlyRent, ProratedRent) 
			               VALUES(@p_chrFirstName, @p_chrLastName, @p_chrDOB, @p_chrDriverLicenseNo, @p_chrGender, @p_chrEmail, @p_chrPhone, @p_chrEmergencyContact, @p_intAge,
						          @p_intPropertyId, @p_chrNotes, @p_chrMoveInDate, @p_chrMoveOutDate, @TenantStatusId, @p_chrDepositAmount, @p_chrDepositWithHold, @p_chrDepositReturned, GETDATE(), GETDATE(), @p_chrMontlyRent, @p_chrProratedRent);
				  
	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR (@ErrorMessage, 10, 1);
	END CATCH
END

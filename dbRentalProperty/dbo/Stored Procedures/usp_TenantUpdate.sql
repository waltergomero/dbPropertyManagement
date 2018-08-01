CREATE PROCEDURE [dbo].[usp_TenantUpdate]

@p_intTenantId int,
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
@p_chrProratedRent money,
@p_intStatusId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255), @TenantStatusId int
	
	
	IF EXISTS(SELECT TOP 1 * FROM Tenant WITH(NOLOCK) WHERE LastName = @p_chrLastName AND DriverLicenseNo = @p_chrDriverLicenseNo AND TenantId <> @p_intTenantId)

		BEGIN
			RAISERROR('This tenant already exists.', 16, 1)
			RETURN -1;

		END
  
    BEGIN TRY
		UPDATE Tenant
				SET FirstName = @p_chrFirstName,
					LastName = @p_chrLastName,
					DOB = @p_chrDOB,
					DriverLicenseNo = @p_chrDriverLicenseNo, 
					Gender = @p_chrGender,
					Email = @p_chrEmail,
					Phone = @p_chrPhone,
					EmergencyContact = @p_chrEmergencyContact,
					Age = @p_intAge,
					PropertyId = @p_intPropertyId,
					Notes = @p_chrNotes,
					MoveInDate = @p_chrMoveInDate,
					MoveOutDate = @p_chrMoveOutDate,
					--StatusId = @p_intStatusId,
					DepositAmount = @p_chrDepositAmount,
					DepositWithhold = @p_chrDepositWithHold,
					DepositReturned = @p_chrDepositReturned,					
					MonthlyRent = @p_chrMontlyRent,
					ProratedRent = @p_chrProratedRent,
					UpdatedDate = GETDATE(),
					StatusId = @p_intStatusId
			WHERE
					TenantId = @p_intTenantId;
				  
	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR (@ErrorMessage, 10, 1);
	END CATCH
END

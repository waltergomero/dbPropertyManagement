CREATE PROCEDURE [dbo].[usp_TenantById]

@p_intTenantId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255)

    BEGIN TRY
		     SELECT TenantId, 
			        FirstName,
					LastName,
					DOB,
					DriverLicenseNo, 
					Gender,
					Email,
					Phone,
					EmergencyContact,
					Age,
					PropertyId,
					Notes,
					MoveInDate = CONVERT(VARCHAR(10), CONVERT(datetime, MoveInDate,   1), 101),
					MoveOutDate = CONVERT(VARCHAR(10), CONVERT(datetime, MoveOutDate,   1), 101),
					StatusId,
					DepositAmount,
					DepositReturned,
					DepositWithhold,
					MonthlyRent,
					ProratedRent
			FROM
					Tenant
			WHERE
					TenantId = @p_intTenantId;
				  
	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR (@ErrorMessage, 10, 1);
	END CATCH
END

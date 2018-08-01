CREATE PROCEDURE [dbo].[usp_TenantList]


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255)

    BEGIN TRY
		     SELECT t.TenantId, 
			        t.FirstName,
					t.LastName,
					t.DOB,
					t.DriverLicenseNo, 
					t.Gender,
					t.Email,
					t.Phone,
					t.EmergencyContact,
					t.Age,
					t.PropertyId,
					t.Notes,
					MoveInDate = CONVERT(VARCHAR(10), CONVERT(datetime, t.MoveInDate,   1), 101),
					MoveOutDate = CONVERT(VARCHAR(10), CONVERT(datetime, t.MoveOutDate,   1), 101),
					t.StatusId,
					t.DepositAmount,
					t.DepositReturned,
					t.DepositWithhold,
					PropertyAddress = p.[Address] + ', ' + ISNULL(p.UnitNumber + ', ','') + p.City  + ', ' + st.[StateName]  + ', ' + CAST(p.ZipCode AS varchar(10)),
					s.StatusName
			FROM
					Tenant t WITH(NOLOCK) INNER JOIN Property p WITH(NOLOCK) ON t.PropertyId = p.PropertyId
										  INNER JOIN Status s WITH(NOLOCK) ON t.StatusId = s.StatusId
										  INNER JOIN States st WITH(NOLOCK) ON p.StateId = st.StateId
										  
			ORDER BY t.LastName
				  
	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR (@ErrorMessage, 10, 1);
	END CATCH
END


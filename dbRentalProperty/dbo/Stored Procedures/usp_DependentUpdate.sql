CREATE PROCEDURE [dbo].[usp_DependentUpdate]

@p_intDependentId INT,
@p_intTenantId INT,
@p_chrFirstName VARCHAR(50),
@p_chrLastName VARCHAR(50),
@p_chrGender VARCHAR(50),
@p_intAge INT,
@p_chrPhone VARCHAR(50),
@p_chrEmail VARCHAR(50),
@p_chrNotes VARCHAR(2048)

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY  
		UPDATE Tenant_Dependent
				SET TenantId = @p_intTenantId,
					FirstName = @p_chrFirstName,
					LastName = @p_chrLastName, 
					Gender = @p_chrGender,
					Age = @p_intAge,
					Phone = @p_chrPhone,
					Email = @p_chrEmail,
					Notes = @p_chrNotes,
					UpdatedDate = GETDATE()
		WHERE 
					DependentId = @p_intDependentId;
	END TRY  
	BEGIN CATCH  
		SELECT ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH  

END

CREATE PROCEDURE [dbo].[usp_DependentAdd]

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
		INSERT INTO Tenant_Dependent(TenantId, FirstName, LastName, Gender, Age, Phone, Email, Notes, CreatedDate, UpdatedDate)
					  VALUES(@p_intTenantId, @p_chrFirstName, @p_chrLastName, @p_chrGender, @p_intAge, @p_chrPhone, @p_chrEmail, @p_chrNotes, GETDATE(), GETDATE()); 
	END TRY  
	BEGIN CATCH  
		SELECT ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH  

END


CREATE PROCEDURE usp_DependentById
@p_intDependentId INT

AS
BEGIN
	SET NOCOUNT ON;

	SELECT  
		 DependentId,
		 TenantId,
		 FirstName,
		 LastName,
		 Gender,
		 Age,
		 Phone,
		 Email,
		 Notes
	FROM Tenant_Dependent
	WHERE DependentId = @p_intDependentId
END

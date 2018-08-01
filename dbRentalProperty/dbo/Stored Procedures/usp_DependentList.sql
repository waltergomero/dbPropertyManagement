
CREATE PROCEDURE usp_DependentList
@p_intTenantId INT

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
	WHERE TenantId = @p_intTenantId
	ORDER BY LastName;
END

CREATE PROCEDURE [dbo].[usp_TenantsActive]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TenantId,
		   LastName,
		   FirstName, 
		   FullName = LastName + ', '  + FirstName 
		FROM
			Tenant
		WHERE
			StatusId = 3 -- Active status
		ORDER by FullName;

END
GO

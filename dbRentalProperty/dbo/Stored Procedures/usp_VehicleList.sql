CREATE PROCEDURE usp_VehicleList
@p_intTenantId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT VehicleId,
			TenantId,
			Make,
			Model,
			Year,
			LicensePlate,
			StateRegistration,
			Color,
			Notes  
	
	FROM Tenant_Vehicle
	WHERE TenantId = @p_intTenantId;

END

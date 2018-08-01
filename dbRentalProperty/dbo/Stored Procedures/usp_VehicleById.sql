CREATE PROCEDURE usp_VehicleById
@p_intVehicleId int
AS
BEGIN
	SET NOCOUNT ON;

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
	WHERE VehicleId = @p_intVehicleId;

END

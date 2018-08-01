CREATE PROCEDURE usp_VehicleUpdate
@p_intVehicleId INT,
@p_intTenantId INT,
@p_chrMake varchar(50),
@p_chrModel varchar(50),
@p_intYear INT,
@p_chrLicensePlate  varchar(50),
@p_chrStateRegistration  varchar(50),
@p_chrColor  varchar(50),
@p_chrNotes  varchar(2048)

AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Tenant_Vehicle
	SET TenantId = @p_intTenantId,
		Make = @p_chrMake, 
		Model = @p_chrModel, 
		Year = @p_intYear,
		LicensePlate = @p_chrLicensePlate,
		StateRegistration = @p_chrStateRegistration,
		Color = @p_chrColor, 
		Notes = @p_chrNotes,	
		UpdatedDate = GETDATE()
	WHERE VehicleId = @p_intVehicleId;

END

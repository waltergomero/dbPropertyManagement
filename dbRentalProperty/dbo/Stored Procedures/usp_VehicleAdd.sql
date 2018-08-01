CREATE PROCEDURE usp_VehicleAdd

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

	INSERT INTO Tenant_Vehicle(TenantId, Make, Model, Year, LicensePlate, StateRegistration, Color, Notes, CreatedDate, UpdatedDate)
						VALUES(@p_intTenantId, @p_chrMake, @p_chrModel, @p_intYear, @p_chrLicensePlate, @p_chrStateRegistration, @p_chrColor, @p_chrNotes, GETDATE(), GETDATE());

END

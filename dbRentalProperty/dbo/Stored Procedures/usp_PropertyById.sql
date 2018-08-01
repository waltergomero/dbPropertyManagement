CREATE PROCEDURE [dbo].[usp_PropertyById]

@p_intPropertyId int

AS
BEGIN

	SET NOCOUNT ON;
	SELECT p.PropertyId,
		   p.PropertyTypeId,
	       p.Address, 
		   p.UnitNumber,
		   p.City, 
		   p.StateId, 
		   p.ZipCode, 
		   p.StatusId, 
		   p.PurchasePrice,
		   PurchaseDate = CONVERT(VARCHAR(10), CONVERT(datetime, p.PurchaseDate,   1), 101),
		   p.SoldPrice,
		   SoldDate = CONVERT(VARCHAR(10), CONVERT(datetime, p.SoldDate,   1), 101),
		   p.Notes,
		   p.FullAddress
			FROM Property p WHERE PropertyId = @p_intPropertyId;
END

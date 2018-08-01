CREATE PROCEDURE [dbo].[usp_LeasePropertiesList]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT  
			PropertyId = PropertyId,
			PropertyAddress= FullAddress
	FROM 
			Property  WITH(NOLOCK) 
	WHERE
			StatusId IN (1, 2) --Vacant/Leased
	ORDER BY PropertyAddress
		
END

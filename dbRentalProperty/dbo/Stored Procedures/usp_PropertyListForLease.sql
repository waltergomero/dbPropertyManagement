CREATE PROCEDURE [dbo].[usp_PropertyListForLease]

AS
	SET NOCOUNT ON;
BEGIN
	 	SELECT  PropertyId,
				FullAddress
		FROM 
			Property WITH(NOLOCK)
		WHERE
			StatusId IN (1, 2) --leased or vacant
		ORDER BY FullAddress;
END

CREATE PROCEDURE [dbo].[usp_PropertyTypeList]

AS
BEGIN

	SET NOCOUNT ON;
			SELECT  PropertyTypeId,
					PropertyTypeName
			FROM PropertyType 
			ORDER BY PropertyTypeName;

END

CREATE PROCEDURE [dbo].[usp_ServiceCategoryList]

@p_intServiceCategoryId int = -1

AS
BEGIN

	SET NOCOUNT ON;

	IF @p_intServiceCategoryId >= 0
		BEGIN
			SELECT ServiceCategoryId, ServiceCategoryName
				FROM ServiceCategory 
					WHERE ServiceCategoryId  = @p_intServiceCategoryId ORDER BY ServiceCategoryName;
		END
	ELSE
		BEGIN
			SELECT ServiceCategoryId, ServiceCategoryName
				FROM ServiceCategory 
				   ORDER BY ServiceCategoryName;
		END
END

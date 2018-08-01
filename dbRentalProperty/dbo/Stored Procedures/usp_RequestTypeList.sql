CREATE PROCEDURE [dbo].[usp_RequestTypeList]

@p_intRequestTypeId int = -1

AS
BEGIN

	SET NOCOUNT ON;

	IF @p_intRequestTypeId >= 0
		BEGIN
			SELECT RequestTypeId, RequestTypeName
				FROM RequestType 
					WHERE RequestTypeId  = @p_intRequestTypeId ORDER BY RequestTypeName;
		END
	ELSE
		BEGIN
			SELECT RequestTypeId, RequestTypeName
				FROM RequestType 
					ORDER BY RequestTypeName;
		END
END



CREATE PROCEDURE [dbo].[usp_StatusList]

@p_intStatusTypeId int = -1

AS
BEGIN

	SET NOCOUNT ON;

	IF @p_intStatusTypeId >= 0
		BEGIN
			SELECT StatusId, StatusName, StatusType 
				FROM Status 
					WHERE StatusType = @p_intStatusTypeId ORDER BY StatusName;
		END
	ELSE
		BEGIN
			SELECT StatusId, StatusName, StatusType 
				FROM Status 
					 ORDER BY StatusType, StatusName;
		END
END

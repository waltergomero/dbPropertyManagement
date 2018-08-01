CREATE PROCEDURE [dbo].[usp_UrgencyList]

@p_intUrgencyId int = -1

AS
BEGIN

	SET NOCOUNT ON;

	IF @p_intUrgencyId >= 0
		BEGIN
			SELECT UrgencyId, UrgencyName
				FROM Urgency 
					WHERE UrgencyId = @p_intUrgencyId ORDER BY UrgencyName;
		END
	ELSE
		BEGIN
			SELECT UrgencyId, UrgencyName
				FROM Urgency 
					ORDER BY UrgencyName;
		END
END

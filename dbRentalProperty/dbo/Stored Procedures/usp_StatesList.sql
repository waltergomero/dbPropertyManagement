
CREATE PROCEDURE usp_StatesList 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT StateId, StateCode, StateName FROM  States WITH(NOLOCK) ORDER BY StateName;

END

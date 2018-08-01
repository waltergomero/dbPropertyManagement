CREATE PROCEDURE [dbo].[usp_YearList] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT YearId, [Year] FROM  Years WITH(NOLOCK) ORDER BY [Year] DESC;

END

CREATE PROCEDURE [dbo].[usp_MothList] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MonthId, [Month], MonthAbbr FROM  Months WITH(NOLOCK) ORDER BY MonthId ASC;

END

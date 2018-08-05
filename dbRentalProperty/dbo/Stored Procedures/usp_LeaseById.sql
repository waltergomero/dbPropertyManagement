CREATE PROCEDURE [dbo].[usp_LeaseById]
@p_intLeaseId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		LeaseId,
		PropertyId,
		TenantId,
		[Year],
		[Month],
		RentAmount,
		AmountReceived,
		DateReceived,
		PastDue,
		CurrentDue,
		BalanceDue,
		Notes
	FROM
		Lease
	WHERE LeaseId = @p_intLeaseId
END
GO

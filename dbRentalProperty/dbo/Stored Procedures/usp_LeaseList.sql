CREATE PROCEDURE [dbo].[usp_LeaseList]

@p_intYear INT,
@p_intMonth INT

AS
BEGIN

	SET NOCOUNT ON;

	SELECT  LeaseId, 
			PropertyId = a.PropertyId,
			FullAddress = b.FullAddress,
			TenantId = a.TenantId,
			TenantName = c.LastName + ', ' + c.FirstName,
			[Year],        
			[Month],       
			RentAmount,
			AmountReceived,
			DateReceived,
			PastDue,
			CurrentDue,
			BalanceDue,
			Notes = a.Notes
	FROM 
		Lease a WITH(NOLOCK) INNER JOIN Property b WITH(NOLOCK) ON a.PropertyId = b.PropertyId
							 LEFT OUTER JOIN Tenant c WITH(NOLOCK) ON a.TenantId = c.TenantId
	WHERE
		a.[Month] = @p_intMonth AND a.[Year] = @p_intYear
	ORDER BY FullAddress
		
END

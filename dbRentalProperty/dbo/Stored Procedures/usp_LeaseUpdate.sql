CREATE PROCEDURE [dbo].[usp_LeaseUpdate]

@p_intLeaseId INT,
@p_intTenantId INT,
@p_chrRentAmount DECIMAL,
@p_chrAmountRecieved DECIMAL,
@p_chrDateReceived DATETIME,
@p_chrPastDue  DECIMAL,
@p_chrCurrentDue DECIMAL,
@p_chrBalanceDue DECIMAL,
@p_chrNotes VARCHAR(2048)

AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255);

   BEGIN TRY
		  UPDATE Lease 
					SET TenantId = @p_intTenantId,
						RentAmount = @p_chrRentAmount,
						AmountReceived = @p_chrAmountRecieved,
						DateReceived = @p_chrDateReceived,
						PastDue = @p_chrPastDue,
						CurrentDue = @p_chrCurrentDue,	
						BalanceDue = @p_chrBalanceDue,	
						Notes = @p_chrNotes
		 WHERE
				LeaseId = @p_intLeaseId;
   END TRY
   
   BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR(@ErrorMessage, 16, 1)
			RETURN -1;
	END CATCH
		
END

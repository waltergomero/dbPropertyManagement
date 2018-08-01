CREATE PROCEDURE [dbo].[usp_LeaseUpdate]

@p_intLeaseId INT,
@p_intPropertyId INT,
@p_intTenantId INT,
@p_intMonth INT,
@p_intYear INT,
@p_chrRentAmount DECIMAL,
@p_chrAmountReceived DECIMAL,
@p_chrDateReceived DATETIME,
@p_chrPastDue  DECIMAL,
@p_chrCurrentDue DECIMAL,
@p_chrBalanceDue DECIMAL,
@p_chrNotes VARCHAR(2048)

AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255);

	IF EXISTS (SELECT 1 FROM Lease WHERE PropertyId = @p_intPropertyId AND TenantId = @p_intTenantId AND [Month]= @p_intMonth AND [Year] = @p_intYear AND LeaseId <> @p_intLeaseId)
		BEGIN
			RAISERROR('A lease for this property, tenant, month and year already exist.', 16, 1)
			RETURN -1;

		END
   BEGIN TRY
		  UPDATE Lease 
					SET PropertyId = @p_intPropertyId,
						TenantId = @p_intTenantId,
						[Year] = @p_intYear, 
						[Month] = @p_intMonth,
						RentAmount = @p_chrRentAmount,
						AmountReceived = @p_chrAmountReceived,
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

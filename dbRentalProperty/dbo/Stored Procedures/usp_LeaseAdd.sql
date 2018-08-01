CREATE PROCEDURE [dbo].[usp_LeaseAdd]

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

	IF EXISTS (SELECT 1 FROM Lease WHERE PropertyId = @p_intPropertyId AND TenantId = @p_intTenantId AND [Month]= @p_intMonth AND [Year] = @p_intYear)
		BEGIN
			RAISERROR('A lease for this property, tenant, month and year already exist.', 16, 1)
			RETURN -1;

		END
   BEGIN TRY
		  INSERT INTO Lease (PropertyId, TenantId, [Year], [Month], RentAmount, AmountReceived, DateReceived, PastDue, CurrentDue,	BalanceDue,	Notes)
		              VALUES(@p_intPropertyId, @p_intTenantId, @p_intYear, @p_intMonth, @p_chrRentAmount, @p_chrAmountReceived, @p_chrDateReceived, @p_chrPastDue, @p_chrCurrentDue, @p_chrBalanceDue, @p_chrNotes)
   END TRY
   
   BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR(@ErrorMessage, 16, 1)
			RETURN -1;
	END CATCH
		
END

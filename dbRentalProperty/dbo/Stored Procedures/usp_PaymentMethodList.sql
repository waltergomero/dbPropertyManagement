CREATE PROCEDURE [dbo].[usp_PaymentMethodList]

@p_intPaymentMethodId int = -1

AS
BEGIN

	SET NOCOUNT ON;

	IF @p_intPaymentMethodId >= 0
		BEGIN
			SELECT PaymentMethodId, PaymentMethodName
				FROM PaymentMethod 
					WHERE PaymentMethodId  = @p_intPaymentMethodId ORDER BY PaymentMethodName;
		END
	ELSE
		BEGIN
			SELECT PaymentMethodId, PaymentMethodName
				FROM PaymentMethod 
					ORDER BY PaymentMethodName;
		END
END

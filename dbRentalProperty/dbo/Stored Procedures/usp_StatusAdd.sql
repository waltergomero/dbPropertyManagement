

CREATE PROCEDURE [dbo].[usp_StatusAdd]

@p_chrStatusName varchar(50),
@p_intStatusType int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255)
	
	IF EXISTS(SELECT TOP 1 * FROM Status WITH(NOLOCK) WHERE StatusName = @p_chrStatusName)
		BEGIN
			RAISERROR('This status name already exists.', 16, 1)
			RETURN -1;

		END
  
    BEGIN TRY
            INSERT INTO Status(StatusName, StatusType, CreatedDate, UpdatedDate) VALUES(@p_chrStatusName, @p_intStatusType, GETDATE(), GETDATE());

	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR (@ErrorMessage, 10, 1);
	END CATCH
END

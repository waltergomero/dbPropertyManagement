CREATE PROCEDURE [dbo].[usp_PropertyAdd]

@p_intPropertyTypeId int,
@p_chrAddress varchar(50),
@p_chrUnitNumber varchar(5),                                 
@p_chrCity varchar(50),                                               
@p_intStateId int,                                              
@p_intZipCode int,
@p_chrPurchasePrice DECIMAL,  
@p_chrPurchaseDate DATE,
@p_chrNotes varchar(2048)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255), @PropertyStatusId int
	
	
	IF EXISTS(SELECT TOP 1 * FROM Property WITH(NOLOCK) 
				WHERE [Address] = @p_chrAddress AND 
					  UnitNumber = @p_chrUnitNumber AND
					  City = @p_chrCity AND
					  [StateId] = @p_intStateId AND
					  ZipCode = @p_intZipCode)

		BEGIN
			RAISERROR('This property already exists.', 16, 1)
			RETURN -1;

		END
  
    BEGIN TRY
			DECLARE @StateName VARCHAR(50), @FullAddress varchar(256);
			SELECT @PropertyStatusId = StatusId FROM [Status] WHERE StatusName = 'Vacant';  
			SELECT @StateName = StateName FROM States WHERE StateId = @p_intStateId;

			IF @p_chrUnitNumber <> ''
				BEGIN
					SET @FullAddress = @p_chrAddress + ', ' + @p_chrUnitNumber + ', ' + @p_chrCity + ', ' + @StateName + ', ' + CAST(@p_intZipCode AS VARCHAR(5));
				END
			ELSE
				BEGIN
					SET @FullAddress = @p_chrAddress + ', ' + @p_chrCity + ', ' + @StateName + ', ' + CAST(@p_intZipCode AS VARCHAR(5));
				END

            INSERT INTO Property(PropertyTypeId, [Address], UnitNumber, City, [StateId], ZipCode, StatusId, PurchasePrice, PurchaseDate, SoldPrice, SoldDate, Notes, CreatedDate, UpdatedDate, FullAddress) 
			               VALUES(@p_intPropertyTypeId, @p_chrAddress, @p_chrUnitNumber, @p_chrCity, @p_intStateId, @p_intZipCode, @PropertyStatusId, @p_chrPurchasePrice, @p_chrPurchaseDate, null, '', @p_chrNotes, GETDATE(), GETDATE(), @FullAddress);
				  
	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR(@ErrorMessage, 16, 1)
			RETURN -1;
	END CATCH
END

CREATE PROCEDURE [dbo].[usp_PropertyUpdate]

@p_intPropertyId int,
@p_intPropertyTypeId int,
@p_chrAddress varchar(50),
@p_chrUnitNumber varchar(5),                                 
@p_chrCity varchar(50),                                               
@p_intStateId int,                                              
@p_intZipCode int,
@p_chrPurchasePrice DECIMAL,  
@p_chrPurchaseDate DATE,
@p_chrSoldPrice DECIMAL,
@p_chrSoldDate DATE,
@p_chrNotes varchar(2048),
@p_intStatusId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255)
	
	IF EXISTS(SELECT TOP 1 * FROM Property WITH(NOLOCK) 
				WHERE [Address] = RTRIM(LTRIM(@p_chrAddress)) AND 
					  City = RTRIM(LTRIM(@p_chrCity)) AND
					  UnitNumber = RTRIM(LTRIM(@p_chrUnitNumber)) AND
					  [StateId] = @p_intStateId AND
					  ZipCode = @p_intZipCode AND
					  PropertyId <> @p_intPropertyId)

		BEGIN
			RAISERROR('This property already exists.', 16, 1)
			RETURN -1;

		END
  
    BEGIN TRY
			DECLARE @StateName VARCHAR(50), @FullAddress varchar(256);
			SELECT @StateName = StateName FROM States WHERE StateId = @p_intStateId;

			IF @p_chrUnitNumber <> ''
				BEGIN
					SET @FullAddress = @p_chrAddress + ', ' + @p_chrUnitNumber + ', ' + @p_chrCity + ', ' + @StateName + ', ' + CAST(@p_intZipCode AS VARCHAR(5));
				END
			ELSE
				BEGIN
					SET @FullAddress = @p_chrAddress + ', ' + @p_chrCity + ', ' + @StateName + ', ' + CAST(@p_intZipCode AS VARCHAR(5));
				END
             UPDATE   Property SET
					  PropertyTypeId = @p_intPropertyTypeId,
					  [Address] = RTRIM(LTRIM(@p_chrAddress)),
					  City = RTRIM(LTRIM( @p_chrCity)),
					  [StateId] = @p_intStateId,
					  ZipCode = @p_intZipCode,
					  PurchasePrice = @p_chrPurchasePrice,
					  PurchaseDate = @p_chrPurchaseDate,
					  SoldPrice = @p_chrSoldPrice,
					  SoldDate = @p_chrSoldDate,
					  Notes = @p_chrNotes,
					  StatusId = @p_intStatusId,
					  UpdatedDate = GETDATE(),
					  FullAddress = @FullAddress				  
			  WHERE 
					  PropertyId = @p_intPropertyId;

	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR(@ErrorMessage, 16, 1)
			RETURN -1;
	END CATCH
END

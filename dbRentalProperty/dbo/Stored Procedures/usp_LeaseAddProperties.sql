CREATE PROCEDURE [dbo].[usp_LeaseAddProperties]
@p_intYear INT,
@p_chrPropertyIds VARCHAR(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @PropertyList TABLE(PropertyId INT, Inserted varchar(10))

	INSERT INTO @PropertyList
	SELECT value, NULL  
		FROM STRING_SPLIT(@p_chrPropertyIds, ',')  
			WHERE RTRIM(value) <> '';  

	DECLARE @Id INT, @Count INT, @TenantId INT;
	SELECT @Count = COUNT(*) FROM @PropertyList;

	WHILE @Count > 0
		BEGIN
			SELECT TOP 1 @Id = PropertyId FROM @PropertyList WHERE Inserted IS NULL;
			SELECT @TenantId = ISNULL(TenantId, 0) FROM Tenant WHERE PropertyID = @Id AND StatusID = 3 -- Get TenantId from Tenant if Tenant is Active Tenant
				IF NOT EXISTS (SELECT 1 FROM Lease WHERE PropertyID = @Id AND [Year] = @p_intYear)
					BEGIN
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 1);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 2);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 3);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 4);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 5);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 6);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 7);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 8);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 9);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 10);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 11);
						INSERT INTO Lease(PropertyId, TenantId, [Year], [Month]) VALUES(@Id, @TenantId, @p_intYear, 12);

						UPDATE @PropertyList SET Inserted = 'YES' WHERE PropertyId = @Id
					END
				ELSE
					BEGIN 
						UPDATE @PropertyList SET Inserted = 'NO' WHERE PropertyId = @Id
					END
				SET @Count = @Count - 1;
		END

	DECLARE @string VARCHAR(255)

	SELECT @string = coalesce(@string + ', ', '') + CAST(PropertyId AS VARCHAR(5))
		FROM @PropertyList
		WHERE Inserted = 'NO';

	IF @string <> ''
		BEGIN
		    DECLARE @Message VARCHAR(256)
				SET @Message = 'The property IDs ' + @string + ' with the selected year ' +  CAST(@p_intYear AS VARCHAR(4)) + ' already exists.';
				RAISERROR(@Message, 16, 1)
				RETURN -1;
		END 
END
GO

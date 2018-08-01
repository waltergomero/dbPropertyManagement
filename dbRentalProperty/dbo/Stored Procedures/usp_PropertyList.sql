CREATE PROCEDURE [dbo].[usp_PropertyList]

@p_intPropertyStatusId int = -1

AS
	SET NOCOUNT ON;
BEGIN
	IF @p_intPropertyStatusId > 0
		BEGIN

			SELECT  p.PropertyId,
					p.PropertyTypeId,
				    PropertyTypeName = pt.PropertyTypeName, 
					p.[Address], 
					p.UnitNumber,										
					p.City,
					p.StateId, 
					[State] = st.StateCode, 
					p.ZipCode,
					p.PurchasePrice, 
					p.PurchaseDate, 
					p.SoldPrice,
					p.SoldDate,
					p.Notes,
					p.StatusId,
					StatusName = s.StatusName,
					p.FullAddress
			FROM Property p WITH(NOLOCK) 
				 INNER JOIN Status s WITH(NOLOCK) ON p.StatusId = s.StatusId
				 INNER JOIN PropertyType pt WITH(NOLOCK) ON p.PropertyTypeId = pt.PropertyTypeId
				 INNER JOIN States st WITH(NOLOCK) ON p.StateId = st.StateId
			WHERE p.StatusId = @p_intPropertyStatusId
			
			ORDER BY [Address];
	END
	ELSE
	 BEGIN
	 	SELECT  p.PropertyId,
					p.PropertyTypeId,
				    PropertyTypeName = pt.PropertyTypeName, 
					p.[Address], 
					p.UnitNumber,										
					p.City,
					p.StateId, 
					[State] = st.StateCode, 
					p.ZipCode,
					p.PurchasePrice, 
					p.PurchaseDate, 
					p.SoldPrice,
					p.SoldDate,
					p.Notes,
					p.StatusId,
					StatusName = s.StatusName,
					p.FullAddress
			FROM Property p WITH(NOLOCK) 
				 INNER JOIN Status s WITH(NOLOCK) ON p.StatusId = s.StatusId
				 INNER JOIN PropertyType pt WITH(NOLOCK) ON p.PropertyTypeId = pt.PropertyTypeId
				 INNER JOIN States st WITH(NOLOCK) ON p.StateId = st.StateId

				ORDER BY [Address];
	 END

END

CREATE PROCEDURE [dbo].[usp_ProfessionalServiceList]

@p_intProfessionalServiceId int = -1

AS
BEGIN

	SET NOCOUNT ON;

	IF @p_intProfessionalServiceId >= 0
		BEGIN
			SELECT ProfessionalServiceId, CompanyName
				FROM ProfessionalService 
					WHERE ProfessionalServiceId  = @p_intProfessionalServiceId ORDER BY CompanyName;
		END
	ELSE
		BEGIN
			SELECT ProfessionalServiceId, CompanyName
				FROM ProfessionalService 
					ORDER BY CompanyName;
		END
END

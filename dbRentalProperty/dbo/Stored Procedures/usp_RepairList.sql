CREATE PROCEDURE [dbo].[usp_RepairList]

@p_intPropertyId int

AS
BEGIN
		SELECT 
			RepairId = a.RepairId,    
			PropertyId = a.PropertyId,
			StatusId = a.StatusId,
			StatusName = b.StatusName,
			UrgencyId = a.UrgencyID,
			UrgencyName = c.UrgencyName,  
			RequestTypeId = a.RequestTypeId,
			RequestTypeName = d.RequestTypeName,
			ServiceCategoryId = a.ServiceCategoryId,
			ServiceCategoryName = e.ServiceCategoryName,
			ProfessionalServiceId = a.ProfessionalServiceId,
			CompanyName = f.CompanyName,
			Description = a.Description,
			RepairReportedDate = CONVERT(VARCHAR(10), CONVERT(datetime, a.RepairReportedDate,   1), 101),         
			RepairCompletedDate = CONVERT(VARCHAR(10), CONVERT(datetime, a.RepairCompletedDate,   1), 101),
			TechnicianName = a.TechnicianName,
			RepairCost = a.RepairCost,
			PaymentTypedId = a.PaymentTypeId,
			PaymentTypeName = g.PaymentMethodName,
			Notes = a.Notes                         
		FROM 
			Property_Repairs a WITH(NOLOCK) INNER JOIN Status b WITH (NOLOCK) ON a.StatusId = b.StatusId
											INNER JOIN Urgency c WITH (NOLOCK) ON a.UrgencyId = c.UrgencyId
											INNER JOIN RequestType d WITH (NOLOCK) ON a.RequestTypeId = d.RequestTypeId
											INNER JOIN ServiceCategory e WITH (NOLOCK) ON a.ServiceCategoryId = e.ServiceCategoryId
											INNER JOIN ProfessionalService f WITH (NOLOCK) ON a.ProfessionalServiceId = f.ProfessionalServiceId
											INNER JOIN PaymentMethod g WITH (NOLOCK) ON a.PaymentTypeId = g.PaymentMethodId
		WHERE a.PropertyId = @p_intPropertyId
		ORDER BY RepairCompletedDate DESC;

END

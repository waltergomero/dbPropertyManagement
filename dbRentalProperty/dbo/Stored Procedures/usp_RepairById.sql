CREATE PROCEDURE [dbo].[usp_RepairById]

@p_intRepairId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 SELECT
	RepairId,
	PropertyId,
	StatusId,
	UrgencyId,
	ServiceCategoryId,
	ProfessionalServiceId,
	Description,
	RepairReportedDate = CONVERT(VARCHAR(10), CONVERT(datetime, RepairReportedDate,   1), 101),
	RepairCompletedDate = CONVERT(VARCHAR(10), CONVERT(datetime, RepairCompletedDate,   1), 101),
	TechnicianName,
	RepairCost,
	PaymentTypeId,
	Notes,
	RequestTypeId
 FROM Property_Repairs
		WHERE
			RepairId = @p_intRepairId;

END

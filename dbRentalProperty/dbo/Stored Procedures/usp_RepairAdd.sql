CREATE PROCEDURE [dbo].[usp_RepairAdd]
   
@p_intPropertyId INT,
@p_intUrgencyId INT,
@p_intRequestTypeId INT,
@p_intServiceCategoryId INT,
@p_intProfessionalServiceId INT,
@p_chrDescription varchar(2048),
@p_chrRepairReportedDate varchar(20),
@p_chrRepairCompletedDate varchar(20),
@p_chrTechnicianName varchar(50),
@p_chrRepairCost decimal(6,2),
@p_intPaymentTypeId INT,          
@p_chrNotes varchar(2048)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255), @StatusId int
	  
    BEGIN TRY
			SELECT @StatusId = StatusID FROM Status WHERE StatusName = 'Open';

            INSERT INTO Property_Repairs(PropertyId, UrgencyId, RequestTypeId, ServiceCategoryId, ProfessionalServiceId, Description, RepairReportedDate, RepairCompletedDate, TechnicianName, RepairCost, PaymentTypeId, Notes, StatusId, CreatedDate, UpdatedDate) 
			                      VALUES(@p_intPropertyId, @p_intUrgencyId, @p_intRequestTypeId, @p_intServiceCategoryId, @p_intProfessionalServiceId, @p_chrDescription, @p_chrRepairReportedDate, @p_chrRepairCompletedDate, @p_chrTechnicianName, @p_chrRepairCost, @p_intPaymentTypeId , @p_chrNotes, @StatusId, GETDATE(), GETDATE());			  
	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR (@ErrorMessage, 10, 1);
	END CATCH
END

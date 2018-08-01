CREATE PROCEDURE [dbo].[usp_RepairUpdate]

@p_intRepairId INT, 
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
@p_chrNotes varchar(2048),
@p_intStatusId INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	DECLARE @ErrorMessage varchar(255)
	  
    BEGIN TRY

            UPDATE Property_Repairs
								SET PropertyId = @p_intPropertyId,
								UrgencyId = @p_intUrgencyId, 
								RequestTypeId = @p_intRequestTypeId,
								ServiceCategoryId = @p_intServiceCategoryId,
								ProfessionalServiceId = @p_intProfessionalServiceId,
								Description = @p_chrDescription, 
								RepairReportedDate = @p_chrRepairReportedDate, 
								RepairCompletedDate = @p_chrRepairCompletedDate,
								TechnicianName = @p_chrTechnicianName,
								RepairCost = @p_chrRepairCost,
								PaymentTypeId = @p_intPaymentTypeId,
								Notes = @p_chrNotes,
								StatusId = @p_intStatusId,
								UpdatedDate = GETDATE()
			WHERE RepairId = @p_intRepairId;		  
	END TRY

	BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		    RAISERROR (@ErrorMessage, 10, 1);
	END CATCH
END

CREATE TABLE [dbo].[Property_Repairs] (
    [RepairId]              INT            IDENTITY (1, 1) NOT NULL,
    [PropertyId]            INT            NOT NULL,
    [StatusId]              INT            NOT NULL,
    [UrgencyId]             INT            NOT NULL,
    [ServiceCategoryId]     INT            NOT NULL,
    [ProfessionalServiceId] INT            NOT NULL,
    [Description]           VARCHAR (2048) NULL,
    [RepairReportedDate]    DATE           NULL,
    [RepairCompletedDate]   DATE           NULL,
    [TechnicianName]        VARCHAR (50)   NOT NULL,
    [RepairCost]            MONEY          NULL,
    [PaymentTypeId]         INT            NULL,
    [Notes]                 VARCHAR (2048) NULL,
    [RequestTypeId]         INT            NULL,
    [CreatedDate]           DATETIME       NULL,
    [UpdatedDate]           DATETIME       NULL,
    CONSTRAINT [PK_Property_Repairs] PRIMARY KEY CLUSTERED ([RepairId] ASC)
);


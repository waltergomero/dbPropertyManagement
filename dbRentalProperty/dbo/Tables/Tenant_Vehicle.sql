CREATE TABLE [dbo].[Tenant_Vehicle] (
    [VehicleId]         INT            IDENTITY (1, 1) NOT NULL,
    [TenantId]          INT            NOT NULL,
    [Make]              VARCHAR (50)   NOT NULL,
    [Model]             VARCHAR (50)   NOT NULL,
    [Year]              INT            NOT NULL,
    [LicensePlate]      VARCHAR (50)   NOT NULL,
    [StateRegistration] VARCHAR (50)   NOT NULL,
    [Color]             VARCHAR (50)   NOT NULL,
    [Notes]             VARCHAR (2048) NULL,
    [CreatedDate]       DATETIME       NULL,
    [UpdatedDate]       DATETIME       NULL,
    CONSTRAINT [PK_Tenant_Vehicle] PRIMARY KEY CLUSTERED ([VehicleId] ASC),
    CONSTRAINT [FK_Vehicle_Tenant] FOREIGN KEY ([TenantId]) REFERENCES [dbo].[Tenant] ([TenantId])
);


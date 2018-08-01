CREATE TABLE [dbo].[Tenant_Dependent] (
    [DependentId] INT            IDENTITY (1, 1) NOT NULL,
    [TenantId]    INT            NOT NULL,
    [FirstName]   VARCHAR (50)   NOT NULL,
    [LastName]    VARCHAR (50)   NOT NULL,
    [Gender]      VARCHAR (10)   NOT NULL,
    [Age]         INT            NOT NULL,
    [Phone]       VARCHAR (50)   NULL,
    [Email]       VARCHAR (50)   NULL,
    [Notes]       VARCHAR (2048) NULL,
    [CreatedDate] DATETIME       NULL,
    [UpdatedDate] DATETIME       NULL,
    CONSTRAINT [PK_Tenant_Dependent] PRIMARY KEY CLUSTERED ([DependentId] ASC)
);


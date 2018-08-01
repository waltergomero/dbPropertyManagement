CREATE TABLE [dbo].[ProfessionalService] (
    [ProfessionalServiceId] INT            IDENTITY (1, 1) NOT NULL,
    [CompanyName]           VARCHAR (50)   NOT NULL,
    [FirstName]             VARCHAR (50)   NOT NULL,
    [LastName]              VARCHAR (50)   NOT NULL,
    [Phone]                 VARCHAR (20)   NOT NULL,
    [Email]                 VARCHAR (50)   NULL,
    [Address]               VARCHAR (50)   NULL,
    [City]                  VARCHAR (50)   NULL,
    [StateId]               INT            NULL,
    [ZipCode]               INT            NULL,
    [WorkCategory]          VARCHAR (512)  NULL,
    [Notes]                 VARCHAR (1024) NULL,
    CONSTRAINT [PK_ProfessionalService] PRIMARY KEY CLUSTERED ([ProfessionalServiceId] ASC)
);


CREATE TABLE [dbo].[PropertyType] (
    [PropertyTypeId]   INT          IDENTITY (1, 1) NOT NULL,
    [PropertyTypeName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PropertyType] PRIMARY KEY CLUSTERED ([PropertyTypeId] ASC)
);


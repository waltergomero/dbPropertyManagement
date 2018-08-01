CREATE TABLE [dbo].[RequestType] (
    [RequestTypeId]   INT          IDENTITY (1, 1) NOT NULL,
    [RequestTypeName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_RequestType] PRIMARY KEY CLUSTERED ([RequestTypeId] ASC)
);


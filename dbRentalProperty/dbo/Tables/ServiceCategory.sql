CREATE TABLE [dbo].[ServiceCategory] (
    [ServiceCategoryId]   INT           IDENTITY (1, 1) NOT NULL,
    [ServiceCategoryName] VARCHAR (150) NOT NULL,
    CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED ([ServiceCategoryId] ASC)
);


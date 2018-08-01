CREATE TABLE [dbo].[Years] (
    [YearId] INT        IDENTITY (1, 1) NOT NULL,
    [Year]   NCHAR (10) NULL,
    CONSTRAINT [PK_Year] PRIMARY KEY CLUSTERED ([YearId] ASC)
);


CREATE TABLE [dbo].[Months] (
    [MonthId]   INT          IDENTITY (1, 1) NOT NULL,
    [Month]     VARCHAR (50) NOT NULL,
    [MonthAbbr] CHAR (3)     NOT NULL,
    CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED ([MonthId] ASC)
);


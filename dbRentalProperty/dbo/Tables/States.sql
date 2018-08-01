CREATE TABLE [dbo].[States] (
    [StateId]   INT          IDENTITY (1, 1) NOT NULL,
    [StateCode] CHAR (2)     NOT NULL,
    [StateName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED ([StateId] ASC)
);


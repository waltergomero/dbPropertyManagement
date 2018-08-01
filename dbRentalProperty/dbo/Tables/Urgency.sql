CREATE TABLE [dbo].[Urgency] (
    [UrgencyId]   INT          IDENTITY (1, 1) NOT NULL,
    [UrgencyName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Urgency] PRIMARY KEY CLUSTERED ([UrgencyId] ASC)
);


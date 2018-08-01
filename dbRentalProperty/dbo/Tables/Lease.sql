CREATE TABLE [dbo].[Lease] (
    [LeaseId]        INT            IDENTITY (1, 1) NOT NULL,
    [PropertyId]     INT            NOT NULL,
    [TenantId]       INT            NOT NULL,
    [Year]           INT            NOT NULL,
    [Month]          INT            NOT NULL,
    [RentAmount]     MONEY          NOT NULL,
    [AmountReceived] MONEY          NULL,
    [DateReceived]   DATETIME       NULL,
    [PastDue]        MONEY          NULL,
    [CurrentDue]     MONEY          NULL,
    [BalanceDue]     MONEY          NULL,
    [Notes]          VARCHAR (2048) NULL,
    CONSTRAINT [PK_Lease] PRIMARY KEY CLUSTERED ([LeaseId] ASC)
);


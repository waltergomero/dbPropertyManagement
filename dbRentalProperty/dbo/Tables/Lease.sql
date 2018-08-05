CREATE TABLE [dbo].[Lease] (
	[LeaseId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[TenantId] [int] NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[RentAmount] [money] NULL,
	[AmountReceived] [money] NULL,
	[DateReceived] [datetime] NULL,
	[PastDue] [money] NULL,
	[CurrentDue] [money] NULL,
	[BalanceDue] [money] NULL,
	[Notes] [varchar](2048) NULL,
    CONSTRAINT [PK_Lease] PRIMARY KEY CLUSTERED ([LeaseId] ASC)
);


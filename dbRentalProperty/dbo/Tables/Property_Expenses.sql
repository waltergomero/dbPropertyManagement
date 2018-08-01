CREATE TABLE [dbo].[Property_Expenses] (
    [ExpenseId]         INT            IDENTITY (1, 1) NOT NULL,
    [PropertyId]        INT            NULL,
    [Year]              INT            NULL,
    [Maintenance]       MONEY          NULL,
    [Repairs]           MONEY          NULL,
    [Utilities]         MONEY          NULL,
    [CityTax]           MONEY          NULL,
    [SchoolTax]         MONEY          NULL,
    [MUDTax]            MONEY          NULL,
    [HOAFee]            MONEY          NULL,
    [GarbageCollection] MONEY          NULL,
    [Mortgage]          MONEY          NULL,
    [Insurance]         MONEY          NULL,
    [Notes]             VARCHAR (2048) NULL,
    CONSTRAINT [PK_Property_Expenses] PRIMARY KEY CLUSTERED ([ExpenseId] ASC)
);


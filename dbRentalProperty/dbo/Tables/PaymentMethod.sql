CREATE TABLE [dbo].[PaymentMethod] (
    [PaymentMethodId]   INT          IDENTITY (1, 1) NOT NULL,
    [PaymentMethodName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED ([PaymentMethodId] ASC)
);


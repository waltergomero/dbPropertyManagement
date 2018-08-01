CREATE TABLE [dbo].[ExpenseCategory] (
    [ExpenseCategoryId] INT          IDENTITY (1, 1) NOT NULL,
    [ExpenseCategory]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ExpenseCategory] PRIMARY KEY CLUSTERED ([ExpenseCategoryId] ASC)
);


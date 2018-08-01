CREATE TABLE [dbo].[Property] (
    [PropertyId]     INT            IDENTITY (1, 1) NOT NULL,
    [Address]        VARCHAR (50)   NOT NULL,
    [UnitNumber]     VARCHAR (5)    NULL,
    [PropertyTypeId] INT            NOT NULL,
    [City]           VARCHAR (50)   NOT NULL,
    [StateId]        INT            NOT NULL,
    [ZipCode]        INT            NOT NULL,
    [StatusId]       INT            NOT NULL,
    [PurchasePrice]  DECIMAL (18)   NULL,
    [PurchaseDate]   DATE           NULL,
    [SoldPrice]      DECIMAL (18)   NULL,
    [SoldDate]       DATE           NULL,
    [Notes]          VARCHAR (2048) NULL,
    [CreatedDate]    DATETIME       NULL,
    [UpdatedDate]    DATETIME       NULL,
    [FullAddress]    VARCHAR (256)  NULL,
    CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED ([PropertyId] ASC)
);


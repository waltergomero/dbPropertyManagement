﻿CREATE TABLE [dbo].[Status] (
    [StatusId]    INT          IDENTITY (1, 1) NOT NULL,
    [StatusName]  VARCHAR (50) NOT NULL,
    [StatusType]  INT          NOT NULL,
    [CreatedDate] DATETIME     NULL,
    [UpdatedDate] DATETIME     NULL,
    CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([StatusId] ASC)
);


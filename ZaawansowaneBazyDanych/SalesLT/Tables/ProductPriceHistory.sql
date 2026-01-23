CREATE TABLE [SalesLT].[ProductPriceHistory] (
    [EditID]    INT          IDENTITY (1, 1) NOT NULL,
    [ProductID] INT          NOT NULL,
    [OldPrice]  DECIMAL (18) NOT NULL,
    [NewPrice]  DECIMAL (18) NOT NULL,
    PRIMARY KEY CLUSTERED ([EditID] ASC)
);


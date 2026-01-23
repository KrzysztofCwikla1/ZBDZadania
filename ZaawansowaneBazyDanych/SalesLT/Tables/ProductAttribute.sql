CREATE TABLE [SalesLT].[ProductAttribute] (
    [ProductAttributeID] INT                                         IDENTITY (1, 1) NOT NULL,
    [ProductID]          INT                                         NOT NULL,
    [Info]               XML(CONTENT [dbo].[ProductAttributeSchema]) NULL,
    CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED ([ProductAttributeID] ASC),
    CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);


--create view SalesLT.PriceDifference as
--select
--product.ProductID,
--product.Name,
--product.ListPrice,
--info.NewPrice,
--info.NewPrice - product.ListPrice as Difference
---from SalesLT.Product product
--join openjson (@ProductInfo, '$.ProductInfo')
--with (
--	ProductID int '$.ProductID',
--	NewPrice decimal '$.NewPrice'
--	) info
--	on product.ProductID = info.ProductID;
--go
-- =============================================
-- Zadanie 2
-- =============================================
-- najlepsi klienci to tacy co generują największy przychód, czyli znajdujemy ich poprzez zliczenie wartości wszystkich kupionych przez nich produktów, 
--z SalesOrderDetail mnożąc OrderQty i UnitPrice, w tym przykładzie znajdziemy top100 (i tak pokryje to wszystkich klientów) najlepszych klientów ponieważ musimy skorzystać z top aby użyć order by
--create view [Student_728].TheBestCustomers
--as
--select top 100
--c.CustomerID,
--c.FirstName,
--c.LastName,
--sum(sod.OrderQty * sod.UnitPrice) as CustomerValue
--from [233728].Customer c
--join SalesLT.SalesOrderHeader soh on c.CustomerID = soh.CustomerID
--join SalesLT.SalesOrderDetail sod on soh.SalesOrderID = sod.SalesOrderID
--group by c.CustomerID, c.FirstName, c.LastName
--order by CustomerValue desc;
--go
-- ============================================
-- Zadanie 3 
-- =============================================
CREATE FUNCTION Student_728.ufn_ProductsJsonByCategory
(
    @CategoryName NVARCHAR(50)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Result NVARCHAR(MAX);

    SELECT @Result = (
        SELECT
            p.ProductID,
            p.Name,
            p.ListPrice,
            pc.Name AS CategoryName
        FROM SalesLT.Product p
        JOIN SalesLT.ProductCategory pc
            ON p.ProductCategoryID = pc.ProductCategoryID
        WHERE pc.Name = @CategoryName
        FOR JSON PATH
    );

    RETURN @Result;
END;
-- =============================================
-- Zadanie 2
-- =============================================
--create procedure [233728].[CustomerData]
--	@Imie Name=null,
--	@Nazwisko K8_surname=null,
--	@AdresEmail nvarchar(50)=null,
--	@CustomerID int=null
--as
--begin
--set nocount on
--select *
--from [233728].Customer
--where FirstName=@Imie or LastName=@Nazwisko or EmailAddress=@AdresEmail or CustomerID=@CustomerID
--end;
--go
--exec [233728].CustomerData
--@CustomerID=600

-- =============================================
-- Zadanie 3 
-- =============================================
--w zadaniu jest napisane samo Product, zakładam że chodzi o ProduktID, przy próbie zadeklarowania parametru jako tabelę w procedurze wywalało błędy więc zrobiłem tak, może przechodzi jako int idk

create procedure SalesLT.GetCustomerHistory
@CustomerID int
as
begin
set nocount on
declare @ProcedureTable table(
ProductID int ,
OrderDate datetime,
OrderQty smallint,
LineTotal numeric(38,6)
);
insert into @ProcedureTable (ProductID,OrderDate,OrderQty,LineTotal)
select sod.ProductID, soh.OrderDate, sod.OrderQty, sod.LineTotal
from SalesLT.SalesOrderHeader soh
inner join
SalesLT.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID
where soh.CustomerID=@CustomerID
select * from @ProcedureTable
end;
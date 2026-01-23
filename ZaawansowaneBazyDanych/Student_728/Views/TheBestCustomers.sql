-- =============================================
-- Zadanie 2
-- =============================================
-- najlepsi klienci to tacy co generuj� najwi�kszy przych�d, czyli znajdujemy ich poprzez zliczenie warto�ci wszystkich kupionych przez nich produkt�w, 
--z SalesOrderDetail mno��c OrderQty i UnitPrice, w tym przyk�adzie znajdziemy top100 (i tak pokryje to wszystkich klient�w) najlepszych klient�w poniewa� musimy skorzysta� z top aby u�y� order by
create view [Student_728].TheBestCustomers
as
select top 100
c.CustomerID,
c.FirstName,
c.LastName,
sum(sod.OrderQty * sod.UnitPrice) as CustomerValue
from [233728].Customer c
join SalesLT.SalesOrderHeader soh on c.CustomerID = soh.CustomerID
join SalesLT.SalesOrderDetail sod on soh.SalesOrderID = sod.SalesOrderID
group by c.CustomerID, c.FirstName, c.LastName
order by CustomerValue desc;
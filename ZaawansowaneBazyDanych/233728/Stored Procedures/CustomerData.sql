-- =============================================
-- Zadanie 2
-- =============================================
create procedure [233728].[CustomerData]
	@Imie Name=null,
	@Nazwisko K8_surname=null,
	@AdresEmail nvarchar(50)=null,
	@CustomerID int=null
as
begin
set nocount on
select *
from [233728].Customer
where FirstName=@Imie or LastName=@Nazwisko or EmailAddress=@AdresEmail or CustomerID=@CustomerID
end;
-- =============================================
-- Krzysztof
-- Ćwikła
-- 233728
-- https://github.com/KrzysztofCwikla1/ZBDZadania
-- =============================================
-- =============================================
-- Zadanie 1 
-- =============================================
create procedure [233728].[ClientInserter]
	@Imie Name,
	@Nazwisko K8_surname,
	@AdresEmail nvarchar(50)=null,
	@NumerTelefonu nvarchar(25)=null,
	
	@HasloHash varchar(128),
	@HasloSalt varchar (10)
as
begin
	set nocount on;

	insert into [233728].[Customer]
	(FirstName,LastName,EmailAddress,Phone,PasswordHash,PasswordSalt)
	values
	(@Imie,@Nazwisko,@AdresEmail,@NumerTelefonu,@HasloHash,@HasloSalt)
end;
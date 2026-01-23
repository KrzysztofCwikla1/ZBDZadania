-- =============================================
-- Zadanie 4 
-- =============================================
create function [233728].CheckIfUniqueCustomer
(
	@Imie Name,
	@Nazwisko K8_surname,
	@AdresEmail nvarchar(50)=null,
	@NumerTelefonu nvarchar(25)=null,
	@HasloHash varchar(128),
	@HasloSalt varchar (10)

	)
	
	returns bit

	as
	begin
		declare @IsUnique bit = 1;
	if exists(
	select * from [233728].[Customer]
	where FirstName=@Imie and
	LastName=@Nazwisko and
	EmailAddress=@AdresEmail and
	Phone=@NumerTelefonu and
	PasswordHash=@HasloHash and
	PasswordSalt=@HasloSalt)
	set @IsUnique = 0
	else 
	set @IsUnique =1
	return @IsUnique
	end;
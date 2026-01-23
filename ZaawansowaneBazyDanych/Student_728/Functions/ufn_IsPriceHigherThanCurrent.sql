create function Student_728.ufn_IsPriceHigherThanCurrent
(
    @ProductJson nvarchar(max)
)
returns bit
as
begin
   declare @ProductID int;
   declare @JsonPrice decimal;
   declare @CurrentPrice decimal;
   select
       @ProductID = ProductID,
       @JsonPrice = NewPrice
    from openjson(@ProductJson)
    with (
       ProductID int,
       NewPrice decimal
   );

   select @CurrentPrice = ListPrice
   from SalesLT.Product
  where ProductID = @ProductID;
 return case
 when @JsonPrice > @CurrentPrice then 1
     else 0
 end;
end;
--r�wna cena zwraca zero bo sprawdzamy czy jest wi�ksza, wi�ksze lub r�wne zwraca�oby 1
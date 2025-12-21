create function Student_728.ufn_CalcAdjustedPrices()
returns @Summary table
(
	ProductID int,
	ListPrice decimal,
	DiscountedPrice decimal
)
as
begin
	insert into @Summary
	select
	ProductID,ListPrice, ListPrice -(ListPrice *0.08)
	from TopProducts;
	return;
end;
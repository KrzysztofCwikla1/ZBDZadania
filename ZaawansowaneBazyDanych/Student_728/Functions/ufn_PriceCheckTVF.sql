create function Student_728.ufn_PriceCheckTVF
()
returns table
as 
return
(
	select
	p.ProductID,
	p.Name,
	p.ListPrice,
	Student_728.ufn_IsPriceHigherThanCurrent(
	concat(
	 '{ "ProductID": ', p.ProductID,
		', "NewPrice": ', 1000, ' }'
	)
	) as HigherOrLower
	from SalesLT.Product p
);
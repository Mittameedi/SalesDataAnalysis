	/* What are the top 5 brands by receipts scanned among users 21 and over? */
	Select 
		P.BRAND, 
		Count(T.RECEIPT_ID) as RECEIPT_Count  -- using count function to count no. of receipts for each brand.
	FROM 
		dbo.Transactions T
		left JOIN dbo.Products P on P.Barcode = T.Barcode  
		left JOIN dbo.USERS U on U.id = T.user_id  
		-- using left join ensures no transaction data loss even when there are no matching records in other tables.
	WHERE
		U.AGE >= 21	 -- to filter for users 21 or higher.
		and P.Brand is not null   -- to filter null values in brand.
	GROUP BY
		P.Brand
	ORDER BY 
		 Count(T.RECEIPT_ID) DESC, -- sorting calculated 'receipt_count' in descending order for highest value in 1st column.
		 P.BRAND ASC  -- There are multiple records with same count, so using brand for second sorting.

OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY; -- to show only the top 5 brands.


/* OUTPUT:
BRAND	RECEIPT_Count
DOVE	3
NERDS CANDY	3
COCA-COLA	2
GREAT VALUE	2
HERSHEY'S	2
*/
	





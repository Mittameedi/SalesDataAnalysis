/* What are the top 5 brands by sales among users that have had their account for at least six months? */

		Select 
			P.BRAND, 
			sum(round(T.Final_Sale,2)) as Total_Sales -- adding all 'final_sale' values for each brand as Total_sales.
		FROM 
			dbo.Transactions T
			left JOIN dbo.Products P on P.Barcode = T.Barcode
			left JOIN dbo.USERS U on U.id = T.user_id
			-- using left join ensures no transaction data loss even when there are no matching records in other tables.
		WHERE
			DateDiff(month, U.CREATED_DATE, GETDATE()) >= 6  -- to filter users with accounts for at least six months.
			and P.BRAND IS NOT NULL -- to filter null values in brand.
			
		GROUP BY
			P.Brand  
		ORDER BY 
			 sum(round(T.Final_Sale,2)) DESC -- sorting total sales calculated in descending order.
	OFFSET 0 ROWS   FETCH NEXT 5 ROWS ONLY;	-- to show only the top 5 brands.


/*OUTPUT:
BRAND	Total_Sales
CVS	72
DOVE	30.91
TRIDENT	23.36
COORS LIGHT	17.48
TRESEMMÉ	14.58
*/
	





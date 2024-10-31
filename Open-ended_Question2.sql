/*	Which is the leading brand in the Dips & Salsa category? */
/* Assumption: Assumping that the ask for leading brand is in terms of total sales.*/
			
			SELECT 
			  P.Brand,
			  Sum(round(T.Final_Sale,2)) as Total_Sales -- summing all sales vales for each brand as total_sales. 
			FROM 
				dbo.Products P
				left join dbo.transactions T on P.Barcode = T.Barcode
				-- using left join ensures no transaction data loss even when there are no matching records in other tables.
			WHERE 
			category_2 ='Dips & Salsa' -- to filter for 'Dips & Salsa' category.

			Group by  --group by helps to get total sales for each brand
			P.Brand

			Order by 
				Sum(T.Final_Sale) DESC  -- sorting total sales to get values from highest to lowest.
			OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY -- to show only the highest total sales brand.


/*OUTPUT:
Brand	Total_Sales
TOSTITOS	181.3			
*/
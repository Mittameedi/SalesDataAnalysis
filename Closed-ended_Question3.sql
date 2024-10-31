	/* What is the percentage of sales in the Health & Wellness category by generation? */

/* Using 'GenerationSales' CTE to assign a generation value to each user based on their age 
and calculate sales for each generation */

	WITH GenerationSales AS (
		SELECT 
			CASE 
				WHEN U.AGE >= 80 THEN 'Silent Generation (80+)'
				WHEN U.AGE >= 60 THEN 'Baby Boomers (60-79)'
				WHEN U.AGE >= 40 THEN 'Generation X (40-59)'
				WHEN U.AGE >= 25 THEN 'Millennials (25-39)'
				WHEN U.AGE >= 0  THEN 'Generation Z (below 25)'
				ELSE 'UNKNOWN'
			END AS Generation,  
			/* Using case statement for assigning appropriate generation value to user based on their age */
			SUM(ROUND(T.Final_Sale, 2)) AS Generation_Sale -- adding all sale in each generation
		FROM 
			dbo.Transactions T
			left JOIN dbo.Products P ON T.Barcode = P.Barcode
			left JOIN dbo.Users U ON T.USER_ID = U.ID
			-- using left join ensures no transaction data loss even when there are no matching records in other tables.
		WHERE 
			P.Category_1 = 'Health & Wellness' 
			-- filtering to get transactions/sales only related to 'Health & Wellness' category
		GROUP BY 
			CASE 
				WHEN U.AGE >= 80 THEN 'Silent Generation (80+)'
				WHEN U.AGE >= 60 THEN 'Baby Boomers (60-79)'
				WHEN U.AGE >= 40 THEN 'Generation X (40-59)'
				WHEN U.AGE >= 25 THEN 'Millennials (25-39)'
				WHEN U.AGE >= 0  THEN 'Generation Z (below 25)'
				ELSE 'UNKNOWN'
			END
-- using case statement in 'group by' as part of getting total sales for each generation
	)


	-- The 'TotalSales' CTE calculates sales across all generations
	, TotalSales AS (
		SELECT 
			SUM(Generation_Sale) AS TotalSales
		FROM 
			GenerationSales
	)

	SELECT 
		G.Generation,
		G.Generation_Sale,
	  round(  (G.Generation_Sale / T.TotalSales) * 100,2) AS Percentage_of_Sales
	-- Calculate percentage of sales for each generation and rounds it to 2 decimal
	FROM 
		GenerationSales G
		CROSS JOIN TotalSales T 
		-- using cross join, will combine every row in 'G' table with the every row in 'T' table ( here there is only one value in "T" table).
	ORDER BY 
		Percentage_of_Sales DESC;



/* OUTPUT:
UNKNOWN	27276.85	99.42
Baby Boomers (60-79)	84.09	0.31
Generation X (40-59)	55.24	0.2
Millennials (25-39)	20.21	0.07
*/


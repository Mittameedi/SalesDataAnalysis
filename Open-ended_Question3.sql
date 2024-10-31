/* At what percent has Fetch grown year over year? */

WITH YearlyActiveUsers AS (
    SELECT 
        YEAR(CREATED_DATE) AS Year,
        COUNT(DISTINCT ID) AS ActiveUsers
    FROM 
        dbo.USERS
    GROUP BY 
        YEAR(CREATED_DATE)
)/* In 'YearlyActiveUsers' CTE, based on account created date, users are categorised as active users for that year.
(ActiveUsers for that 2014 means the users who joined fetch in 2014)*/
SELECT 
        Year,
        ActiveUsers,
        LAG(ActiveUsers) OVER (ORDER BY Year) AS PreviousYearUsers,
		-- using lag function, creating new column for previous year users
        CASE 
            WHEN LAG(ActiveUsers) OVER (ORDER BY Year) IS NOT NULL THEN 
            (((ActiveUsers - LAG(ActiveUsers) OVER (ORDER BY Year))*100)/ LAG(ActiveUsers) OVER (ORDER BY Year))
            ELSE 
                NULL 
        END AS YoY_Percentage_Growth
	-- By combination of case statement and lag function, calculating year over year percentage growth
FROM 
        YearlyActiveUsers
Order by 
	    Year;  -- helps in displaying rows in sequential order


/* OUTPUT:
Year	ActiveUsers	PreviousYearUsers	YoY_Percentage_Growth
2014	30	NULL	NULL
2015	51	30	70
2016	70	51	37
2017	645	70	821
2018	2171	645	236
2019	7093	2171	226
2020	16889	7093	138
2021	19169	16889	13
2022	26809	19169	39
2023	15453	26809	-42
2024	11620	15453	-24

*/

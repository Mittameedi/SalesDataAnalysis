
# SalesDataInsights
A project focused on analyzing sales data quality, addressing key questions about data reliability and user behaviors. This repository contains SQL and Python code for exploring unstructured data, identifying quality issues, and answering targeted business questions to support Fetch’s insights.
## Files and Descriptions

[**Closed-ended_Question1.sql**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/Closed-ended_Question1.sql): SQL query answering the question, What are the top 5 brands by receipts scanned among users 21 and over?  


[**Closed-ended_Question2.sql**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/Closed-ended_Question2.sql): SQL query addressing the question, What are the top 5 brands by sales among users that have had their account for at least six months?  


[**Closed-ended_Question3.sql**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/Closed-ended_Question3.sql): SQL query providing insights into the percentage of sales in the Health & Wellness category by generation.  


[**Open-ended_Question1.sql**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/Open-ended_Question1.sql): SQL query identifying Fetch’s power users, based on assumptions about user activity.  


[**Open-ended_Question2.sql**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/Open-ended_Question2.sql): SQL query identifying the leading brand in the Dips & Salsa category.  


[**Open-ended_Question3.sql**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/Open-ended_Question3.sql): SQL query calculating Fetch’s growth percentage year over year, based on assumptions about user activity and sales data.  


[**FR_DA.twbx**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/FR_DA.twbx): Tableau workbook visualizing key insights from the Fetch Rewards dataset. It is a raw TBWX file that can be downloaded for local use, or you can view it publicly [here](https://public.tableau.com/app/profile/meghana5763/viz/FR_Data_Visualization/UserSalesDistribution?publish=yes)

[**FR_DataAnalysis.ipynb**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/FR_DataAnalysis.ipynb): Python notebook used for data exploration, quality checks, and analysis of unstructured CSV data to identify trends and quality issues.  


[**TransformedProducts.csv**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/TransformedProducts.csv): CSV file containing the transformed product data for analysis after data cleaning.  


[**TransformedTransactions.csv**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/TransformedTransactions.csv): CSV file containing the transformed transaction data for analysis after data cleaning.  


[**TransformedUsers.csv**](https://github.com/Mittameedi/SalesDataIntegrityHub/blob/main/TransformedUsers.csv): CSV file containing the transformed user data for analysis after data cleaning.  

## Email to Business Leader/Team

**Subject:** Data Quality Findings and Insights

Hi,

I’m Meghana from the Data Analytics team. In our recent analysis of the Users, Products, and Transactions datasets, we identified several data quality issues and notable insights. We also seek your assistance in understanding a few metrics currently in use.

#### Data Quality Issues:
1. Significant Missing Details and Duplicates:** All three datasets contain missing information and duplicate entries.
2. Improper Formatting:** There are formatting issues, such as the Birth_Date field in Users and the Barcode field in Products.
3. Inconsistent Values:** The final_sale metric contains white spaces, while final_quantity includes both numeric and character values, despite being defined as numeric according to the ER Diagram.

#### Observations:
1. The values in the final_quantity metric are recorded as decimals.
2. The same barcodes are associated with different products, and vice versa.
3. There are duplicate entries and conflicting values in Final_Sale and Final_Quantity for identical records.

#### Insights:
1. User growth from 2014 to 2022 was exponential; however, recent years indicate a decline.
2. Walmart is the top-performing store across all categories, with "Snacks" being the highest-performing category.

#### Request for Action:
1. Could you please provide details on how the values for the final_quantity and final_sale metrics are captured in the transaction data? Additionally, could you clarify why these metrics are labeled ‘final’?
2. We would appreciate documentation explaining how each product is differentiated and deemed unique within our data. If duplicates exist, could you elaborate on the rationale for allowing them?
3. Please confirm whether we are utilizing a combination of receipt number, user identification number, and barcode to distinguish between each transaction.

Thank you for your attention to these matters. I look forward to your insights.

Best regards,  
Meghana  
Data Analytics Team

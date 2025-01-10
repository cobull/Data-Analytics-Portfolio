/*
Checks to make sure the data in the 
"rideable_type" and "member_casual"
columns match the expected specifications
*/

SELECT DISTINCT(["rideable_type"])
FROM [GoogleCaseStudy].[dbo].[CombinedTable]

SELECT DISTINCT(["member_casual"])
FROM [GoogleCaseStudy].[dbo].[CombinedTable]
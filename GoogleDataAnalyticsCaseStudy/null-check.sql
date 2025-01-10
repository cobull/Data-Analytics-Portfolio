/*
Checks for empty strings or null values in each column 
*/

SELECT *
FROM [GoogleCaseStudy].[dbo].[CombinedTable]
WHERE
	(["rideable_type"] = '' OR ["rideable_type"] IS NULL) OR
	(["started_at"] = '' OR ["started_at"] IS NULL) OR
	(["ended_at"] = '' OR ["ended_at"] IS NULL) OR
	(["member_casual"] = '' OR ["member_casual"] IS NULL);
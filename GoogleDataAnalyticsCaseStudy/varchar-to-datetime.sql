/*
Creates a new datetime column in the table and then stores the ["started_at"] value
cast as a datetime in the column.
*/

ALTER TABLE [GoogleCaseStudy].[dbo].[CombinedTable]
	ADD "started_date" DATETIME

UPDATE [GoogleCaseStudy].[dbo].[CombinedTable]
	SET "started_date" = CAST(SUBSTRING(["started_at"], 2, LEN(["started_at"]) - 2) AS DATETIME)

/*
Creates a new datetime column in the table and then stores the ["ended_at"] value
cast as a datetime in the column.
*/
ALTER TABLE [GoogleCaseStudy].[dbo].[CombinedTable]
	ADD "ended_date" DATETIME

UPDATE [GoogleCaseStudy].[dbo].[CombinedTable]
	SET "ended_date" = CAST(SUBSTRING(["ended_at"], 2, LEN(["ended_at"]) - 2) AS DATETIME)
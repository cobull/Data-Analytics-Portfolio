/*
Selects and combines the columns pertinent to my business questions from each
month's tables. Resulting table represents one year's worth of data.
Columns pertinent to business questions: 
	rideable_type
	started_at
	ended_at
	member_casual
*/

SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
INTO GoogleCaseStudy.dbo.CombinedTable
FROM (
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202311-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202312-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202401-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202402-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202403-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202404-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202405-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202406-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202407-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202408-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202409-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202410-divvy-tripdata]
	UNION ALL
	SELECT ["rideable_type"], ["started_at"], ["ended_at"], ["member_casual"]
	FROM GoogleCaseStudy.dbo.[202411-divvy-tripdata]
	) as A

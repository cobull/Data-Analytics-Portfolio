/*
Create view that contains the day of week (Sunday=1, Monday=2, etc.),
month of year (January=1, February=2), start date, and whether the 
rider was a member or casual. This view was created to be used by
subsequent views.
*/

CREATE VIEW DayAndMonth AS
	SELECT 
		DATEPART(weekday, "started_date") AS day_of_week,
		DATEPART(month, "started_date") AS month_of_year,
		"started_date",
		["member_casual"]
	FROM
		[GoogleCaseStudy].[dbo].[CombinedTable]


/*
Create view that contains the total number of times a ride was
started on each day of the week by casual riders. This view
selects from the first view.
*/

CREATE VIEW CasualDayAndMonth AS
	SELECT 
		"day_of_week",
		COUNT(*) AS num_rides
	FROM
		DayAndMonth
	WHERE
		["member_casual"] = '"casual"'
	GROUP BY
		"day_of_week"

/*
Selects the day of the week, the number of rides started on each
day by casual riders, and the percentage of rides started on each
day by casual riders.
*/

SELECT
	"day_of_week",
	"num_rides",
	("num_rides" * 100.0 / SUM("num_rides") OVER ()) AS percent_of_total
FROM
	CasualDayAndMonth
ORDER BY
	"day_of_week" ASC

/*
Create view that contains the total number of times a ride was
started on each day of the week by member riders. This view
selects from the first view.
*/

CREATE VIEW MemberDayAndMonth AS
	SELECT 
		"day_of_week",
		COUNT(*) AS num_rides
	FROM
		DayAndMonth
	WHERE
		["member_casual"] = '"member"'
	GROUP BY
		"day_of_week"

/*
Selects the day of the week, the number of rides started on each
day by member riders, and the percentage of rides started on each
day by member riders.
*/

SELECT
	"day_of_week",
	"num_rides",
	("num_rides" * 100.0 / SUM("num_rides") OVER ()) AS percent_of_total
FROM
	MemberDayAndMonth
ORDER BY
	"day_of_week" ASC

/*
Calculates how many rides were taken for each month of the year and each
type of membership. Additionally calculates what percent of the total this 
represents for each type of membership.
*/

SELECT
	COUNT("month_of_year") AS month_count,
	["member_casual"],
	"month_of_year",
	SUM(COUNT("month_of_year")) OVER(PARTITION BY ["member_casual"]) AS total,
	COUNT("month_of_year") * 100.0 / SUM(COUNT("month_of_year")) OVER(PARTITION BY ["member_casual"]) AS percent_of_total
FROM
	DayAndMonth
GROUP BY
	["member_casual"], "month_of_year"
ORDER BY
	["member_casual"], "month_of_year"




/*
Create a view that displays the ride length for each ride as fraction of hours.
First, the difference between the start time and end time is calculated, and then
this difference is cast as a decimal and divided by 60 (minutes in a hour).
*/

CREATE VIEW TripLength AS
	SELECT 
		CAST(DATEDIFF(MINUTE, "started_date", "ended_date") AS DECIMAL(15,4))/60 AS ride_length,
		["member_casual"]
	FROM
		[GoogleCaseStudy].[dbo].[CombinedTable]

/*
Finds the average ride length of members and casuals
*/

SELECT 
	AVG("ride_length"),
	["member_casual"]
FROM
	TripLength
GROUP BY
	["member_casual"]
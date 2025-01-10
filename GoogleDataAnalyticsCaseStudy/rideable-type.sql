/*
Calculates how many times each of the rideable options were ridden for each
type of membership. Additionally calculates what percent of the total this 
represents for each type of membership.
*/

SELECT
	COUNT(["rideable_type"]) AS num_ridden,
	["member_casual"],
	["rideable_type"],
	SUM(COUNT(["rideable_type"])) OVER(PARTITION BY ["member_casual"]) AS total,
	COUNT(["rideable_type"]) * 100.0 / SUM(COUNT(["rideable_type"])) OVER(PARTITION BY ["member_casual"]) AS percent_of_total
FROM
	[GoogleCaseStudy].[dbo].[CombinedTable]
GROUP BY
	["member_casual"], ["rideable_type"]
ORDER BY
	["member_casual"], ["rideable_type"]
--Bringing key tables together with UNION operator.

WITH hotels AS (
SELECT *
FROM [dbo].['2018$']
union 
SELECT *
FROM [dbo].['2019$']
union
SELECT *
FROM [dbo].['2020$'])

--Building a query that will answer the stakeholder questions below.
--1. Is revenue growing year over year?
--2. Should we increase parking lot size?
--3. What trends are seen in the data?

SELECT arrival_date_year, hotel, ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights)*adr), 0) AS revenue
FROM hotels
GROUP BY arrival_date_year, hotel

SELECT *
FROM hotels
JOIN dbo.market_segment$
ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
ON meal_cost$.meal = hotels.meal

--The above query has been pulled into Power Bi.
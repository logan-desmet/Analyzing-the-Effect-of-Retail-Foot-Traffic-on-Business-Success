-- /////////////////////////////////////////////////////////////////////////////////////////
--  ( bID | Longevity | Open date | Close date | Season Closed | State | Category | RFT )
--                                 (615.8k rows, .csv)
-- /////////////////////////////////////////////////////////////////////////////////////////

SELECT r.business_id, DATE(min(r.review_date)) as opening_date, DATE(max(r.review_date)) as closing_date, DATEDIFF(Day, min(r.review_date), max(r.review_date)) as longevity_inDays, b.state, c.category_name, AVG(rftTemp.avg_daily_foot_traffic) as avg_retail_foot_traffic,
    CASE 
        WHEN DATE_PART(dayofyear, closing_date) BETWEEN '356' AND '366' THEN 'Winter' 
        WHEN DATE_PART(dayofyear, closing_date) BETWEEN '1' AND '78' THEN 'Winter'
        WHEN DATE_PART(dayofyear, closing_date) BETWEEN '79' AND '170' THEN 'Spring'
        WHEN DATE_PART(dayofyear, closing_date) BETWEEN '171' AND '264' THEN 'Summer'
        WHEN DATE_PART(dayofyear, closing_date) BETWEEN '265' AND '355' THEN 'Fall'
        ELSE 'S?'
        END AS season_closed
From (
    SELECT REPLACE(json_data:state, '"', '') AS state, Avg(json_data:foot_traffic_count_normalized) AS avg_daily_foot_traffic
    FROM UNITED_STATES_RETAIL_FOOT_TRAFFIC_DATA.PUBLIC.FOOT_TRAFFIC_JSON_DATA
    WHERE state in ('CA','MO','AZ','PA','TN','FL','IN','LA','AB','NV','ID','DE','IL','NJ')
    GROUP BY state
) AS rftTemp
INNER JOIN yelp.public.business b
ON rftTemp.state = b.state
INNER JOIN yelp.public.review r
ON r.business_id = b.business_id
INNER JOIN yelp.public.category c 
ON c.business_id = r.business_id
GROUP BY r.business_id, b.state, c.category_name; 

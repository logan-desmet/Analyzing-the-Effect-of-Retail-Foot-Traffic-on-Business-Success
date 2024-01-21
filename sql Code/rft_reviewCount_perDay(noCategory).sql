-- /////////////////////////////////////////////////////////////////////////////////////////
--  ( Review Count | RFT | bID | date | day of week (1-7) | State | Season )
--                          (2.4 million rows, .csv)
-- /////////////////////////////////////////////////////////////////////////////////////////

SELECT COUNT(r.review_id) as reviewCount, r.business_id, DATE(r.review_date) as date, b.state, AVG(rftTemp.avg_daily_foot_traffic) as avg_daily_foot_traffic, rftTemp.DOW,
    CASE 
            WHEN DATE_PART(dayofyear, date) BETWEEN '356' AND '366' THEN 'Winter' 
            WHEN DATE_PART(dayofyear, date) BETWEEN '1' AND '78' THEN 'Winter'
            WHEN DATE_PART(dayofyear, date) BETWEEN '79' AND '170' THEN 'Spring'
            WHEN DATE_PART(dayofyear, date) BETWEEN '171' AND '264' THEN 'Summer'
            WHEN DATE_PART(dayofyear, date) BETWEEN '265' AND '355' THEN 'Fall'
            ELSE 'S?'
            END AS Season
FROM (
    SELECT REPLACE(json_data:state, '"', '') AS state, Avg(json_data:foot_traffic_count_normalized) AS avg_daily_foot_traffic, Date(json_data:timestamp) as day, DAYOFWEEK(day) as DOW
    FROM UNITED_STATES_RETAIL_FOOT_TRAFFIC_DATA.PUBLIC.FOOT_TRAFFIC_JSON_DATA
    WHERE state in ('CA','MO','AZ','PA','TN','FL','IN','LA','AB','NV','ID','DE','IL','NJ')
    GROUP BY state, day
) AS rftTemp
INNER JOIN yelp.public.business b
ON rftTemp.state = b.state
INNER JOIN yelp.public.review r
ON r.business_id=b.business_id AND rftTemp.day=date
WHERE date BETWEEN ('2018-01-01') AND ('2022-01-19’)
GROUP BY r.business_id, date, rftTemp.DOW, b.state, Season;

-- /////////////////////////////////////////////////////////////////////////////////////////
--  		( State | RFT (avg per State+Season) | Season ) - Date (1/1/18-9/13/22)
-- 								(44 rows, .csv)
-- /////////////////////////////////////////////////////////////////////////////////////////

SELECT REPLACE(json_data:state, '"', '') AS state, Avg(json_data:foot_traffic_count_normalized) AS avg_daily_foot_traffic,
    CASE 
        WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '356' AND '366' THEN 'Winter' 
        WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '1' AND '78' THEN 'Winter'
        WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '79' AND '170' THEN 'Spring'
        WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '171' AND '264' THEN 'Summer'
        WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '265' AND '355' THEN 'Fall'
        ELSE 'S?'
        END AS Season
FROM FOOT_TRAFFIC_JSON_DATA 
WHERE state in ('CA','MO','AZ','PA','TN','FL','IN','LA','AB','NV','ID','DE','IL','NJ')
GROUP BY state, season;

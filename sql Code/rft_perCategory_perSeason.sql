-- /////////////////////////////////////////////////////////////////////////////////////////
--  				( Season | RFT | Category )
--     					(5.2k rows, .csv)
-- /////////////////////////////////////////////////////////////////////////////////////////


SELECT rftTemp.Season, AVG(rftTemp.avg_daily_foot_traffic) as avg_daily_Foot_Traffic, yc.category_name
FROM (
    SELECT REPLACE(json_data:state, '"', '') AS state, Avg(json_data:foot_traffic_count_normalized) AS avg_daily_foot_traffic, 
        CASE 
            WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '356' AND '366' THEN 'Winter' 
            WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '1' AND '78' THEN 'Winter'
            WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '79' AND '170' THEN 'Spring'
            WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '171' AND '264' THEN 'Summer'
            WHEN DATE_PART(dayofyear, DATE(json_data:timestamp)) BETWEEN '265' AND '355' THEN 'Fall'
            ELSE 'S?'
            END AS Season
    FROM UNITED_STATES_RETAIL_FOOT_TRAFFIC_DATA.PUBLIC.FOOT_TRAFFIC_JSON_DATA
    WHERE state in ('CA','MO','AZ','PA','TN','FL','IN','LA','AB','NV','ID','DE','IL','NJ') AND DATE(json_data:timestamp) BETWEEN ('2018-01-01') AND ('2022-01-19')
    GROUP BY state, Season
) AS rftTemp
JOIN YELP.PUBLIC.BUSINESS yb
ON rftTemp.state = yb.state
JOIN YELP.PUBLIC.CATEGORY yc
ON yb.business_id=yc.business_id
GROUP BY rftTemp.Season, yc.category_name;

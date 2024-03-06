SELECT 
     date_date,
     SUM(click) AS click,
     SUM(impression) AS impression,
     SUM(ads_cost) AS ads_cost
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC
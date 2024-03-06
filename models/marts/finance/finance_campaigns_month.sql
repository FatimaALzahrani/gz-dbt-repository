SELECT
   EXTRACT(MONTH FROM date_date) AS date_month ,
   SUM(operational_margin - ads_cost) AS ads_margin,
   ROUND(SUM(average_basket),2) AS average_basket,
   SUM(operational_margin) AS operational_margin,
   SUM(ads_cost) AS ads_cost,
   SUM(impression) AS impression,
   SUM(click) AS click,
   SUM(quantity) AS quantity,
   SUM(revenue) AS revenue,
   SUM(purchase_cost) AS purchase_cost,
   SUM(margin) AS margin
FROM {{ ref('int_campaigns_day') }}
FULL OUTER JOIN {{ ref('finance_day') }}
USING(date_date)
GROUP BY date_month
ORDER BY date_month DESC
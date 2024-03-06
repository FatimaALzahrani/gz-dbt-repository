SELECT
   date_date,
   operational_margin - ads_cost AS ads_margin,
   ROUND(average_basket,2) AS average_basket,
   operational_margin,
   ads_cost,
   impression,
   click,
   quantity,
   revenue,
   purchase_cost,
   margin
FROM {{ ref('int_campaigns_day') }}
FULL OUTER JOIN {{ ref('finance_day') }}
USING(date_date)
ORDER BY date_date DESC
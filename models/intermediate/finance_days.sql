SELECT
    date_date,
    COUNT(orders_id) AS nb_transaction,
    ROUND(SUM(revenue),0) AS revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT orders_id) ,0) AS average_basket,
    ROUND(SUM(margin),0) AS margin,
    ROUND(SUM(operational_margin),0) AS operational_margin,
    ROUND(SUM(quantity),0) AS quantity,
    ROUND(SUM(purchase_cost),0) AS purchase_cost
FROM
    {{ ref('int_orders_operational') }} 
GROUP BY date_date
ORDER BY
    date_date DESC

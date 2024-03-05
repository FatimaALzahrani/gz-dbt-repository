SELECT
    orders.orders_id,
    date_date,
    ROUND((margin+shipping_fee)  -(logcost  + CAST(ship_cost AS INT64)),2) AS operational_margin,
    revenue,
    quantity,
    purchase_cost,
    margin
FROM
    {{ ref('int_orders_margin') }} AS orders
INNER JOIN
    {{ ref('stg_raw__ship') }} AS ship
ON
    orders.orders_id = ship.orders_id
ORDER BY
    orders.orders_id DESC

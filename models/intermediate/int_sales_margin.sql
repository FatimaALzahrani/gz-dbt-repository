WITH joins AS(
SELECT
 sales.*,
(CAST(purchase_price as FLOAT64)*quantity) AS purchase_cost,
 product.purchase_price
FROM {{ ref('stg_raw__product') }} AS product
INNER JOIN {{ ref('stg_raw__sales') }} AS sales
ON product.products_id = sales.products_id
)
SELECT *,
     purchase_cost,
    {{ margin_percent('revenue', 'purchase_cost') }},
    ROUND(revenue - (CAST(purchase_price as FLOAT64)*quantity),2) AS margin
FROM 
    joins 
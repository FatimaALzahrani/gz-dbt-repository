{% macro margin_percent(revenue, purchase_price ) %}
   ROUND( SAFE_DIVIDE( ({{ revenue }} - {{ purchase_cost }}) , {{ revenue }} ) , 2)
{% endmacro %}

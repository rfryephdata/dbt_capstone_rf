WITH orders AS (
    SELECT * FROM {{ ref('int_orders__joined') }}
),

final AS (
    SELECT
        order_number,
        order_line_number,
        product_code,
        customer_number,
        order_date,
        required_date,
        shipped_date,
        status,
        comments,
        quantity_ordered,
        price_each,
        line_total
    FROM orders
)

SELECT * FROM final

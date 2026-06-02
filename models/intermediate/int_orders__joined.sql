WITH orders AS (
    SELECT * FROM {{ ref('stg_classic_models__orders') }}
),

order_details AS (
    SELECT * FROM {{ ref('stg_classic_models__order_details') }}
),

joined AS (
    SELECT
        orders.order_number,
        orders.order_date,
        orders.required_date,
        orders.shipped_date,
        orders.status,
        orders.comments,
        orders.customer_number,
        order_details.product_code,
        order_details.quantity_ordered,
        order_details.price_each,
        order_details.order_line_number,
        order_details.quantity_ordered * order_details.price_each AS line_total
    FROM orders
        INNER JOIN order_details
            ON orders.order_number = order_details.order_number
)

SELECT * FROM joined

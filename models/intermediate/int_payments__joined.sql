WITH payments AS (
    SELECT * FROM {{ ref('stg_classic_models__payments') }}
),

customers AS (
    SELECT * FROM {{ ref('stg_classic_models__customers') }}
),

joined AS (
    SELECT
        payments.check_number,
        payments.payment_date,
        payments.amount,
        customers.customer_number,
        customers.customer_name,
        customers.country AS customer_country
    FROM payments
        INNER JOIN customers
            ON payments.customer_number = customers.customer_number
)

SELECT * FROM joined

WITH payments AS (
    SELECT * FROM {{ ref('int_payments__joined') }}
),

final AS (
    SELECT
        check_number,
        customer_number,
        customer_name,
        customer_country,
        payment_date,
        amount
    FROM payments
)

SELECT * FROM final

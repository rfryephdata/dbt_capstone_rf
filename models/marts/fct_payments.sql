WITH payments AS (
    SELECT * FROM {{ ref('int_payments__joined') }}
),

final AS (
    SELECT
        check_number,
        customer_number,
        payment_date,
        amount
    FROM payments
)

SELECT * FROM final

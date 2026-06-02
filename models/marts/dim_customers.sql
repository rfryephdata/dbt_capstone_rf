WITH customers AS (
    SELECT * FROM {{ ref('int_customers__joined') }}
),

final AS (
    SELECT
        customer_number,
        customer_name,
        contact_first_name,
        contact_last_name,
        phone,
        address_line_1,
        address_line_2,
        city,
        state,
        postal_code,
        country,
        credit_limit,
        sales_rep_employee_number,
        sales_rep_first_name,
        sales_rep_last_name,
        sales_rep_office_city,
        sales_rep_office_country,
        sales_rep_territory
    FROM customers
)

SELECT * FROM final

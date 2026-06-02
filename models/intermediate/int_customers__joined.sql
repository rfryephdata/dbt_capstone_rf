WITH customers AS (
    SELECT * FROM {{ ref('stg_classic_models__customers') }}
),

employees AS (
    SELECT * FROM {{ ref('int_employees__joined') }}
),

joined AS (
    SELECT
        customers.customer_number,
        customers.customer_name,
        customers.contact_first_name,
        customers.contact_last_name,
        customers.phone,
        customers.address_line_1,
        customers.address_line_2,
        customers.city,
        customers.state,
        customers.postal_code,
        customers.country,
        customers.credit_limit,
        employees.employee_number AS sales_rep_employee_number,
        employees.first_name AS sales_rep_first_name,
        employees.last_name AS sales_rep_last_name,
        employees.office_city AS sales_rep_office_city,
        employees.office_country AS sales_rep_office_country,
        employees.office_territory AS sales_rep_territory
    FROM customers
        LEFT JOIN employees
            ON customers.sales_rep_employee_number = employees.employee_number
)

SELECT * FROM joined

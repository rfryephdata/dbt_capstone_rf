WITH employees AS (
    SELECT * FROM {{ ref('int_employees__joined') }}
),

final AS (
    SELECT
        employee_number,
        first_name,
        last_name,
        email,
        extension,
        job_title,
        reports_to_employee_number,
        office_code,
        office_city,
        office_state,
        office_country,
        office_territory
    FROM employees
)

SELECT * FROM final

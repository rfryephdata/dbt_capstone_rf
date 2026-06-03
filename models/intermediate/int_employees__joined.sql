WITH employees AS (
    SELECT * FROM {{ ref('stg_classic_models__employees') }}
),

offices AS (
    SELECT * FROM {{ ref('stg_classic_models__offices') }}
),

joined AS (
    SELECT
        employees.employee_number,
        employees.first_name,
        employees.last_name,
        employees.email,
        employees.extension,
        employees.job_title,
        employees.reports_to AS reports_to_employee_number,
        offices.office_code,
        offices.city AS office_city,
        offices.state AS office_state,
        offices.country AS office_country,
        offices.territory AS office_territory
    FROM employees
        INNER JOIN offices
            ON employees.office_code = offices.office_code
)

SELECT * FROM joined

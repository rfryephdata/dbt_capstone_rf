WITH date_spine AS (
    SELECT * FROM {{ ref('date_spine') }}
),

final AS (
    SELECT
        DATE_TRUNC('DAY', date_day)::DATE AS date_key,
        date_day::DATE AS full_date,
        DAYOFWEEK(date_day) AS day_of_week_number,
        DAYNAME(date_day) AS day_of_week_name,
        DAY(date_day) AS day_of_month,
        DAYOFYEAR(date_day) AS day_of_year,
        WEEKOFYEAR(date_day) AS week_of_year,
        MONTH(date_day) AS month_number,
        MONTHNAME(date_day) AS month_name,
        QUARTER(date_day) AS quarter_number,
        CONCAT('Q', QUARTER(date_day)) AS quarter_name,
        YEAR(date_day) AS year_number,
        CASE
            WHEN DAYOFWEEK(date_day) IN (1, 7) THEN true
            ELSE false
        END AS is_weekend,
        DATE_TRUNC('WEEK', date_day)::DATE AS first_day_of_week,
        DATE_TRUNC('MONTH', date_day)::DATE AS first_day_of_month,
        LAST_DAY(date_day)::DATE AS last_day_of_month,
        DATE_TRUNC('QUARTER', date_day)::DATE AS first_day_of_quarter,
        DATE_TRUNC('YEAR', date_day)::DATE AS first_day_of_year
    FROM date_spine
)

SELECT * FROM final

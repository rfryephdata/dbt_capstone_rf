WITH offices AS (
    SELECT * FROM {{ ref('stg_classic_models__offices') }}
),

final AS (
    SELECT
        office_code,
        city,
        state,
        country,
        territory,
        phone,
        address_line1,
        address_line2,
        postal_code
    FROM offices
)

SELECT * FROM final

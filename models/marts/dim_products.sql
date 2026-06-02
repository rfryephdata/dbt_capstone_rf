WITH products AS (
    SELECT * FROM {{ ref('int_products__joined') }}
),

final AS (
    SELECT
        product_code,
        product_name,
        product_line,
        product_line_description,
        product_scale,
        product_vendor,
        product_description,
        quantity_in_stock,
        buy_price,
        msrp
    FROM products
)

SELECT * FROM final

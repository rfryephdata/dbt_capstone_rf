WITH products AS (
    SELECT * FROM {{ ref('stg_classic_models__products') }}
),

product_lines AS (
    SELECT * FROM {{ ref('stg_classic_models__product_lines') }}
),

joined AS (
    SELECT
        products.product_code,
        products.product_name,
        products.product_scale,
        products.product_vendor,
        products.product_description,
        products.quantity_in_stock,
        products.buy_price,
        products.msrp,
        product_lines.product_line,
        product_lines.text_description AS product_line_description
    FROM products
        LEFT JOIN product_lines
            ON products.product_line = product_lines.product_line
)

SELECT * FROM joined

WITH LatestPrices AS (
    SELECT 
        product_id,
        new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM 
        products
    WHERE 
        change_date <= TO_DATE('2019-08-16', 'YYYY-MM-DD')
)
SELECT 
    p.product_id,
    COALESCE(lp.new_price, 10) AS price
FROM 
    (SELECT DISTINCT product_id FROM products) p
LEFT JOIN 
    LatestPrices lp 
    ON p.product_id = lp.product_id AND lp.rn = 1;
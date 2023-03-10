-- порахувати кількість телефонів, які були продані
-- порахувати кількість телефонів, які є на складі
-- порахувати сереню ціну

-- порахувати середню ціну кожного бренда

SELECT sum("quantity") FROM "phones_to_orders";

SELECT sum("quantity") FROM "phones";

SELECT avg("price") FROM "phones";


SELECT avg(price) as "Average price", "brand"
FROM "phones"
GROUP BY "brand";

SELECT count("model"), "brand"
FROM "phones"
GROUP BY "brand";

--порахувати середню ціну на Sony
SELECT avg("price") "brand"
FROM "phones"
WHERE "brand" = 'Sony'
GROUP BY "brand";

--порахувати кількість замовлень кожного користувача
SELECT count(*) "userId"
FROM "orders"
GROUP BY "userId";

--порахувати загальну вартість усіх телефонів в діапазоні цін від 10000 до 20000
SELECT sum("price"*"quantity") as "Summ price of phone"
FROM "phones"
WHERE "price" BETWEEN 10000 AND 20000;


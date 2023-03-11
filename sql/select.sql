--порахувати кількість телефонів, які були продані
SELECT sum("quantity")
FROM "phones_to_orders";
--порахувати кількість телефонів, які є на складі
SELECT sum("quantity")
FROM "phones";
--порахувати сереню ціну
SELECT avg(price) as "Average price"
FROM "phones";
--порахувати середню ціну кожного бренда
SELECT avg(price) as "Average price", "brand"
FROM "phones"
GROUP BY "brand";
--порахувати кількість моделей кожного бренда
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


SELECT "id", "height","firstName", "birthday"
FROM "users"
ORDER BY "height" DESC, "firstName" ASC, "birthday" DESC;



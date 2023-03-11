
--отримати пошту користувачів, які купляли айфони

SELECT "users"."email", "phones"."brand"
FROM "users"
JOIN "orders" ON "users"."id"="orders"."userId"
JOIN "phones_to_orders" ON "orders"."id"="phones_to_orders"."orderId"
JOIN "phones" ON "phones_to_orders"."phoneId"="phones"."id"
WHERE "phones"."brand"='Iphone';


--отримати користувачів, які зробили більше 3 замовлень

SELECT count("userId"), "userId"
FROM "orders"
GROUP BY "userId"
HAVING count("userId")>3;


--отримати усі замовлення з телефоном з id=13 і пошту юзерів

SELECT "users"."email", "phones_to_orders"."orderId"
FROM "users"
JOIN "orders" ON "users"."id"="orders"."userId"
JOIN "phones_to_orders" ON "orders"."id"= "phones_to_orders"."orderId"
JOIN "phones" ON "phones_to_orders"."phoneId"="phones"."id"
WHERE "phones"."id"=13


--отримати модель найпопулярнішого телефону(продана найбільшу кількість)

SELECT count("phones_to_orders"."quantity") AS "quantity", "phones"."model"
FROM "phones" 
JOIN "phones_to_orders" ON "phones"."id"="phones_to_orders"."phoneId"
GROUP BY "phones"."model"
ORDER BY "quantity" DESC
LIMIT 1;


--отримати сумму чеку кожного замовлення

SELECT sum("phones_to_orders"."phoneId"*"phones"."price"), "phones_to_orders"."orderId"
FROM "phones_to_orders"
JOIN "phones" ON "phones"."id"= "phones_to_orders"."phoneId"
GROUP BY "phones_to_orders"."orderId"




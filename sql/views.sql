-- VIEW MATERIALIZED матеріальна view фізична таблиця 
-- VIEW підзапит для віртуальної таблиці

DROP VIEW "email_seasonBD";
CREATE OR REPLACE VIEW "email_seasonBD" AS (
  SELECT (
    CASE
      extract( "month" from "birthday" ) 
      WHEN 1 THEN 'winter'
      WHEN 2 THEN 'winter'
      WHEN 3 THEN 'spring'
      WHEN 4 THEN 'spring'
      WHEN 5 THEN 'spring'
      WHEN 6 THEN 'summer'
      WHEN 7 THEN 'summer'
      WHEN 8 THEN 'summer'
      WHEN 9 THEN 'autumn'
      WHEN 10 THEN 'autumn'
      WHEN 11 THEN 'autumn'
      WHEN 12 THEN 'winter'
    END
  ) AS "season", "birthday", "email"
, "id"
FROM "users"
);


-- порахувати скільки людей народилися в окремий сeзон
SELECT count("season"), "season"
FROM "email_seasonBD"
GROUP BY "season";

--************

-- додати до юзера (пошту) віртуальну колонку кільсть замовлень order_amount

SELECT "users"."id","users"."email" , count("orders"."id") as "order_amount"
FROM "users"
JOIN "orders" ON "users"."id"="orders"."userId"
GROUP BY "users"."id", "users"."email";


CREATE OR REPLACE VIEW "users_email" AS (
  SELECT "users"."id","users"."email" , count("orders"."id") as "order_amount"
FROM "users"
JOIN "orders" ON "users"."id"="orders"."userId"
GROUP BY "users"."id", "users"."email" 
)

-- виведіть тільки рядки де "order_amount">3
SELECT *
FROM "users_email"
WHERE "order_amount">3;

--порахуйте кількість людей, які зробили однакову кількість замовлень
SELECT count("id"), "order_amount"
FROM "users_email"
GROUP BY "order_amount";



-- створити вьюшку з замовленням * і його вартістю

CREATE VIEW "order_cost" AS (
SELECT "o".*, sum("p"."price"*"pto"."quantity")AS "cost"
FROM "orders" AS "o"
JOIN "phones_to_orders" AS "pto" ON "o"."id"="pto"."orderId"
JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
GROUP BY "o"."id")


-- пошту юзера 5 юзерів, які зробили найбільші за вартістю замовлення

SELECT "u"."email", "u"."id", "oc"."cost"
FROM "users" AS "u"
JOIN "order_cost" AS "oc" ON "u"."id"= "oc"."userId"
ORDER BY "oc"."cost" DESC
LIMIT 5;



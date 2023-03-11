--отримати id усіх юзерів , які робили замовлення

--декартовий добуток
SELECT * FROM a,b;


UNION --об'єднання двох столбців, однакові данні з двох стовпців не повторюються

INTERSECT --перетин, виведе данні які співпадають з двох столбців

EXCEPT --віднімання, вийде унікальні данні лише з тієї таблиці яка записана першою!!! це важливо



SELECT "id" FROM "users"
INTERSECT
SELECT "userId" FROM "orders";


--отримати id усіх юзерів , які not-робили замовлення
SELECT "id" FROM "users"
EXCEPT
SELECT "userId" FROM "orders";

-- JOIN можемо робити тьльки по зв'язках таблиць



--отримати усі замовлення юзера з id=33
SELECT * FROM "users"
JOIN "orders" ON "users"."id"="orders"."userId"
 WHERE "users"."id"=33;

-- скорочення
SELECT "u"."id", "u"."email", "o"."id"
 FROM "users" AS "u"
JOIN "orders" AS "o" ON "u"."id"="o"."userId"
 WHERE "u"."id"=33;


--отримати усі id і час замовлення з Sony
SELECT *
 FROM "orders" AS "o"
JOIN "phones_to_orders" AS "pto" ON "o"."id" = "pto"."orderId"
JOIN "phones" AS "p" ON "pto"."phoneId" = "p"."id"
 WHERE "p"."brand"='Sony';



-- кількість сонь в одному замовленні
SELECT "o"."id", count("p"."model") AS "amount", "p"."brand"
 FROM "orders" AS "o"
JOIN "phones_to_orders" AS "pto" ON "o"."id" = "pto"."orderId"
JOIN "phones" AS "p" ON "pto"."phoneId" = "p"."id"
 WHERE "p"."brand"='Sony'
 GROUP BY "o"."id", "p"."brand"
 ORDER BY "amount" DESC;


 --кількість проданих екземплярів по кожній моделі(скільки разів цю модель купляли)
SELECT count("pto"."phoneId"), "p"."model"
FROM "phones" AS "p"
  JOIN "phones_to_orders" AS "pto" ON "p"."id"="pto"."phoneId"
GROUP BY "p"."model";


--скільки купили цієї перної моделі (кількість саме проданих телефонів цієї моделі)
SELECT sum("pto"."quantity"), "p"."model"
FROM "phones" AS "p"
  JOIN "phones_to_orders" AS "pto" ON "p"."id"="pto"."phoneId"
GROUP BY "p"."model";


--кількість проданих екземплярів по кожному бренду
SELECT sum("pto"."quantity"), "p"."brand"
FROM "phones" AS "p"
  JOIN "phones_to_orders" AS "pto" ON "p"."id"="pto"."phoneId"
GROUP BY "p"."brand";


--- обрати бренди, моделі котрі НЕ куплялися
SELECT "p"."brand", "p"."model"
FROM "phones" AS "p"
  LEFT OUTER JOIN "phones_to_orders" AS "pto" ON "p"."id"="pto"."phoneId"
  WHERE "pto"."phoneId" IS NULL
GROUP BY "p"."brand", "p"."model";

--- обрати усі бренди 
SELECT "p"."brand"
FROM "phones" AS "p"
  FULL OUTER JOIN "phones_to_orders" AS "pto" ON "p"."id"="pto"."phoneId"
GROUP BY "p"."brand";


--- обрати бренди котрі  куплялися
SELECT "p"."brand"
FROM "phones" AS "p"
  INNER JOIN "phones_to_orders" AS "pto" ON "p"."id"="pto"."phoneId"
  GROUP BY "p"."brand";




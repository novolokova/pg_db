-- порахувати люди якого сезону народження витрачають найбільше грошей

SELECT sum("oc"."cost") AS "costs_season",  "es_bd"."season"
FROM "order_cost" AS "oc"
JOIN "email_seasonBD" AS "es_bd" ON "oc"."userId" = "es_bd"."id"
GROUP BY "es_bd"."season"
ORDER BY  "costs_season" DESC
LIMIT 1;

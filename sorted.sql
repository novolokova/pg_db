SELECT avg(price) as "Average price", "brand"
FROM "phones"
GROUP BY "brand";


SELECT "id", "height"
FROM "users"
-- min
-- ORDER BY "height" ASC
--max
ORDER BY "height" DESC
LIMIT 1;


SELECT "id", "height", "firstName", "birthday"
FROM "users"
ORDER BY "height" DESC, "firstName" ASC,  "birthday" DESC; 

--відсортувати юзерів за віком, а потім за ім'ям та прізвищем(id,age,firstName,lastName)
SELECT "quantity" "id", "model", "brand"
FROM "phones"
ORDER BY "quantity" DESC
LIMIT 1;

SELECT * 
FROM(
    SELECT "id", extract("year" FROM age("birthday")) as "age", "firstName", "lastName"
FROM "users"
) AS "age_user"
WHERE "age_user"."age"IN(33,44,55,77)
ORDER BY "age", "firstName",  "lastName"  ASC;



-- порахувати кількість людей кожного віку (age, count)
SELECT count(*) as "count", extract("year" FROM age("birthday")) as "age"
FROM "users"
GROUP BY "age"
ORDER BY "count" DESC;


SELECT * 
FROM(
SELECT count(*) as "count", extract("year" FROM age("birthday")) as "age"
FROM "users"
GROUP BY "age"
) AS "age_user"
WHERE "age_user"."age" BETWEEN 20 AND 30
ORDER BY "age_user"."count" DESC;


--порахувати кількість людей кожного віку (age, count) і вивести тільки той вік, де кількість = 4
SELECT count(*) as "count", extract("year" FROM age("birthday")) as "age"
FROM "users"
GROUP BY "age"
HAVING count(*)=4
ORDER BY "age"



SELECT "id", "firstName"
FROM "users"
WHERE "firstName" ILIKE 'n%';


SELECT "id", "firstName"
FROM "users"
WHERE "firstName" ILIKE 'n%n';


SELECT "id", "firstName"
FROM "users"
WHERE "firstName" ILIKE '_b%';

--знайдiть юзерів з ініціалами **
SELECT "id", "firstName", "lastName"
FROM "users"
WHERE "firstName" ILIKE 'a%' AND "lastName"  ILIKE 's%';




--знайдiть юзерів з ініціалами **
SELECT "id", "firstName", "lastName"
FROM "users"
WHERE "firstName" SIMILAR TO '(A|B)%';






























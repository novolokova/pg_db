SELECT avg(price) as "Average price", "brand"
FROM "phones"
GROUP BY "brand";

-- ORDER BY - сортування

--  від  найменьшого ASC 
-- від найбільшого DESC

-- найвища людина  
SELECT "id", "height"
FROM "users"
ORDER BY "height" DESC
LIMIT 1;


-- сщртування по heightб потім по firstNameб потім по birthday
SELECT "id", "height", "firstName", "birthday"
FROM "users"
ORDER BY "height" DESC, "firstName" ASC,  "birthday" DESC; 


--якої моделі телефонів залишилося менше усього на складі(id,model,brand)
SELECT "id","model","brand", "quantity"
FROM "phones"
ORDER BY "quantity" ASC
LIMIT 1;


--відсортувати юзерів за віком, а потім за ім'ям та прізвищем(id,age,firstName,lastName)
SELECT * 
FROM(
    SELECT "id", extract("year" FROM age("birthday")) as "age", "firstName", "lastName"
FROM "users"
) AS "age_user"
WHERE "age_user"."age" IN (33,44,55,77)
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



-- HAVING фільтр для груп


--порахувати кількість людей кожного віку (age, count) і вивести тільки той вік, де кількість = 4
SELECT count(*) as "count", extract("year" FROM age("birthday")) as "age"
FROM "users"
GROUP BY "age"
HAVING count(*)=4
ORDER BY "age"


/*
LIKE - з урахуванням регистру
ILIKE - без урахування регистру
SIMILAR TO - (9.7.2 book)
REG_EXP
*/

-- перша буква за пошуком
SELECT "id", "firstName"
FROM "users"
WHERE "firstName" ILIKE 'n%';

-- перша та остання буква за пошуком
SELECT "id", "firstName"
FROM "users"
WHERE "firstName" ILIKE 'n%n';

-- будь яка перша буква, а друга b
SELECT "id", "firstName"
FROM "users"
WHERE "firstName" ILIKE '_b%';

--знайдiть юзерів з ініціалами * *
SELECT "id", "firstName", "lastName"
FROM "users"
WHERE "firstName" ILIKE 'a%' AND "lastName"  ILIKE 's%';




--знайдiть юзерів з ініціалами **    |- або
SELECT "id", "firstName", "lastName"
FROM "users"
WHERE "firstName" SIMILAR TO '(A|B)%';



--знайти кількість символів в пошті, яка починається з букви a, сгрупувати їх за кількістю, показати тількі ті групи, де кількість символів більше 25

SELECT length("email") AS "lengthEmail"
FROM "users"
WHERE "email" ILIKE 'a%' AND length("email")>25
GROUP BY "lengthEmail"

--відсіяти непопулярні групи

SELECT length("email") AS "lengthEmail", count("id")
FROM "users"
WHERE "email" ILIKE 'a%' 
GROUP BY "lengthEmail"
HAVING count("id")>1;



























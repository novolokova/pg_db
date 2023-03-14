SELECT EXISTS(SELECT * 
FROM "users"
WHERE "id"=5); 

SELECT * 
FROM "users"
WHERE "id" IN(SELECT "userId" FROM "orders"); 


SELECT * 
FROM "users"
WHERE "id" IN(SELECT "userId" FROM "orders"); 



SELECT "model", "brand"
FROM "phones"
WHERE "id" NOT IN(SELECT "phoneId" FROM "phones_to_orders"); 



SELECT * 
FROM "users"
WHERE "id" = ANY(SELECT "userId" FROM "orders"); 









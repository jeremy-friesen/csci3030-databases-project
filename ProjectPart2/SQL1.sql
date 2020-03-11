-- 1.a)
SELECT *
FROM   "Director"
WHERE EXISTS (SELECT director_id
		FROM "Birth_Location"
		WHERE  "Director".director_id = "Birth_Location".director_id
		AND "Birth_Location".country = 'United States');
--b)
SELECT *
FROM "Movie"
WHERE "Movie".movie_id IN
	(SELECT movie_id
	FROM "Director-Movie"
	WHERE "Director-Movie".director_id =
		(SELECT director_id FROM "Director"
		  WHERE "Director".first_name = 'Steven'
		  AND "Director".surname = 'Spielberg'
		 ));
--c)
SELECT *
FROM "Actor"
WHERE "Actor".actor_id IN
	(SELECT actor_id
	 FROM "Cast"
	 WHERE "Cast".movie_id IN
		(SELECT movie_id 
		 FROM "Movie"
		 WHERE "Movie".movie_budget > 1000000
		)
	);
--c) i. -> v.
SELECT movie_budget AS "budgetInUSD", 
	movie_budget * 1.33 AS "budgetInCAD", 
	movie_budget * 108 AS "budgetInJPY",
	movie_budget * 64 AS "budgetInRUB",
	movie_budget * 0.91 AS "budgetInEUR",
	movie_budget * 1 AS "budgetInCHF"
FROM "Movie"
WHERE "Movie".movie_budget > 1000000;
--d)
SELECT *
FROM "Director"
WHERE "Director".surname LIKE 'S%' OR "Director".surname LIKE 'P%';
--e) Find all the thriller movies in which there is a playing actor who is less than 50 (age).
SELECT *
FROM "Movie"
WHERE "Movie".movie_id IN (
	SELECT movie_id
	FROM "Movie-Genre"
	WHERE genre_id = 
		(SELECT genre_id FROM "Genre" WHERE "Genre".genre_name = 'Thriller')
	AND movie_id IN
		(SELECT movie_id
		 FROM "Cast"
		 WHERE actor_id IN
			(SELECT actor_id
			 FROM "Actor"
			 WHERE "Actor".birth_date > DATE('1969-11-23')
			)
		)
)
;
--f) Find all the pairs of actors who have blue eye color. Produce pairs in alphabetic order, e.g., (Howard before Lynch) and do not produce pairs like (Lynch, Lynch)
-- Had to insert one Actor, as there weren't two Actors which shared a value
INSERT INTO public."Actor"(
	actor_id, first_name, surname, birth_date, eyecolor)
	VALUES (004, 'Chris', 'Hemsworth', DATE '1974-10-28', 'Blue')
	;

SELECT actor1.surname, actor2.surname
FROM "Actor" as actor1,
	 "Actor" as actor2
WHERE (actor1.eyecolor = 'Blue'
	  AND actor2.eyecolor = 'Blue'
	  AND actor1.surname != actor2.surname
	  AND actor1.surname < actor2.surname);

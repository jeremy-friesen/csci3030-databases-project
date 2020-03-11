--a)
SELECT AVG(AGE(CURRENT_DATE, birth_date))
From "Actor";
--b)
SELECT COUNT(DISTINCT country)
FROM "Birth_Location"
WHERE actor_id = (
	SELECT actor_id
	FROM "Cast"
	WHERE movie_id = (SELECT movie_id FROM "Movie" WHERE "Movie".movie_name = 'Forrest Gump')
);
--c)
SELECT COUNT(*)
FROM "Actor"
WHERE eyecolor = 'Blue';
--d)
SELECT COUNT(*)
FROM "Movie"
WHERE (SELECT actor_id FROM "Cast" WHERE "Cast".movie_id = "Movie".movie_id)
		= (SELECT actor_id FROM "Actor" WHERE "Actor".first_name = 'Tom' AND "Actor".surname = 'Hanks');
--e)
SELECT "Genre".genre_name,
	MIN("Movie".movie_budget), 
	AVG("Movie".movie_budget), 
	MAX("Movie".movie_budget)
FROM "Genre", "Movie"
WHERE "Movie".movie_id IN 
	(SELECT movie_id
	  FROM "Movie-Genre"
	  WHERE "Movie-Genre".genre_id = "Genre".genre_id)
GROUP BY "Genre".genre_name;
--f)
--couldn't query director eye color, as that wasn't a requirement for part 1
SELECT movie_name, movie_rating
FROM "Movie"
WHERE movie_id IN 
	(SELECT movie_id
	 FROM "Director-Movie"
	 WHERE director_id in
	 	(SELECT director_id
		 FROM "Director"
		 WHERE director_id IN
		 	(SELECT director_id
			 FROM "Birth_Location"
			 WHERE city = 'Brooklyn'
			)
		)
	);
--g)
SELECT *
FROM "Movie"
WHERE movie_id IN
	(SELECT "Cast".actor_id
	 FROM "Cast"
	 WHERE movie_id = "Movie".movie_id
	 AND "Cast".actor_id IN
		(SELECT "Birth_Location".actor_id
		 FROM "Birth_Location"
		 GROUP BY actor_id
		 HAVING COUNT(country) > 1
		)
	)
h)
SELECT movie_name, COUNT(*)
FROM "Movie", "Award"
WHERE "Award".movie_id = "Movie".movie_id
GROUP BY movie_name;
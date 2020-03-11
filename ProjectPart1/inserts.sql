INSERT INTO public."Movie"(
	movie_id, release_date, movie_name, movie_description, movie_budget, movie_rating, gross_profit)
	VALUES (001, DATE '2019-10-04', 'Joker', 'Crazy man shoots people',  55000000, 88, 874500000),
	(002, DATE '1980-06-20', 'The Empire Strikes Back', 'Space Cowboy on the run', 18000000, 87, 181379640),
	(003, DATE '1975-07-31', 'Jaws', 'Shark attack', 7000000, 80, Null),
	(004, DATE '1994-06-23', 'Forrest Gump', 'Tom Hanks sits on a bench', 55000000, 88, 678100000)
	;

-- University / University_Department

INSERT INTO public."University"(
	university_name, num_students, private_university, university_color, description)
	VALUES ('New York University', 51848, True, 'Purple', 'School in New York')
	;

INSERT INTO public."University_Department"(
	department_id, university_name, department_name, num_students)
	VALUES (001, 'New York University', 'Arts', 4102)
	;

INSERT INTO public."University"(
	university_name, num_students, private_university, university_color, description)
	VALUES ('California State University', 31131, False, 'Green', 'School in Sacremento')
	;

INSERT INTO public."University_Department"(
	department_id, university_name, department_name, num_students)
	VALUES (002, 'California State University', 'Arts', 2700)
	;


INSERT INTO public."University"(
	university_name, num_students, private_university, university_color, description)
	VALUES ('Temple University', 40031, False, 'Cherry', 'College in Philadelphia')
	;

INSERT INTO public."University_Department"(
	department_id, university_name, department_name, num_students)
	VALUES (003, 'Temple University', 'Arts', 1550)
	;

INSERT INTO public."Education"(
	education_id, department_id, university_name, major)
	VALUES (001, 001, 'New York University', 'Film'),
	(002, 002, 'California State University', 'Theatre'),
	(003, 003, 'Temple University', 'Music')
	;

-- Actor / Director

INSERT INTO public."Actor"(
	actor_id, education_id, department_id, university_name, first_name, surname, birth_date, eyecolor)
	VALUES (001, Null, Null, Null, 'Joaquin', 'Phoenix', DATE '1974-10-28', 'Blue'),
	(002, 002, 002, 'California State University', 'Tom', 'Hanks', DATE '1956-07-09', 'Purple'),
	(003, Null, Null, Null, 'Mark', 'Hamill', DATE '1951-09-25', Null)
	;

INSERT INTO public."Director"(
	director_id, education_id, department_id, university_name, first_name, surname, birth_year)
	VALUES (001, 001, 001, 'New York University', 'Todd', 'Phillips', 1970),
	(002, 003, 003, 'Temple University', 'Irvin', 'Kershner', 1923),
	(003, Null, Null, Null, 'Steven', 'Spielberg', 1946)
	;

-- Birth Location

INSERT INTO public."Birth_Location"(
	actor_id, director_id, city, state, country)
	VALUES (Null, 001, 'Brooklyn', 'New York', 'United States'),
	(002, Null, 'Concord', 'California', 'United States'),
	(003, Null, 'Oakland', 'California', 'United States')
	;

-- Quote

INSERT INTO public."Quote"(
	movie_id, quote_text, quoted_character)
	VALUES (001, 'I used to think my life was a tragedy, now I know it''s a comedy', 'Joker'),
	(002, 'Would it help if I got out and pushed?', 'Leia'),
	(003, 'We''re gonna need a bigger boat', Null),
	(004, 'Life is like a box of chocolates', 'Forrest Gump');


-- Award

INSERT INTO public."Award"(
	movie_id, actor_id, director_id, award_name, category, description)
	VALUES (001, Null, 001, 'Golden Lion', 'Best Film', 'One of the film industry''s most prestigious and distinguished prizes'),
	(004, 002, Null, 'Academy Award', 'Best Actor', Null),
	(004, Null, Null, 'Academy Award', 'Best Picture', Null);

-- Director-Movie and Cast

INSERT INTO public."Director-Movie"(
	movie_id, director_id)
	VALUES (001, 001),
	(002, 002),
	(003, 003);

INSERT INTO public."Cast"(
	movie_id, actor_id)
	VALUES (001, 001),
	(002, 003),
	(004, 002);


-- Festivals

INSERT INTO public."Festival"(
	festival_name, location)
	VALUES ('Venice Film Festival', 'Venice'),
	('Quebec City Film Festival', 'Quebec'),
	('Gimli Film Festival', 'Gimli');

INSERT INTO public."Movie-Festival"(
	movie_id, festival_name)
	VALUES (001, 'Venice Film Festival'),
	(004, 'Quebec City Film Festival'),
	(003, 'Gimli Film Festival');

-- Genres

INSERT INTO public."Genre"(
	genre_id, description, genre_name)
	VALUES (001, 'thrilling', 'Thriller'),
	(002, 'spooky', 'Horror'),
	(003, 'adventurous', 'Adventure');

INSERT INTO public."Movie-Genre"(
	movie_id, genre_id)
	VALUES (001, 001),
	(002, 003),
	(003, 002);

-- Showtimes / Cinemas

INSERT INTO public."Cinema"(
	cinema_id, cinema_name, location)
	VALUES (001, 'Cineplex Odeon Oshawa Cinemas', 'Oshawa'),
	(002, 'Landmark Cinemas', 'Whitby'),
	(003, 'Cineplex Odeon Ajax Cinemas', 'Ajax');

INSERT INTO public."Showtime"(
	cinema_id, movie_id, tickets_left, ticket_price, cinema_hall, "time", duration)
	VALUES (001, 001, 23, 15, '3D', '8:00', '2:00'),
	(002, 002, 10, 12, 'Regular', '7:00', '2:30'),
	(003, 003, 30, 14, 'IMAX', '6:30', '1:20'),
	(003, 004, 40, 14, 'Regular', '9:00', '1:30');

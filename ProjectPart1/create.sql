/*
Created: 2019-09-26
Modified: 2019-11-01
Model: PostgreSQL 10
Database: PostgreSQL 10
*/


-- Create tables section -------------------------------------------------

-- Table Movie

CREATE TABLE "Movie"(
 "movie_id" Bigint NOT NULL,
 "release_date" Date NOT NULL,
 "movie_name" Character varying NOT NULL,
 "movie_description" Character varying NOT NULL,
 "movie_budget" Bigint NOT NULL,
 "movie_rating" Bigint NOT NULL,
 "gross_profit" Bigint
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Movie

ALTER TABLE "Movie" ADD CONSTRAINT "PK_Movie" PRIMARY KEY ("movie_id")
;

-- Table Actor

CREATE TABLE "Actor"(
 "actor_id" Bigint NOT NULL,
 "education_id" Bigint,
 "department_id" Bigint,
 "university_name" Character varying,
 "first_name" Character varying NOT NULL,
 "surname" Character varying NOT NULL,
 "birth_date" Date NOT NULL,
 "eyecolor" Text
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Actor

CREATE INDEX "IX_Relationship11" ON "Actor" ("education_id","department_id","university_name")
;

-- Add keys for table Actor

ALTER TABLE "Actor" ADD CONSTRAINT "PK_Actor" PRIMARY KEY ("actor_id")
;

-- Table Director

CREATE TABLE "Director"(
 "director_id" Bigint NOT NULL,
 "education_id" Bigint,
 "department_id" Bigint,
 "university_name" Character varying,
 "first_name" Character varying NOT NULL,
 "surname" Character varying NOT NULL,
 "birth_year" Bigint NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Director

CREATE INDEX "IX_Relationship10" ON "Director" ("education_id","department_id","university_name")
;

-- Add keys for table Director

ALTER TABLE "Director" ADD CONSTRAINT "PK_Director" PRIMARY KEY ("director_id")
;

-- Table Birth_Location

CREATE TABLE "Birth_Location"(
 "actor_id" Bigint,
 "director_id" Bigint,
 "city" Character varying NOT NULL,
 "state" Character varying NOT NULL,
 "country" Name NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Birth_Location

CREATE INDEX "IX_Relationship6" ON "Birth_Location" ("director_id")
;

CREATE INDEX "IX_Relationship7" ON "Birth_Location" ("actor_id")
;

-- Table Genre

CREATE TABLE "Genre"(
 "genre_id" Bigint NOT NULL,
 "description" Character varying NOT NULL,
 "genre_name" Character varying NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Genre

ALTER TABLE "Genre" ADD CONSTRAINT "PK_Genre" PRIMARY KEY ("genre_id")
;

-- Table Cast

CREATE TABLE "Cast"(
 "movie_id" Bigint NOT NULL,
 "actor_id" Bigint NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Cast

ALTER TABLE "Cast" ADD CONSTRAINT "PK_Cast" PRIMARY KEY ("actor_id","movie_id")
;

-- Table University

CREATE TABLE "University"(
 "university_name" Character varying NOT NULL,
 "num_students" Bigint NOT NULL,
 "private_university" Boolean NOT NULL,
 "university_color" Character varying NOT NULL,
 "description" Character varying
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table University

ALTER TABLE "University" ADD CONSTRAINT "PK_University" PRIMARY KEY ("university_name")
;

-- Table Education

CREATE TABLE "Education"(
 "education_id" Bigint NOT NULL,
 "department_id" Bigint NOT NULL,
 "university_name" Character varying NOT NULL,
 "major" Character varying NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Education

ALTER TABLE "Education" ADD CONSTRAINT "PK_Education" PRIMARY KEY ("education_id","department_id","university_name")
;

-- Table Award

CREATE TABLE "Award"(
 "movie_id" Bigint NOT NULL,
 "actor_id" Bigint,
 "director_id" Bigint,
 "award_name" Character varying NOT NULL,
 "category" Character varying NOT NULL,
 "description" Character varying
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Award

CREATE INDEX "IX_Relationship23" ON "Award" ("movie_id")
;

CREATE INDEX "IX_Relationship24" ON "Award" ("actor_id")
;

CREATE INDEX "IX_Relationship25" ON "Award" ("director_id")
;

-- Table University_Department

CREATE TABLE "University_Department"(
 "department_id" Bigint NOT NULL,
 "university_name" Character varying NOT NULL,
 "department_name" Character varying NOT NULL,
 "num_students" Bigint NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table University_Department

ALTER TABLE "University_Department" ADD CONSTRAINT "PK_University_Department" PRIMARY KEY ("department_id","university_name")
;

-- Table Movie-Genre

CREATE TABLE "Movie-Genre"(
 "movie_id" Bigint NOT NULL,
 "genre_id" Bigint NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Movie-Genre

ALTER TABLE "Movie-Genre" ADD CONSTRAINT "PK_Movie-Genre" PRIMARY KEY ("movie_id","genre_id")
;

-- Table Cinema

CREATE TABLE "Cinema"(
 "cinema_id" Bigint NOT NULL,
 "cinema_name" Character varying NOT NULL,
 "location" Character varying NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Cinema

ALTER TABLE "Cinema" ADD CONSTRAINT "PK_Cinema" PRIMARY KEY ("cinema_id")
;

-- Table Showtime

CREATE TABLE "Showtime"(
 "cinema_id" Bigint NOT NULL,
 "movie_id" Bigint NOT NULL,
 "tickets_left" Bigint NOT NULL,
 "ticket_price" Bigint NOT NULL,
 "cinema_hall" Character varying NOT NULL,
 "time" Time NOT NULL,
 "duration" Time NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Showtime

CREATE INDEX "IX_Relationship20" ON "Showtime" ("cinema_id")
;

CREATE INDEX "IX_Relationship21" ON "Showtime" ("movie_id")
;

-- Table Quote

CREATE TABLE "Quote"(
 "movie_id" Bigint NOT NULL,
 "quote_text" Character varying NOT NULL,
 "quoted_character" Character varying
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Quote

CREATE INDEX "IX_Relationship22" ON "Quote" ("movie_id")
;

-- Table Festival

CREATE TABLE "Festival"(
 "festival_name" Character varying NOT NULL,
 "location" Character varying NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Festival

ALTER TABLE "Festival" ADD CONSTRAINT "PK_Festival" PRIMARY KEY ("festival_name")
;

-- Table Movie-Festival

CREATE TABLE "Movie-Festival"(
 "movie_id" Bigint NOT NULL,
 "festival_name" Character varying NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Movie-Festival

ALTER TABLE "Movie-Festival" ADD CONSTRAINT "PK_Movie-Festival" PRIMARY KEY ("movie_id","festival_name")
;

-- Table Director-Movie

CREATE TABLE "Director-Movie"(
 "movie_id" Bigint NOT NULL,
 "director_id" Bigint NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Director-Movie

ALTER TABLE "Director-Movie" ADD CONSTRAINT "PK_Director-Movie" PRIMARY KEY ("movie_id","director_id")
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Birth_Location" ADD CONSTRAINT "Born At1" FOREIGN KEY ("director_id") REFERENCES "Director" ("director_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Birth_Location" ADD CONSTRAINT "Born At" FOREIGN KEY ("actor_id") REFERENCES "Actor" ("actor_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Cast" ADD CONSTRAINT "Is Acted By" FOREIGN KEY ("movie_id") REFERENCES "Movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Cast" ADD CONSTRAINT "Acts In" FOREIGN KEY ("actor_id") REFERENCES "Actor" ("actor_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Director" ADD CONSTRAINT "EducatedAt1" FOREIGN KEY ("education_id", "department_id", "university_name") REFERENCES "Education" ("education_id", "department_id", "university_name") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Actor" ADD CONSTRAINT "Educated At" FOREIGN KEY ("education_id", "department_id", "university_name") REFERENCES "Education" ("education_id", "department_id", "university_name") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "University_Department" ADD CONSTRAINT "At1" FOREIGN KEY ("university_name") REFERENCES "University" ("university_name") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Education" ADD CONSTRAINT "At" FOREIGN KEY ("department_id", "university_name") REFERENCES "University_Department" ("department_id", "university_name") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Movie-Genre" ADD CONSTRAINT "Has Genre" FOREIGN KEY ("movie_id") REFERENCES "Movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Movie-Genre" ADD CONSTRAINT "Has Movie" FOREIGN KEY ("genre_id") REFERENCES "Genre" ("genre_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Showtime" ADD CONSTRAINT "At2" FOREIGN KEY ("cinema_id") REFERENCES "Cinema" ("cinema_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Showtime" ADD CONSTRAINT "Played At1" FOREIGN KEY ("movie_id") REFERENCES "Movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Quote" ADD CONSTRAINT "Has Quote" FOREIGN KEY ("movie_id") REFERENCES "Movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Award" ADD CONSTRAINT "Wins" FOREIGN KEY ("movie_id") REFERENCES "Movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Award" ADD CONSTRAINT "Wins1" FOREIGN KEY ("actor_id") REFERENCES "Actor" ("actor_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Award" ADD CONSTRAINT "Wins2" FOREIGN KEY ("director_id") REFERENCES "Director" ("director_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Movie-Festival" ADD CONSTRAINT "Played At" FOREIGN KEY ("movie_id") REFERENCES "Movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Movie-Festival" ADD CONSTRAINT "Plays" FOREIGN KEY ("festival_name") REFERENCES "Festival" ("festival_name") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Director-Movie" ADD CONSTRAINT "Directed By" FOREIGN KEY ("movie_id") REFERENCES "Movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Director-Movie" ADD CONSTRAINT "Directs" FOREIGN KEY ("director_id") REFERENCES "Director" ("director_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

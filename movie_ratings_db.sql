-- STEP 1: DROP TABLES
DROP TABLE IF EXISTS public.ratings;
DROP TABLE IF EXISTS public.movies;
DROP TABLE IF EXISTS public.reviewers;

-- STEP 2: CREATE TABLES
CREATE TABLE IF NOT EXISTS public.movies
(
    movie_id integer NOT NULL,
    title text COLLATE pg_catalog."default",
    CONSTRAINT movies_pkey PRIMARY KEY (movie_id)
);

CREATE TABLE IF NOT EXISTS public.reviewers
(
    reviewer_id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    CONSTRAINT reviewers_pkey PRIMARY KEY (reviewer_id)
);

CREATE TABLE IF NOT EXISTS public.ratings
(
    reviewer_id integer,
    movie_id integer,
    rating integer,
    CONSTRAINT ratings_movie_id_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (movie_id),
    CONSTRAINT ratings_reviewer_id_fkey FOREIGN KEY (reviewer_id)
        REFERENCES public.reviewers (reviewer_id)
);

-- STEP 3: INSERT YOUR DATA
-- Replace these examples with your actual 6 movies and 5 reviewers
INSERT INTO public.movies (movie_id, title) VALUES 
(1, 'Sinners'), 
(2, 'Wicked For Good'),
(3, 'Zootopia 2'),
(4, 'Send Help'),
(5, 'Minecraft'),
(6, 'Avatar');

INSERT INTO public.reviewers (reviewer_id, name) VALUES 
(1, 'Boog'), 
(2, 'Kenzie'), 
(3, 'Maddy'), 
(4, 'Rah'), 
(5, 'Ci');

-- Add your ratings here (Reviewer ID, Movie ID, Rating)
INSERT INTO public.ratings (reviewer_id, movie_id, rating) VALUES 
(1, 1, 5), (1, 3, 2), (1, 4, 1), (1, 5, 3), (1, 6, 5), (2, 2, 4), (2, 5, 3), (3, 1, 5), (3, 2, 5), (3, 4, 1), (3, 6, 2), (4, 1, 4), (4, 2, 3), (4, 3, 3), (4, 5, 1), (4, 6, 5), (5, 1, 5), (5, 2, 5), (5, 3, 3), (5, 5, 3); 

-- STEP 4: FINAL QUERY
SELECT r.name AS reviewer, m.title AS movie, rt.rating
FROM ratings rt
JOIN reviewers r ON rt.reviewer_id = r.reviewer_id
JOIN movies m ON rt.movie_id = m.movie_id
ORDER BY r.name;
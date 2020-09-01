-- Test query!!

-- SELECT * FROM users;

-- SELECT movies.title, directors.name FROM movies
-- JOIN directors ON directors.director_id = movies.director_id;


-- SELECT users.name, movies.title FROM users
-- JOIN users_movies ON users_movies.user_id = users.user_id
-- JOIN movies ON movies.movie_id = users_movies.movie_id;

-- SELECT movies.title AS movie_title, COUNT(users_movies.movie_id) AS favorites_count
-- FROM movies 
-- JOIN users_movies ON movies.movie_id = users_movies.movie_id
-- GROUP BY movies.title, users_movies.movie_id
-- ORDER BY favorites_count DESC;

SELECT directors.name, COUNT(movies.title)
FROM directors
    JOIN movies ON movies.director_id=directors.director_id
    JOIN users_movies ON users_movies.movie_id=movies.movie_id
GROUP BY directors.name
ORDER BY COUNT(movies.title) DESC;
SELECT users.name AS user_name, directors.name AS director_name, COUNT(movies.title)
  FROM users
  JOIN users_movies ON users_movies.user_id=users.user_id
  JOIN movies ON users_movies.movie_id=movies.movie_id
  JOIN directors ON movies.director_id=directors.director_id
  GROUP BY directors.name, users.name
  ORDER BY COUNT(movies.title) DESC;
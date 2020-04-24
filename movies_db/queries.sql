-- Test query!!

SELECT * FROM users;

-- List all the movie titles and their corresponding directors.
SELECT movies.title, directors.name FROM movies
JOIN directors ON directors.director_id = movies.director_id;

-- Select the movie title and user name for all of the "favorites" represented by the users_movies table.
SELECT movies.title, users.name FROM movies
JOIN users_movies ON users_movies.movie_id = movies.movie_id
JOIN users ON users_movies.user_id = users.user_id;

-- List the movies with the number of favorites they have.
SELECT movies.title, COUNT(users.name) FROM movies
JOIN users_movies ON users_movies.movie_id = movies.movie_id
JOIN users ON users_movies.user_id = users.user_id
GROUP BY movies.title;

-- List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT directors.name, COUNT(users.name) FROM movies
JOIN users_movies ON users_movies.movie_id = movies.movie_id
JOIN users ON users_movies.user_id = users.user_id
JOIN directors ON directors.director_id = movies.director_id
GROUP BY directors.name
ORDER BY COUNT(users.name) DESC;

-- List the user name, director name and favorite count of all of the user/director combinations (based on the users_movies table).
SELECT directors.name, COUNT(users.name) FROM movies
JOIN users_movies ON users_movies.movie_id = movies.movie_id
JOIN users ON users_movies.user_id = users.user_id
JOIN directors ON directors.director_id = movies.director_id;
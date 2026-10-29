-- Query 1
SELECT a.name AS actor_name, COUNT(*) AS appearances
FROM actors a
JOIN (
    SELECT actor_id FROM movie_actors
    UNION ALL
    SELECT actor_id FROM series_actors
) AS all_appearances ON a.actor_id = all_appearances.actor_id
GROUP BY a.name
ORDER BY appearances DESC
LIMIT 1;

-- Query 2
SELECT d.name AS director_name, AVG(rating) AS avg_rating
FROM directors d
JOIN (
    SELECT md.director_id, m.imdb_rating AS rating FROM movie_directors md JOIN movies m ON md.movie_id = m.movie_id
    UNION ALL
    SELECT sd.director_id, s.imdb_rating AS rating FROM series_directors sd JOIN series s ON sd.series_id = s.series_id
) AS all_projects ON d.director_id = all_projects.director_id
WHERE d.director_id IN (SELECT director_id FROM movie_directors UNION SELECT director_id FROM series_directors)
GROUP BY d.name
HAVING COUNT(*) > 1 
ORDER BY avg_rating DESC;

-- Query 3
SELECT FLOOR(m.release_year / 10) * 10 AS decade, SUM(mf.box_office_gross) AS total_revenue
FROM movies m
JOIN movie_finances mf ON m.movie_id = mf.movie_id
WHERE m.release_year > 1970
GROUP BY decade
ORDER BY decade;

-- Query 4
SELECT s.name AS studio_name, SUM(mf.box_office_gross - mf.budget) AS total_profit
FROM studios s
JOIN movie_finances mf ON s.studio_id = mf.studio_id
GROUP BY s.name
HAVING SUM(mf.box_office_gross - mf.budget) > 0
ORDER BY total_profit DESC
LIMIT 1;

-- Query 5
SELECT m.title, (mf.box_office_gross - mf.budget) AS profitability
FROM movies m
JOIN movie_finances mf ON m.movie_id = mf.movie_id
WHERE (mf.box_office_gross - mf.budget) > 0
ORDER BY profitability DESC;
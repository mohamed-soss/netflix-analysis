-- Query 1: Calculate the percentage of each year out of all United States content
SELECT 
    YEAR(CAST(date_added AS DATE)) AS year,
    COUNT(*) AS total,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS percentage
FROM netflix
WHERE country LIKE '%United States%' AND date_added IS NOT NULL
GROUP BY YEAR(CAST(date_added AS DATE))
ORDER BY year DESC;

-- Query 2: Classify Netflix content as "bad" or "good" based on keywords in the description
SELECT *
FROM netflix
WHERE description LIKE '%bad%' OR description LIKE '%good%';

-- Query 3: Select all movies that are Documentaries
SELECT *
FROM netflix
WHERE listed_in LIKE '%Documentaries%';

-- Query 4: Select all content without a director
SELECT *
FROM netflix
WHERE director IS NULL;

-- Query 5: Content for actor Adam Sandler released in the last 10 years
SELECT *
FROM netflix
WHERE cast LIKE '%Adam Sandler%' AND date_added >= DATEADD(year, -10, GETDATE());

-- Query 6: Top 10 most frequently appearing actors in U.S. movies
WITH top_actors AS (
    SELECT 
        show_id,
        COUNT(*) AS show_count
    FROM netflix
    CROSS APPLY STRING_SPLIT(cast, ',')
    WHERE type = 'Movie' AND country LIKE '%United States%'
    GROUP BY show_id
)
SELECT TOP 10 *
FROM top_actors
ORDER BY show_count DESC;

-- Query 7: Most common rating for movie and TV
SELECT 
    type,
    rating,
    COUNT(*) AS count,
    RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
FROM netflix
GROUP BY type, rating
HAVING RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) = 1;

-- Query 8: Movies released in 2021
SELECT *
FROM netflix
WHERE release_year = 2021 AND type = 'Movie';

-- Query 9: Top 5 countries that have content on Netflix
SELECT TOP 5
    country,
    COUNT(show_id) AS show_count
FROM netflix
CROSS APPLY STRING_SPLIT(country, ',')
GROUP BY country
ORDER BY COUNT(show_id) DESC;

-- Query 10: Longest movie duration
SELECT 
    type,
    MAX(CAST(PARSENAME(REPLACE(duration, ' ', '.'), 2) AS INT)) AS duration
FROM netflix
WHERE type = 'Movie'
GROUP BY type;

-- Query 11: Content added in the last 5 years
SELECT *
FROM netflix
WHERE date_added >= DATEADD(year, -5, GETDATE());

-- Query 12: Retrieve the number of titles each director has created per content type
SELECT 
    director,
    type,
    COUNT(type) AS content_number
FROM netflix
WHERE director IS NOT NULL
GROUP BY type, director
ORDER BY COUNT(type) DESC;

-- Query 13: Show the content that Rajiv Chilaka had made
SELECT *
FROM netflix
WHERE director LIKE '%Rajiv Chilaka%';

-- Query 14: All TV shows that have greater than or equal to 5 seasons
SELECT *
FROM netflix
WHERE type = 'TV Show' AND CAST(PARSENAME(REPLACE(duration, ' ', '.'), 2) AS INT) >= 5;

-- Query 15: Number of content items in each genre
SELECT 
    listed_in,
    COUNT(show_id) AS show_count
FROM netflix
CROSS APPLY STRING_SPLIT(listed_in, ',')
GROUP BY listed_in
ORDER BY COUNT(show_id) DESC;

-- Query 16: Count how many were added each year, and calculate the percentage
SELECT 
    YEAR(CAST(date_added AS DATE)) AS year,
    COUNT(*) AS total,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS percentage
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY YEAR(CAST(date_added AS DATE))
ORDER BY year DESC;

USE albums_db;

show tables;
Describe albums;

SELECT COUNT(*) FROM albums;

-- 3a.  there are 31 rows in the table

SELECT Distinct (artist) FROM albums;
-- 3b. there are 23 unique artists 

Describe albums;
-- 3c. The primary key is the ID field

select * from albums ORDER BY release_date ASC;
-- 3d. The oldest release date was 1967. The newest release date was 2011

select artist, name
from albums
where artist = 'pink floyd';

-- 4a. the dark side of the moon, the wall

select name, release_date from albums;

-- 4b. 1967

select genre, name
from albums
where name = 'Nevermind';

-- 4c. grunge, alternative rock 

select release_date, name
from albums
where release_date BETWEEN '1990'AND '1999';
-- -- 4d. The Bodyguard, jagged little pill, come on over, falling into you, let's talk about love, dangerous, the immaculate collection, Titanic: music from the motion picture
-- metallica, nevermind, supernatural

select name,sales from albums where sales >=20;
-- 4e. Thriller, Back in black, the dark side of the moon, bat out of hell, the bodybuard, the greatest hits, saturday night fever, rumours, led zepp, jagged little pill, come on over, falling into you, hotel california, 21, 1, metallica, supernatural, appetite for destruction.alter

Select name, genre From albums WHERE genre = 'Rock' or genre LIKE 'Rock, %' or genre LIKE '%,Rock,%' or genre LIKE '%,Rock';

 -- 4f. Their greatest hits, sgt peppers, hotel california, 1, dangerous, abbey road, born in the usa, brothers in arms, supernatural 
 

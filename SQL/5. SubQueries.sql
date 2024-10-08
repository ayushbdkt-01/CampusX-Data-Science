-- sql subqueries
use campusx_2;
select * from movies;



-- find the movie with maxProfit
select * from movies
where gross-budget= (select max(gross-budget) from movies);

select * from movies
order by (gross-budget) desc
limit 1;

-- SCALAR SUBQUERIES
-- find number of movies having rating > avgRating
select count(*) from movies
where score > (select avg(score) from movies);

-- find the highest rated movie of year 2000
select * from movies 
where year=2000 and score= (select max(score) from movies where year = 2000);

-- find the movies where the no. of votes > avg no. of votes
select * from movies
where score= (select max(score) from movies where votes > (select avg(votes) from movies));






-- ROW SUBQUERIES
select * from orders;
select * from food;
select * from delivery_partner;
select * from users;
select* from movies;

-- find users which didn't placed an order
select * from users
where user_id not in (select distinct(user_id) from orders);


-- find movies made by top 3 directors based on gross income
with top_directors as (select director from movies
					group by director
					order by sum(gross) desc
					limit 3)
select * from movies 
where director in  (select * from top_directors);


-- find movies of actors whose avgRating>8.5 (take 25000 votes as cutoff)
select * from movies 
where star in (select star from movies
				where votes>25000
				group by star having avg(score)>8.5 and votes>25000);
                
                
-- TABLE SUBQUERIES

-- find most profitable movie of each year
 
                
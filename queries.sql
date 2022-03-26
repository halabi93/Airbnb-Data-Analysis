select * from communities;
select * from listing;
select * from airbnb_loc;
select * from population;

--Number of listings per neighborhood
select neighborhood, count(neighborhood) as listing_count
from airbnb_loc
group by neighborhood
order by count(neighborhood) DESC;

--Simple join for population, neighborhood, and listing address
select population.population, airbnb_loc.neighborhood, airbnb_loc.address
from airbnb_loc
inner join population
	on airbnb_loc.neighborhood = population.neighborhood;

--Number of listings, population per neighborhood
select population.population, airbnb_loc.neighborhood
from airbnb_loc
inner join population
	on airbnb_loc.neighborhood = population.neighborhood
group by airbnb_loc.neighborhood, population.population;

--Number of "recently" reviewed listings per neighborhood
select airbnb_loc.neighborhood, count(airbnb_loc.neighborhood) as listing_count
from airbnb_loc
inner join listing
	on airbnb_loc."id" = listing."id"
where date_part('year', listing.last_review) >= 2020
group by neighborhood
order by count(neighborhood) DESC;

--Number of frequently reviewed listings per neighborhood
select airbnb_loc.neighborhood, count(airbnb_loc.neighborhood) as listing_count
from airbnb_loc
inner join listing
	on airbnb_loc."id" = listing."id"
where listing.number_of_reviews >= 100
group by neighborhood
order by count(neighborhood) DESC;

--Inexpensive room, frequently/recently reviewed
select airbnb_loc.neighborhood, count(airbnb_loc.neighborhood) as listing_count
from airbnb_loc
inner join listing
	on airbnb_loc."id" = listing."id"
inner join population
	on airbnb_loc.neighborhood = population.neighborhood 
where CAST(listing.price as decimal) <= 100
	and listing.number_of_reviews >= 100 
	and date_part('year', listing.last_review) >= 2020
	and population.population >=50000
	and CAST(population.income as decimal) >= 50000
group by airbnb_loc.neighborhood
order by count(airbnb_loc.neighborhood) DESC;





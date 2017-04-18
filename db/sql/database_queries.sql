
#returns a table of EFI
select r.title, c.name, i.economic_freedom_index, i.corruption_perception_index, y.year
from countries c
inner join regions r on r.id = c.region_id
inner join indicators i on i.country_id = c.id
inner join years y on y.id = i.year_id
order by c.name;

#query by average by region

#query

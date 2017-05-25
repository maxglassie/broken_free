
#returns a table of EFI
select r.title, c.name, i.economic_freedom_index, i.corruption_perception_index, y.year
from countries c
inner join regions r on r.id = c.region_id
inner join indicators i on i.country_id = c.id
inner join years y on y.id = i.year_id
order by c.name;

#query by average by region
select r.title, avg(i.economic_freedom_index) as avg_efi, avg(i.corruption_perception_index) as avg_cpi, y.year
from regions r
inner join countries c on r.id = c.region_id
inner join indicators i on i.country_id = c.id
inner join years y on y.id = i.year_id
group by r.title, y.year
order by r.title, y.year DESC;

#avg for region for year
select r.title, avg(i.economic_freedom_index) as avg_efi, avg(i.corruption_perception_index) as avg_cpi, y.year
from regions r
inner join countries c on r.id = c.region_id
inner join indicators i on i.country_id = c.id
inner join years y on y.id = i.year_id
group by r.title, y.year
having y.year = '2016'
order by r.title, y.year DESC;

#highest CPI in South America
select c.name, i.economic_freedom_index, i.corruption_perception_index, y.year
from regions r
inner join countries c on r.id = c.region_id
inner join indicators i on i.country_id = c.id
inner join years y on y.id = i.year_id
where r.title = 'East Asia & Pacific'
  and y.year = '2016'
  and i.corruption_perception_index IS NOT NULL
order by i.corruption_perception_index ASC;


#EFI ranking for in a year

select p.publisher_name, s.series_name from publisher_series as ps
left outer join publisher as p ON ps.publisher_id = p.publisher_id
left outer join series as s ON ps.series_id = s.series_id;

select s.series_name from publisher_series as ps
left join publisher as p ON ps.publisher_id = p.publisher_id
left join series as s ON ps.series_id = s.series_id
where p.publisher_id=1;
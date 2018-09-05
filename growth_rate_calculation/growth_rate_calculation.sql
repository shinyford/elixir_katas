-- Assuming we have a Postgres db with a `posts` table
-- with at least a `date`
-- column, the following query should provide the answer

select
	a.month_start::date as date,
	a.number as count,
	to_char(100.0 * (a.number - b.number) / a.number, '999D9%') as percent_growth
from
	(select date_trunc('month', date) as month_start, cast(count(id) as float) as number from posts group by month_start) a
left join
	(select date_trunc('month', date) as month_start, cast(count(id) as float) as number from posts group by month_start) b
on
	b.month_start = a.month_start - '1 month'::interval
order by
	date asc
;

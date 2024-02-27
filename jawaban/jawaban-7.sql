with t1 as (
select x as x1,y as y1
from xy
where x<y
)
,t2 as (
select x as x2,y as y2
from xy
where x>y
)
select t1.x1 as x, t1.y1 as y
from t1
inner join t2
on t1.x1 = t2.y2 and t1.y1 = t2.x2
order by t1.x1 asc,t1.y1 asc;

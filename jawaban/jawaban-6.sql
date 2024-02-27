select 
	distinct n.node as node,
	case
		when node not in (select parent from nodes where parent is not null) then 'Daun'
		when parent is null then 'Akar'
		else 'Batang'
	end as position
from nodes n
order by node;

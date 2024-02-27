select td.no_do as no_do, mc.nama_customer as nama_customer, td.tgl_do as tgl_do, str_to_date('2018-02-01','%Y-%m-%d') as date_measurement, datediff(str_to_date('2018-02-01','%Y-%m-%d'),tgl_do) as aging
from (
select td.no_entry_do, ti.no_inv 
from tr_do td 
left join tr_inv ti 
on td.no_entry_do = ti.no_entry_do 
where ti.no_inv is null
) as t_liability
inner join tr_do td 
on t_liability.no_entry_do = td.no_entry_do
inner join tr_so ts
on td.no_entry_so = ts.no_entry_so 
inner join ms_customer mc 
on ts.kode_customer = mc.kode_customer 
order by aging desc, no_do asc;
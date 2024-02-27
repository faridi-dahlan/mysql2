select 	mp.nama_pegawai as nama_pegawai , 
		count(distinct ts.no_so) as jumlah_so,
		mp.target as target, 
		case
			when mp.target < count(distinct ts.no_so) then 'tidak'
			when mp.target = count(distinct ts.no_so) then 'tidak'
			else 'ya'
		end as kurang_dari_target
from tr_so ts 
inner join ms_pegawai mp 
on ts.kode_sales = mp.kode_pegawai
where ts.tgl_so <= str_to_date('2018-01-31','%Y-%m-%d')
group by nama_pegawai,target 
order by nama_pegawai asc;
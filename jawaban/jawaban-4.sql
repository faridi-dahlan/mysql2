select 	mp.nama_product as nama_product,
		sum(
			case 
				when ts.satuan = 'krat' then ts.qty*24
				when ts.satuan = 'dus' then ts.qty*30
				else qty
			end
		) as qty
from tr_so ts 
inner join ms_product mp 
on ts.kode_barang = mp.kode_produk
group by nama_product
order by qty desc, nama_product asc
limit 3
;
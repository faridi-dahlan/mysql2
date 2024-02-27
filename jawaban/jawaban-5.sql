select 	mv.vendor as vendor,
		sum(
			case 
				when ts.satuan = 'krat' then ts.qty*24*mp.harga_satuan 
				when ts.satuan = 'dus' then ts.qty*30*mp.harga_satuan
				else ts.qty*mp.harga_satuan 
			end	
		) as amount
from ms_vendor mv 
inner join ms_product mp 
on mv.kode_vendor = mp.kode_vendor 
inner join tr_so ts 
on ts.kode_barang = mp.kode_produk
inner join tr_do td 
on td.no_entry_so = ts.no_entry_so
inner join tr_inv ti 
on ti.no_entry_do = td.no_entry_do
group by vendor
order by amount desc
limit 3;
select t_qty.no_do,t_qty.kode_customer,t_qty.tgl_do,t_qty.qty,(t_qty.qty*t_qty.harga_satuan+(0.1*t_qty.qty*t_qty.harga_satuan)+mc.ongkos_kirim) as amount
from (
select td.no_do as no_do, 
	   ts.kode_customer as kode_customer, 
	   td.tgl_do as tgl_do, 
	   case
	   	when ts.satuan = 'krat' then ts.qty*24
	   	when ts.satuan = 'dus' then ts.qty*30
	   	else ts.qty*1
	   end as qty,
	   mp.harga_satuan as harga_satuan
from tr_do td 
inner join tr_so ts 
on td.no_entry_so = ts.no_entry_so 
inner join ms_product mp 
on ts.kode_barang = mp.kode_produk
order by no_do asc
) as t_qty
inner join ms_customer mc
on t_qty.kode_customer = mc.kode_customer;
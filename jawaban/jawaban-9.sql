select tabel_people.nama1 as nama1, tabel_people.nama2 as nama2, tabel_people.selisih 
from (
select tabel_orang1.nama as nama1,tabel_orang1.umur,tabel_orang2.nama as nama2,tabel_orang2.umur_2,(tabel_orang1.umur-tabel_orang2.umur_2) as selisih
from (select p.nama, datediff(p.tanggal_registrasi,p.tanggal_lahir) as umur from people p) as tabel_orang1
cross join (select p2.nama, datediff(p2.tanggal_registrasi,p2.tanggal_lahir) as umur_2 from people p2) as tabel_orang2
on tabel_orang1.nama != tabel_orang2.nama
where (tabel_orang1.umur-tabel_orang2.umur_2) >= 0
order by selisih
) as tabel_people
limit 1; 

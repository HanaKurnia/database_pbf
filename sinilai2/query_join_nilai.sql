SELECT 
    n.kode_matkul as "Kode Mata Kuliah", 
    mk.nama_matkul as "Nama Mata Kuliah", 
    mk.sks as "Jumlah SKS", 
    n.nilai_akhir as "Nilai", 
    n.status as "Status Kelulusan"
FROM nilai n
JOIN mahasiswa m ON n.npm = m.npm
JOIN mata_kuliah mk ON n.kode_matkul = mk.kode_matkul;
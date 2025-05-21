CREATE VIEW v_nilai_mahasiswa AS
SELECT 
    n.kode_matkul AS "Kode Mata Kuliah", 
    mk.nama_matkul AS "Nama Mata Kuliah", 
    mk.sks AS "Jumlah SKS", 
    n.nilai_akhir AS "Nilai", 
    n.status AS "Status Kelulusan"
FROM nilai n
JOIN mahasiswa m ON n.npm = m.npm
JOIN mata_kuliah mk ON n.kode_matkul = mk.kode_matkul;

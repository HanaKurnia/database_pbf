CREATE OR REPLACE VIEW v_nilai AS
SELECT 
    n.id_nilai, 
    m.npm, 
    m.nama_mhs AS nama_mhs, 
    mk.kode_matkul, 
    mk.nama_matkul, 
    d.nidn, 
    d.nama_dosen AS nama_dosen, 
    mk.semester,
    n.nilai_akhir 
FROM nilai n
JOIN mahasiswa m ON n.npm = m.npm
JOIN mata_kuliah mk ON n.kode_matkul = mk.kode_matkul
JOIN dosen d ON n.nidn = d.nidn;
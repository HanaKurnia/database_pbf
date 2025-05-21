SELECT 
    n.npm, 
    m.nama_mhs, 
    n.kode_matkul, 
    mk.nama_matkul, 
    d.nidn, 
    d.nama_dosen, 
    n.tugas, 
    n.uts, 
    n.uas, 
    n.nilai_akhir, 
    n.status
FROM nilai n
JOIN mahasiswa m ON n.npm = m.npm
JOIN mata_kuliah mk ON n.kode_matkul = mk.kode_matkul
JOIN dosen d ON n.nidn = d.nidn;

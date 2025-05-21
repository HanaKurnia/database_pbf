SELECT 
    n.kode_matkul,
    mk.nama_matkul,
    k.nama_kelas,
    mhs.nama_mhs,
    n.nilai_akhir,
    n.status
FROM nilai n
JOIN mata_kuliah mk ON n.kode_matkul = mk.kode_matkul
JOIN mahasiswa mhs ON n.npm = mhs.npm
JOIN kelas k ON mhs.kode_kelas = k.kode_kelas
WHERE mhs.nama_mhs = 'Siti Aisyah';

CREATE VIEW v_mahasiswa_prodi AS
SELECT DISTINCT
    m.npm, 
    m.nama_mhs, 
    m.kode_kelas, 
    p.id_prodi, 
    p.nama_prodi
FROM mahasiswa m
JOIN prodi p ON m.id_prodi = p.id_prodi
JOIN kelas k ON m.kode_kelas = k.kode_kelas
ORDER BY m.npm;

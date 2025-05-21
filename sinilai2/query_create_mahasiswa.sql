CREATE TABLE mahasiswa (
    npm VARCHAR(15) PRIMARY KEY,
    nama_mhs VARCHAR(100) NOT NULL,
    kode_kelas VARCHAR(10),
    id_prodi INT,
    FOREIGN KEY (kode_kelas) REFERENCES kelas(kode_kelas) ON DELETE SET NULL,
    FOREIGN KEY (id_prodi) REFERENCES prodi(id_prodi) ON DELETE SET NULL
);

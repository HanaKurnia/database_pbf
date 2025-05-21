CREATE TABLE mata_kuliah (
    kode_matkul VARCHAR(10) PRIMARY KEY,
    nama_matkul VARCHAR(100) NOT NULL,
    semester INT NOT NULL,
    sks INT NOT NULL CHECK (sks > 0)
);

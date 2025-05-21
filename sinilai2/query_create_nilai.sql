CREATE TABLE nilai (
    id_nilai INT AUTO_INCREMENT PRIMARY KEY,
    npm VARCHAR(15),
    kode_matkul VARCHAR(10),
    nidn VARCHAR(20),
    tugas FLOAT CHECK (tugas BETWEEN 0 AND 100),
    uts FLOAT CHECK (uts BETWEEN 0 AND 100),
    uas FLOAT CHECK (uas BETWEEN 0 AND 100),
    nilai_akhir CHAR(1) CHECK (nilai_akhir IN ('A', 'B', 'C', 'D', 'E')),
    status ENUM('Lulus', 'Tidak Lulus') DEFAULT 'Tidak Lulus',
    FOREIGN KEY (npm) REFERENCES mahasiswa(npm) ON DELETE CASCADE,
    FOREIGN KEY (kode_matkul) REFERENCES mata_kuliah(kode_matkul) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nidn) REFERENCES dosen(nidn) ON DELETE SET NULL,
    CONSTRAINT unique_mhs UNIQUE (npm, kode_matkul, nidn)
);

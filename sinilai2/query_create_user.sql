CREATE TABLE user (
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) PRIMARY KEY,
    role ENUM('dosen', 'mahasiswa') NOT NULL DEFAULT 'mahasiswa'
);

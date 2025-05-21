-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2025 at 03:45 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sinilai2`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nidn` varchar(20) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nidn`, `nama_dosen`) VALUES
('101001', 'Surya Saputra, M.Kom.'),
('101002', 'Andika Wijaya, S.T., M.T.'),
('101003', 'Siti Nur Aisyah, M.Sc.'),
('101004', 'Budi Santoso, M.Kom.'),
('101005', 'Dewi Lestari, M.Pd.');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` varchar(10) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `nama_kelas`) VALUES
('KLS01', 'TI A'),
('KLS02', 'TM B'),
('KLS03', 'MM A'),
('KLS04', 'AK A'),
('KLS05', 'TE A');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` varchar(15) NOT NULL,
  `nama_mhs` varchar(100) NOT NULL,
  `kode_kelas` varchar(10) DEFAULT NULL,
  `id_prodi` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama_mhs`, `kode_kelas`, `id_prodi`) VALUES
('220001', 'Andi Wijaya', 'KLS01', 1),
('220002', 'Siti Aisyah', 'KLS02', 2),
('220003', 'Budi Santoso', 'KLS03', 3),
('220004', 'Dewi Lesari', 'KLS04', 4),
('220005', 'Rizky Hidayat', 'KLS05', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_matkul` varchar(10) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL,
  `semester` int NOT NULL,
  `sks` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_matkul`, `nama_matkul`, `semester`, `sks`) VALUES
('AK101', 'Akuntansi Dasar', 1, 2),
('AK102', 'Akuntansi Keuangan', 3, 2),
('AK103', 'Audit dan Perpajakan', 1, 3),
('MM101', 'Desain Grafis', 3, 2),
('MM102', 'Animasi Digital', 3, 2),
('MM103', 'Editing Video', 4, 2),
('TE101', 'Rangkaian Listrik', 2, 2),
('TE102', 'Sistem Kendali', 3, 3),
('TE103', 'Elektronika Analog', 3, 2),
('TI101', 'Algoritma dan Pemrograman', 1, 2),
('TI102', 'Struktur Data', 2, 2),
('TI103', 'Basis Data', 2, 2),
('TM101', 'Dasar Teknik Mesin', 2, 2),
('TM102', 'Mekanika Teknik', 2, 3),
('TM103', 'Termodinamika', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int NOT NULL,
  `npm` varchar(15) DEFAULT NULL,
  `kode_matkul` varchar(10) DEFAULT NULL,
  `nidn` varchar(20) DEFAULT NULL,
  `tugas` float DEFAULT NULL,
  `uts` float DEFAULT NULL,
  `uas` float DEFAULT NULL,
  `nilai_akhir` float DEFAULT NULL,
  `status` enum('Lulus','Tidak Lulus') DEFAULT 'Tidak Lulus'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `npm`, `kode_matkul`, `nidn`, `tugas`, `uts`, `uas`, `nilai_akhir`, `status`) VALUES
(1, '220001', 'TI102', '101001', 80, 85, 90, 85, 'Lulus'),
(2, '220001', 'TI103', '101001', 70, 75, 80, 75, 'Lulus'),
(3, '220002', 'TM101', '101002', 75, 80, 85, 80, 'Lulus'),
(4, '220002', 'TM102', '101002', 65, 60, 70, 65, 'Lulus'),
(5, '220003', 'MM101', '101003', 60, 55, 70, 61.6667, 'Lulus'),
(6, '220003', 'MM102', '101003', 75, 80, 78, 77.6667, 'Lulus'),
(7, '220004', 'AK101', '101004', 88, 85, 90, 87.6667, 'Lulus'),
(8, '220004', 'AK103', '101004', 50, 55, 60, 55, 'Lulus'),
(9, '220005', 'TE102', '101005', 70, 75, 80, 75, 'Lulus'),
(10, '220005', 'TE103', '101005', 85, 90, 88, 87.6667, 'Lulus'),
(11, '220001', 'TM102', '101001', 30, 25, 50, 35, 'Tidak Lulus');

--
-- Triggers `nilai`
--
DELIMITER $$
CREATE TRIGGER `hitung_nilai_akhir` BEFORE INSERT ON `nilai` FOR EACH ROW BEGIN
    -- Hitung nilai akhir sebagai rata-rata dari tugas, uts, dan uas
    SET NEW.nilai_akhir = (NEW.tugas + NEW.uts + NEW.uas) / 3;
    
    -- Tentukan status berdasarkan nilai akhir
    IF NEW.nilai_akhir >= 50 THEN
        SET NEW.status = 'Lulus';
    ELSE
        SET NEW.status = 'Tidak Lulus';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int NOT NULL,
  `nama_prodi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`) VALUES
(1, 'D3 - Teknik Informatika'),
(2, 'D3 - Teknik Mesin'),
(3, 'D4 - Multimedia'),
(4, 'D4 - Akuntansi'),
(5, 'D3 - Teknik Elektro');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('dosen','mahasiswa') NOT NULL DEFAULT 'mahasiswa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `role`) VALUES
('Surya Saputra', '101001', 'dosen'),
('Andi Wijaya', '220001', 'mahasiswa');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_mahasiswa_prodi`
-- (See below for the actual view)
--
CREATE TABLE `v_mahasiswa_prodi` (
`npm` varchar(15)
,`nama_mhs` varchar(100)
,`kode_kelas` varchar(10)
,`id_prodi` int
,`nama_prodi` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai` (
`id_nilai` int
,`npm` varchar(15)
,`nama_mhs` varchar(100)
,`kode_matkul` varchar(10)
,`nama_matkul` varchar(100)
,`nidn` varchar(20)
,`nama_dosen` varchar(100)
,`semester` int
,`nilai_akhir` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_mahasiswa`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_mahasiswa` (
`Kode Mata Kuliah` varchar(10)
,`Nama Mata Kuliah` varchar(100)
,`Jumlah SKS` int
,`Nilai` float
,`Status Kelulusan` enum('Lulus','Tidak Lulus')
);

-- --------------------------------------------------------

--
-- Structure for view `v_mahasiswa_prodi`
--
DROP TABLE IF EXISTS `v_mahasiswa_prodi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mahasiswa_prodi`  AS SELECT DISTINCT `m`.`npm` AS `npm`, `m`.`nama_mhs` AS `nama_mhs`, `m`.`kode_kelas` AS `kode_kelas`, `p`.`id_prodi` AS `id_prodi`, `p`.`nama_prodi` AS `nama_prodi` FROM ((`mahasiswa` `m` join `prodi` `p` on((`m`.`id_prodi` = `p`.`id_prodi`))) join `kelas` `k` on((`m`.`kode_kelas` = `k`.`kode_kelas`))) ORDER BY `m`.`npm` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai`
--
DROP TABLE IF EXISTS `v_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai`  AS SELECT `n`.`id_nilai` AS `id_nilai`, `m`.`npm` AS `npm`, `m`.`nama_mhs` AS `nama_mhs`, `mk`.`kode_matkul` AS `kode_matkul`, `mk`.`nama_matkul` AS `nama_matkul`, `d`.`nidn` AS `nidn`, `d`.`nama_dosen` AS `nama_dosen`, `mk`.`semester` AS `semester`, `n`.`nilai_akhir` AS `nilai_akhir` FROM (((`nilai` `n` join `mahasiswa` `m` on((`n`.`npm` = `m`.`npm`))) join `mata_kuliah` `mk` on((`n`.`kode_matkul` = `mk`.`kode_matkul`))) join `dosen` `d` on((`n`.`nidn` = `d`.`nidn`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_mahasiswa`
--
DROP TABLE IF EXISTS `v_nilai_mahasiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_mahasiswa`  AS SELECT `n`.`kode_matkul` AS `Kode Mata Kuliah`, `mk`.`nama_matkul` AS `Nama Mata Kuliah`, `mk`.`sks` AS `Jumlah SKS`, `n`.`nilai_akhir` AS `Nilai`, `n`.`status` AS `Status Kelulusan` FROM ((`nilai` `n` join `mahasiswa` `m` on((`n`.`npm` = `m`.`npm`))) join `mata_kuliah` `mk` on((`n`.`kode_matkul` = `mk`.`kode_matkul`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`),
  ADD KEY `kode_kelas` (`kode_kelas`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD UNIQUE KEY `unique_mhs` (`npm`,`kode_matkul`),
  ADD KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `nidn` (`nidn`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`password`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`) ON DELETE SET NULL,
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE SET NULL;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `mata_kuliah` (`kode_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

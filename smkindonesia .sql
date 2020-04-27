-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3036
-- Generation Time: Apr 18, 2020 at 06:52 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smkindonesia`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `nilai_akhir` ()  SELECT siswa.nisn, siswa.nama_siswa, kelas.nama_kelas, prodi.nama_prodi, nilai.nilai_uas
FROM siswa, kelas, prodi, nilai
WHERE siswa.nisn = nilai.nisn
AND siswa.id_kelas = kelas.id_kelas
AND kelas.id_prodi = prodi.id_prodi
AND nilai.nilai_uas > 70$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fchitungsiswabyalamat` (`alamat` VARCHAR(25)) RETURNS VARCHAR(25) CHARSET latin1 RETURN (SELECT COUNT(alamat) FROM siswa WHERE alamat=alamat_siswa)$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fnilai_akhir` (`nilai_uts` VARCHAR(10), `nilai_uas` VARCHAR(10), `nilai_tugas` VARCHAR(10)) RETURNS INT(10) NO SQL
BEGIN
 DECLARE nilai_akhir int;
 	SET nilai_akhir=(nilai_uts+nilai_uas+nilai_tugas)/3;
    RETURN nilai_akhir;
    END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `hitungna` (`nis_siswa` VARCHAR(25)) RETURNS VARCHAR(20) CHARSET latin1 RETURN (SELECT ((nilai_tugas+nilai_uts+nilai_uas)/3) FROM nilai WHERE nis=nis_siswa)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(10) NOT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_guru`, `alamat`, `nama_mapel`) VALUES
(5, 'Firman Danyyuyy', 'ciburuy', 'MTKs'),
(7, 'Wiwi', 'sumedang', 'MTK');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(10) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
(1, 'X RPL C');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `ket` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL DEFAULT '',
  `data_lama` varchar(25) NOT NULL DEFAULT '',
  `data_baru` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`ket`, `datetime`, `user`, `data_lama`, `data_baru`) VALUES
('Insert data ke tabel siswa, nisn = 1006', '2020-03-02 03:34:11', 'root@localhost', '', 'Aldova'),
('Delete data ke tabel siswa, nisn = 1003', '2020-03-02 03:34:38', 'root@localhost', 'Della', ''),
('Update data ke tabel siswa, nisn = 1002', '2020-03-02 03:34:54', 'root@localhost', 'Rahajeng alifa', 'Ferdiansyah'),
('Insert data ke tabel siswa, nisn = S122', '2020-04-10 13:20:48', 'root@localhost', '', 'Reza'),
('Delete data ke tabel siswa, nisn = S122', '2020-04-10 13:23:02', 'root@localhost', 'Reza', ''),
('Insert data ke tabel siswa, nisn = S122', '2020-04-13 06:16:48', 'root@localhost', '', 'Dudi'),
('Delete data ke tabel siswa, nisn = S122', '2020-04-13 06:17:24', 'root@localhost', 'Dudi', ''),
('Insert data ke tabel siswa, nisn = S122', '2020-04-13 06:17:40', 'root@localhost', '', 'Dudi'),
('Update data ke tabel siswa, nisn = 1002', '2020-04-17 13:25:20', 'root@localhost', 'Ferdiansyah', 'Ferdiansyahssd');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('syahidur', 'syahidur');

-- --------------------------------------------------------

--
-- Table structure for table `loginuser`
--

CREATE TABLE `loginuser` (
  `username_u` varchar(50) NOT NULL,
  `password_u` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginuser`
--

INSERT INTO `loginuser` (`username_u`, `password_u`) VALUES
('user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(10) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`) VALUES
(1, 'PKK');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `nilai_uts` varchar(10) NOT NULL,
  `nilai_uas` varchar(10) NOT NULL,
  `nilai_tugas` varchar(10) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nilai_uts`, `nilai_uas`, `nilai_tugas`, `nama_siswa`, `nama_mapel`, `nama_kelas`) VALUES
(18, '100', '90', '90', 'sandikuswandi', 'INDONESIA', 'XI RPL '),
(19, '100', '90', '90', 'Cahyadi', 'INDONESIA', 'XI RPL C'),
(20, '22', '12', '12', 'Ferdi', 'sunda', 'X TKJ C'),
(21, '80', '80', '80', 'dedi', 'PKK', 'X RPL C');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(10) NOT NULL,
  `nama_prodi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nisn` varchar(10) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `nama_prodi` varchar(50) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nisn`, `nama_siswa`, `alamat`, `jenis_kelamin`, `nama_prodi`, `nama_kelas`) VALUES
('1002', 'Ferdiansyahssd', 'Cimareme', 'Perempuan', 'RPL', 'XI RPL C'),
('1004', 'Fauzan', 'Cinegla', 'Laki laki', 'RPL', 'XI RPL A'),
('1006', 'Aldova', 'ciburial', 'laki laki', 'RPL', 'X RPL C'),
('S122', 'Dudi', 'ghg', 'laki laki', 'jurusan', 'rplc');

--
-- Triggers `siswa`
--
DELIMITER $$
CREATE TRIGGER `after_insert` AFTER INSERT ON `siswa` FOR EACH ROW BEGIN
  INSERT INTO LOG (ket, user, data_baru)
  VALUES (CONCAT('Insert data ke tabel siswa, nisn = ', NEW.nisn), USER(), NEW.nama_siswa);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update` AFTER UPDATE ON `siswa` FOR EACH ROW BEGIN
  INSERT INTO LOG (ket, USER, data_baru, data_lama)
  VALUES (CONCAT('Update data ke tabel siswa, nisn = ', NEW.nisn), USER(), NEW.nama_siswa, old.nama_siswa);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete` BEFORE DELETE ON `siswa` FOR EACH ROW BEGIN
  INSERT INTO LOG (ket, USER, data_lama)
  VALUES (CONCAT('Delete data ke tabel siswa, nisn = ', OLD.nisn), USER(), OLD.nama_siswa);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

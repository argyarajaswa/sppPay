-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Apr 2025 pada 06.00
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spppay`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_siswa` ()  NO SQL
BEGIN
	SELECT `tbl_siswa`.*, `tbl_kelas`.`nama_kelas`, `tbl_spp`.`tahun`
                FROM `tbl_siswa` JOIN `tbl_kelas`
                ON `tbl_siswa`.`id_kelas` = `tbl_kelas`.`id_kelas`
                JOIN `tbl_spp` ON `tbl_siswa` .`id_spp` = `tbl_spp`.`id_spp` ORDER BY `tbl_siswa`.`NISN`, `tbl_siswa`.`id_kelas` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kelas_get` ()  NO SQL
BEGIN
	SELECT `tbl_kelas`.*, `tbl_jurusan`.`jurusan` FROM `tbl_kelas` JOIN `tbl_jurusan` ON `tbl_kelas`.`id_jurusan` = `tbl_jurusan`.`id_jurusan` ORDER BY `tbl_kelas`.`id_jurusan` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `level_get` (IN `level` INT)  NO SQL
BEGIN
	SELECT * FROM tbl_level WHERE level = id_level;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_check` (IN `user` VARCHAR(100), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_petugas WHERE user = username AND pass = password_petugas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `siswa_check` (IN `user` VARCHAR(10), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_siswa WHERE user = nisn AND pass = nis;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `ID_JURUSAN` int(11) NOT NULL,
  `JURUSAN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`ID_JURUSAN`, `JURUSAN`) VALUES
(1, 'Rekayasa Perangkat Lunak'),
(2, 'OTOMISASI TATA USAHA PERKANTORAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `ID_KELAS` int(11) NOT NULL,
  `ID_JURUSAN` int(11) DEFAULT NULL,
  `NAMA_KELAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`ID_KELAS`, `ID_JURUSAN`, `NAMA_KELAS`) VALUES
(1, 1, 'XII RPL'),
(2, 2, 'XII OTKP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_level`
--

CREATE TABLE `tbl_level` (
  `ID_LEVEL` int(11) NOT NULL,
  `LEVEL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_level`
--

INSERT INTO `tbl_level` (`ID_LEVEL`, `LEVEL`) VALUES
(1, 'Admin'),
(2, 'Petugas'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `log_user` varchar(50) NOT NULL,
  `log_tipe` varchar(50) NOT NULL,
  `log_aksi` varchar(50) NOT NULL,
  `log_assign_to` varchar(50) NOT NULL,
  `log_assign_type` enum('petugas','siswa','spp','kelas','jurusan','transaksi','cetak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`log_id`, `log_time`, `log_user`, `log_tipe`, `log_aksi`, `log_assign_to`, `log_assign_type`) VALUES
(9, '2020-02-23 13:07:42', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(10, '2020-02-23 13:08:06', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(11, '2020-02-23 13:15:11', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(12, '2020-02-23 13:15:16', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(13, '2020-02-23 13:15:19', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(14, '2020-02-23 13:15:27', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(15, '2020-02-23 14:06:44', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(16, '2020-02-23 14:07:22', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(17, '2020-02-23 14:07:36', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(18, '2020-02-23 14:08:13', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(19, '2020-02-24 12:38:04', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(20, '2020-02-24 12:44:24', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(21, '2020-02-25 12:00:19', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(22, '2020-02-26 10:52:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(23, '2020-02-26 10:54:51', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(24, '2020-02-26 10:55:23', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(25, '2020-02-26 10:56:25', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(26, '2020-02-26 10:58:30', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(27, '2020-02-26 11:01:44', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(28, '2020-02-26 11:02:05', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(29, '2020-02-26 11:41:33', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(30, '2020-02-26 11:41:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(31, '2020-02-26 11:41:41', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(32, '2020-02-26 11:43:40', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(33, '2020-02-26 12:03:14', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(34, '2020-02-26 12:07:03', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(35, '2020-02-26 12:07:53', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(36, '2020-02-26 15:22:58', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(37, '2020-02-26 15:23:43', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(38, '2020-02-26 15:33:49', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(39, '2020-02-26 15:35:29', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(40, '2020-02-26 16:26:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(41, '2020-02-26 16:30:38', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(42, '2020-02-26 16:36:52', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(43, '2020-02-26 16:37:34', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(44, '2020-02-26 16:39:35', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(45, '2020-02-26 17:21:22', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(46, '2020-02-27 12:05:28', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(47, '2020-02-27 12:05:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(48, '2020-02-27 12:56:21', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(49, '2020-02-28 06:53:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(50, '2020-02-28 07:16:29', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(51, '2020-02-28 07:29:44', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(52, '2020-02-28 07:30:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(53, '2020-02-28 07:31:15', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(54, '2020-02-28 07:50:13', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(55, '2020-02-28 08:29:01', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(56, '2020-02-28 08:30:11', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(57, '2020-02-28 08:31:13', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(58, '2020-02-28 08:31:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(59, '2020-02-28 08:32:08', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(60, '2020-02-28 08:35:07', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(61, '2020-02-28 08:35:20', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(62, '2020-02-28 08:35:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(63, '2020-02-28 08:36:10', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(64, '2020-02-28 08:36:21', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(65, '2020-02-28 08:36:37', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(66, '2020-02-28 08:37:18', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(67, '2020-02-28 08:37:33', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(68, '2020-02-28 08:38:12', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(69, '2020-02-28 08:38:18', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(70, '2020-02-28 09:21:03', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(71, '2020-02-28 09:21:34', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(72, '2025-04-15 22:14:33', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(73, '2025-04-15 22:15:03', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(74, '2025-04-15 22:15:36', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(75, '2025-04-15 22:16:28', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(76, '2025-04-15 22:16:58', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(77, '2025-04-15 22:17:58', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(78, '2025-04-15 22:18:22', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(79, '2025-04-15 22:18:55', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(80, '2025-04-15 22:19:17', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(81, '2025-04-15 22:19:24', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(82, '2025-04-15 22:24:39', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(83, '2025-04-16 00:01:37', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(84, '2025-04-16 00:02:01', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(85, '2025-04-16 00:02:24', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(86, '2025-04-16 01:02:59', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(87, '2025-04-16 01:09:25', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(88, '2025-04-16 01:11:02', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(89, '2025-04-16 01:11:54', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(90, '2025-04-16 01:12:08', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(91, '2025-04-16 01:12:58', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(92, '2025-04-16 01:13:42', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(93, '2025-04-16 01:17:50', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(94, '2025-04-16 01:25:30', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(95, '2025-04-16 01:25:57', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(96, '2025-04-16 01:26:10', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(97, '2025-04-16 01:26:13', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(98, '2025-04-16 01:26:28', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(99, '2025-04-16 01:27:15', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(100, '2025-04-16 01:27:52', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(101, '2025-04-16 01:28:50', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(102, '2025-04-16 01:29:34', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(103, '2025-04-16 01:32:46', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(104, '2025-04-16 01:38:31', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(105, '2025-04-16 01:38:41', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(106, '2025-04-16 01:39:08', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(107, '2025-04-16 01:41:56', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(108, '2025-04-16 01:42:38', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(109, '2025-04-16 02:16:22', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(110, '2025-04-16 02:16:37', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(111, '2025-04-16 02:16:43', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(112, '2025-04-16 02:18:02', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(113, '2025-04-16 02:20:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(114, '2025-04-16 02:20:17', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(115, '2025-04-16 02:20:30', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(116, '2025-04-16 02:20:35', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(117, '2025-04-16 02:20:39', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(118, '2025-04-16 02:20:43', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(119, '2025-04-16 02:20:47', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(120, '2025-04-16 02:20:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(121, '2025-04-16 02:21:10', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(122, '2025-04-16 02:41:37', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(123, '2025-04-16 02:42:19', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(124, '2025-04-16 02:47:43', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(125, '2025-04-16 03:10:09', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(126, '2025-04-16 03:14:24', 'Whiku Adji', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(127, '2025-04-16 03:28:33', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(128, '2025-04-16 03:57:04', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(129, '2025-04-16 03:57:12', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(130, '2025-04-16 03:57:56', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(131, '2025-04-16 03:58:24', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(132, '2025-04-16 07:27:41', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(133, '2025-04-16 10:54:58', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(134, '2025-04-16 10:55:25', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(135, '2025-04-16 11:06:50', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(136, '2025-04-16 11:06:50', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(137, '2025-04-17 01:33:42', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(138, '2025-04-17 02:20:01', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(139, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000001', ''),
(140, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000002', ''),
(141, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000003', ''),
(142, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000004', ''),
(143, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000005', ''),
(144, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000006', ''),
(145, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000007', ''),
(146, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000008', ''),
(147, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000009', ''),
(148, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000010', ''),
(149, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000011', ''),
(150, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000012', ''),
(151, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000013', ''),
(152, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000014', ''),
(153, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000015', ''),
(154, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000016', ''),
(155, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000017', ''),
(156, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000018', ''),
(157, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000019', ''),
(158, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000020', ''),
(159, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000021', ''),
(160, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000022', ''),
(161, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000023', ''),
(162, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000024', ''),
(163, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000025', ''),
(164, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000026', ''),
(165, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000027', ''),
(166, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000028', ''),
(167, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000029', ''),
(168, '2025-04-17 03:20:12', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000030', ''),
(169, '2025-04-17 03:20:13', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000031', ''),
(170, '2025-04-17 03:20:13', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000032', ''),
(171, '2025-04-17 03:20:13', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000033', ''),
(172, '2025-04-17 03:20:13', 'Administrator', 'siswa', 'Mengimpor data siswa', '1000000034', ''),
(173, '2025-04-17 03:22:58', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(174, '2025-04-17 03:32:52', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(175, '2025-04-17 03:49:32', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `NISN` char(10) DEFAULT NULL,
  `TGL_BAYAR` date DEFAULT NULL,
  `JATUH_TEMPO` date NOT NULL,
  `BULAN_DIBAYAR` varchar(9) DEFAULT NULL,
  `TAHUN_DIBAYAR` varchar(4) DEFAULT NULL,
  `ID_SPP` int(11) NOT NULL,
  `JUMLAH_BAYAR` int(11) NOT NULL,
  `KET` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`ID_PEMBAYARAN`, `ID_PETUGAS`, `NISN`, `TGL_BAYAR`, `JATUH_TEMPO`, `BULAN_DIBAYAR`, `TAHUN_DIBAYAR`, `ID_SPP`, `JUMLAH_BAYAR`, `KET`) VALUES
(129, 1, '1234567890', '2025-04-16', '2025-05-20', 'Mei', '2025', 3, 200000, 'LUNAS'),
(130, 1, '1234567890', '2025-04-16', '2025-06-20', 'Juni', '2025', 3, 200000, 'LUNAS'),
(131, 1, '1234567890', '2025-04-16', '2025-07-20', 'Juli', '2025', 3, 200000, 'LUNAS'),
(132, 1, '1234567890', '2025-04-16', '2025-08-20', 'Agustus', '2025', 3, 200000, 'LUNAS'),
(133, 1, '1234567890', '2025-04-16', '2025-09-20', 'September', '2025', 3, 200000, 'LUNAS'),
(134, 1, '1234567890', '2025-04-16', '2025-10-20', 'Oktober', '2025', 3, 200000, 'LUNAS'),
(135, 1, '1234567890', '2025-04-16', '2025-11-20', 'November', '2025', 3, 200000, 'LUNAS'),
(136, 1, '1234567890', '2025-04-16', '2025-12-20', 'Desember', '2025', 3, 200000, 'LUNAS'),
(137, 1, '1234567890', NULL, '2026-01-20', 'Januari', '2026', 3, 200000, ''),
(138, 1, '1234567890', NULL, '2026-02-20', 'Februari', '2026', 3, 200000, ''),
(139, 1, '1234567890', NULL, '2026-03-20', 'Maret', '2026', 3, 200000, ''),
(140, 1, '1234567890', NULL, '2026-04-20', 'April', '2026', 3, 200000, ''),
(141, 1, '1234567890', NULL, '2025-05-20', 'Mei', '2025', 3, 200000, ''),
(142, 1, '1234567890', NULL, '2025-06-20', 'Juni', '2025', 3, 200000, ''),
(143, 1, '1234567890', NULL, '2025-07-20', 'Juli', '2025', 3, 200000, ''),
(144, 1, '1234567890', NULL, '2025-08-20', 'Agustus', '2025', 3, 200000, ''),
(145, 1, '1234567890', NULL, '2025-09-20', 'September', '2025', 3, 200000, ''),
(146, 1, '1234567890', NULL, '2025-10-20', 'Oktober', '2025', 3, 200000, ''),
(147, 1, '1234567890', NULL, '2025-11-20', 'November', '2025', 3, 200000, ''),
(148, 1, '1234567890', NULL, '2025-12-20', 'Desember', '2025', 3, 200000, ''),
(149, 1, '1234567890', NULL, '2026-01-20', 'Januari', '2026', 3, 200000, ''),
(150, 1, '1234567890', NULL, '2026-02-20', 'Februari', '2026', 3, 200000, ''),
(151, 1, '1234567890', NULL, '2026-03-20', 'Maret', '2026', 3, 200000, ''),
(152, 1, '1234567890', NULL, '2026-04-20', 'April', '2026', 3, 200000, ''),
(153, 1, '1234567890', NULL, '2025-05-20', 'Mei', '2025', 3, 200000, ''),
(154, 1, '1234567890', NULL, '2025-06-20', 'Juni', '2025', 3, 200000, ''),
(155, 1, '1234567890', NULL, '2025-07-20', 'Juli', '2025', 3, 200000, ''),
(156, 1, '1234567890', NULL, '2025-08-20', 'Agustus', '2025', 3, 200000, ''),
(157, 1, '1234567890', NULL, '2025-09-20', 'September', '2025', 3, 200000, ''),
(158, 1, '1234567890', NULL, '2025-10-20', 'Oktober', '2025', 3, 200000, ''),
(159, 1, '1234567890', NULL, '2025-11-20', 'November', '2025', 3, 200000, ''),
(160, 1, '1234567890', NULL, '2025-12-20', 'Desember', '2025', 3, 200000, ''),
(161, 1, '1234567890', NULL, '2026-01-20', 'Januari', '2026', 3, 200000, ''),
(162, 1, '1234567890', NULL, '2026-02-20', 'Februari', '2026', 3, 200000, ''),
(163, 1, '1234567890', NULL, '2026-03-20', 'Maret', '2026', 3, 200000, ''),
(164, 1, '1234567890', NULL, '2026-04-20', 'April', '2026', 3, 200000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `ID_PETUGAS` int(11) NOT NULL,
  `ID_LEVEL` int(11) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD_PETUGAS` varchar(225) DEFAULT NULL,
  `NAMA_PETUGAS` varchar(50) DEFAULT NULL,
  `DESKRIPSI` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`ID_PETUGAS`, `ID_LEVEL`, `USERNAME`, `PASSWORD_PETUGAS`, `NAMA_PETUGAS`, `DESKRIPSI`) VALUES
(1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin'),
(3, 2, 'petugas', 'b53fe7751b37e40ff34d012c7774d65f', 'Petugas', 'petugas1'),
(19, 2, 'petugas1', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'Argya', 'petugas'),
(20, 2, 'siswa', 'bcd724d15cde8c47650fda962968f102', 'Siswa', 'siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `NISN` char(10) NOT NULL,
  `ID_KELAS` int(11) DEFAULT NULL,
  `ID_SPP` int(11) DEFAULT NULL,
  `NIS` char(8) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` text DEFAULT NULL,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TEMPO` date NOT NULL DEFAULT '2025-05-20' COMMENT 'Tanggal jatuh tempo pembayaran'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`NISN`, `ID_KELAS`, `ID_SPP`, `NIS`, `NAMA`, `ALAMAT`, `NO_TELP`, `TIMESTAMP`, `TEMPO`) VALUES
('1000000002', 1, 1, '10000002', 'ACHMAD FATICH HAZAMI', 'Jln. Veteran 123', '0899580774', '2025-04-17 03:32:52', '0000-00-00'),
('1000000003', 1, 1, '10000003', 'ACHMADNAUFAL AZIZ', 'Jln. Veteran 123', '874241575', '2025-04-17 03:20:12', '0000-00-00'),
('1000000004', 1, 1, '10000004', 'ADITYA ESYA PRATAMA', 'Jln. Veteran 123', '858557285', '2025-04-17 03:20:12', '0000-00-00'),
('1000000005', 1, 1, '10000005', 'AISHA DIAN KARTIKA', 'Jln. Veteran 123', '835685642', '2025-04-17 03:20:12', '0000-00-00'),
('1000000006', 1, 1, '10000006', 'ALFIN AHSANU ROMADHONI', 'Jln. Veteran 123', '851328339', '2025-04-17 03:20:12', '0000-00-00'),
('1000000007', 1, 1, '10000007', 'ARGYA RAJASWA FIRJATULLAH', 'Jln. Veteran 123', '834993258', '2025-04-17 03:20:12', '0000-00-00'),
('1000000008', 1, 1, '10000008', 'ARRIDHO RENO SAPUTRA', 'Jln. Veteran 123', '832023033', '2025-04-17 03:20:12', '0000-00-00'),
('1000000009', 1, 1, '10000009', 'CHERIL VEBRI ANINDI', 'Jln. Veteran 123', '857869802', '2025-04-17 03:20:12', '0000-00-00'),
('1000000010', 1, 1, '10000010', 'DERIL VENO AMANULLAH', 'Jln. Veteran 123', '850094968', '2025-04-17 03:20:12', '0000-00-00'),
('1000000011', 1, 1, '10000011', 'DIMASARY PRAYOGA', 'Jln. Veteran 123', '877183076', '2025-04-17 03:20:12', '0000-00-00'),
('1000000012', 1, 1, '10000012', 'ELINDA OKTAHIVAFITRIANI', 'Jln. Veteran 123', '891488951', '2025-04-17 03:20:12', '0000-00-00'),
('1000000013', 1, 1, '10000013', 'FA\'IQMAULANA ALWAN', 'Jln. Veteran 123', '881135964', '2025-04-17 03:20:12', '0000-00-00'),
('1000000014', 1, 1, '10000014', 'FIKRI PUTRAMAHARGA', 'Jln. Veteran 123', '873935510', '2025-04-17 03:20:12', '0000-00-00'),
('1000000015', 1, 1, '10000015', 'LIAWAROKAH', 'Jln. Veteran 123', '855593728', '2025-04-17 03:20:12', '0000-00-00'),
('1000000016', 1, 1, '10000016', 'LILIS SETIAWATI', 'Jln. Veteran 123', '859571461', '2025-04-17 03:20:12', '0000-00-00'),
('1000000017', 1, 1, '10000017', 'LUTHFIYAH APTA INDRIATI', 'Jln. Veteran 123', '854350850', '2025-04-17 03:20:12', '0000-00-00'),
('1000000018', 1, 1, '10000018', 'MOCHAMAD CHAHARUDIN LUBIS', 'Jln. Veteran 123', '883393667', '2025-04-17 03:20:12', '0000-00-00'),
('1000000019', 1, 1, '10000019', 'MOH.AFIF MUZHAQI', 'Jln. Veteran 123', '850456904', '2025-04-17 03:20:12', '0000-00-00'),
('1000000020', 1, 1, '10000020', 'MOHAMAD RIZKY ALIF ZUWANA', 'Jln. Veteran 123', '811893854', '2025-04-17 03:20:12', '0000-00-00'),
('1000000021', 1, 1, '10000021', 'TANPA NAMA', 'Jln. Veteran 123', '890644235', '2025-04-17 03:20:12', '0000-00-00'),
('1000000022', 1, 1, '10000022', 'MUHAMMADILHAM', 'Jln. Veteran 123', '841881908', '2025-04-17 03:20:12', '0000-00-00'),
('1000000023', 1, 1, '10000023', 'MUHAMMAD MAULANA ASY\'ARI', 'Jln. Veteran 123', '887194868', '2025-04-17 03:20:12', '0000-00-00'),
('1000000024', 1, 1, '10000024', 'MUKHAMMAD\'IFAT AL FIKRI', 'Jln. Veteran 123', '849773757', '2025-04-17 03:20:12', '0000-00-00'),
('1000000025', 1, 1, '10000025', 'NAFF\'A RIDO DIRANDA', 'Jln. Veteran 123', '805774913', '2025-04-17 03:20:12', '0000-00-00'),
('1000000026', 1, 1, '10000026', 'NURULAZMIL NASYIFA', 'Jln. Veteran 123', '816024601', '2025-04-17 03:20:12', '0000-00-00'),
('1000000027', 1, 1, '10000027', 'RAKA ADITYA RAMADHANI', 'Jln. Veteran 123', '872389743', '2025-04-17 03:20:12', '0000-00-00'),
('1000000028', 1, 1, '10000028', 'REGIEVIA VELINA MAHARANI', 'Jln. Veteran 123', '890403194', '2025-04-17 03:20:12', '0000-00-00'),
('1000000029', 1, 1, '10000029', 'REVALINA AZKA ARLIYANTI', 'Jln. Veteran 123', '885075118', '2025-04-17 03:20:12', '0000-00-00'),
('1000000030', 1, 1, '10000030', 'SCATZHIANGGUN PUTRI KUMALA', 'Jln. Veteran 123', '808176697', '2025-04-17 03:20:12', '0000-00-00'),
('1000000031', 1, 1, '10000031', 'SLAMET RISKI HARDIYANTO', 'Jln. Veteran 123', '853100079', '2025-04-17 03:20:13', '0000-00-00'),
('1000000032', 1, 1, '10000032', 'STEVEN BRYAN ALEXANDER', 'Jln. Veteran 123', '871363998', '2025-04-17 03:20:13', '0000-00-00'),
('1000000033', 1, 1, '10000033', 'WHIKU ADJI HIBATULLAH', 'Jln. Veteran 123', '836681487', '2025-04-17 03:20:13', '0000-00-00'),
('1000000034', 1, 1, '10000034', 'ZACKY AKBAR RAMADHAN', 'Jln. Veteran 123', '854068841', '2025-04-17 03:20:13', '0000-00-00'),
('1111111', 1, 1, '1111', 'ASDWwdv', 'dvWWEF', '1123213R423', '2025-04-17 01:33:42', '2025-05-20'),
('112233', 2, 1, '123', 'Whiku Adji', 'Jombang', '0898162524', '2025-04-16 03:10:08', '2025-05-20'),
('1234567890', 1, 1, '112233', 'Argya Rajaswa F', 'mojokertoo nyel', '081928262524', '2025-04-16 02:18:02', '2025-05-20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_spp`
--

CREATE TABLE `tbl_spp` (
  `ID_SPP` int(11) NOT NULL,
  `TAHUN` varchar(16) DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_spp`
--

INSERT INTO `tbl_spp` (`ID_SPP`, `TAHUN`, `NOMINAL`) VALUES
(1, '2024/2025', 200000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`ID_JURUSAN`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`ID_KELAS`),
  ADD KEY `FK_JURUSAN` (`ID_JURUSAN`);

--
-- Indeks untuk tabel `tbl_level`
--
ALTER TABLE `tbl_level`
  ADD PRIMARY KEY (`ID_LEVEL`);

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indeks untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD KEY `FK_PETUGAS` (`ID_PETUGAS`),
  ADD KEY `FK_SISWA` (`NISN`);

--
-- Indeks untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`ID_PETUGAS`),
  ADD KEY `FK_LEVEL` (`ID_LEVEL`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`NISN`),
  ADD KEY `FK_KELAS` (`ID_KELAS`),
  ADD KEY `FK_SPP` (`ID_SPP`);

--
-- Indeks untuk tabel `tbl_spp`
--
ALTER TABLE `tbl_spp`
  ADD PRIMARY KEY (`ID_SPP`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `ID_JURUSAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `ID_KELAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `ID_LEVEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `ID_PETUGAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tbl_spp`
--
ALTER TABLE `tbl_spp`
  MODIFY `ID_SPP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `FK_JURUSAN` FOREIGN KEY (`ID_JURUSAN`) REFERENCES `tbl_jurusan` (`ID_JURUSAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `FK_PETUGAS` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `tbl_petugas` (`ID_PETUGAS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SISWA` FOREIGN KEY (`NISN`) REFERENCES `tbl_siswa` (`NISN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD CONSTRAINT `FK_LEVEL` FOREIGN KEY (`ID_LEVEL`) REFERENCES `tbl_level` (`ID_LEVEL`);

--
-- Ketidakleluasaan untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `FK_KELAS` FOREIGN KEY (`ID_KELAS`) REFERENCES `tbl_kelas` (`ID_KELAS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SPP` FOREIGN KEY (`ID_SPP`) REFERENCES `tbl_spp` (`ID_SPP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

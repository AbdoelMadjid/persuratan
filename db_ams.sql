-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4784
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for hk2y3243_surat
CREATE DATABASE IF NOT EXISTS `hk2y3243_surat` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hk2y3243_surat`;


-- Dumping structure for table hk2y3243_surat.disposisi
CREATE TABLE IF NOT EXISTS `disposisi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_surat` int(10) NOT NULL,
  `asal` enum('surat','disposisi') NOT NULL,
  `id_rel` int(10) NOT NULL,
  `dari` varchar(10) NOT NULL,
  `dari_user` int(6) NOT NULL,
  `penerima` varchar(10) NOT NULL,
  `penerima_user` int(6) NOT NULL,
  `intruksi` varchar(100) NOT NULL,
  `kecepatan` enum('sangat segera','segera','biasa') NOT NULL,
  `tgl_end` datetime NOT NULL,
  `isi_disposisi` varchar(255) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `flag_read` enum('Y','N') NOT NULL,
  `flag_lanjut` enum('Y','N') NOT NULL,
  `flag_tolak` enum('Y','N') NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `disp_ke` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hk2y3243_surat.disposisi: 2 rows
DELETE FROM `disposisi`;
/*!40000 ALTER TABLE `disposisi` DISABLE KEYS */;
INSERT INTO `disposisi` (`id`, `id_surat`, `asal`, `id_rel`, `dari`, `dari_user`, `penerima`, `penerima_user`, `intruksi`, `kecepatan`, `tgl_end`, `isi_disposisi`, `tgl_input`, `flag_read`, `flag_lanjut`, `flag_tolak`, `alasan`, `disp_ke`) VALUES
	(1, 1, 'surat', 1, '', 7, '0101', 8, 'Dihadiri & dilaporkan hasilnya', 'sangat segera', '2014-05-27 00:00:00', 'Hadiri Undangan Pertemua Dosen', '2014-05-27 08:36:56', 'Y', 'Y', 'N', '', 1),
	(2, 5, 'surat', 5, '', 7, '0101', 8, 'Dihadiri & dilaporkan hasilnya', 'sangat segera', '2014-05-28 00:00:00', 'Segera Tunjuk Dosen untuk Menghadiri Seminar', '2014-05-28 00:38:58', 'Y', 'Y', 'N', '', 1);
/*!40000 ALTER TABLE `disposisi` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.disposisi_tanggapan
CREATE TABLE IF NOT EXISTS `disposisi_tanggapan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_disposisi` int(10) NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `file` varchar(250) NOT NULL,
  `tgl_kirim` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hk2y3243_surat.disposisi_tanggapan: 2 rows
DELETE FROM `disposisi_tanggapan`;
/*!40000 ALTER TABLE `disposisi_tanggapan` DISABLE KEYS */;
INSERT INTO `disposisi_tanggapan` (`id`, `id_disposisi`, `catatan`, `file`, `tgl_kirim`) VALUES
	(1, 1, 'Sudah ditunjuk beberapa dosen untuk hadir', '', '2014-05-27 08:39:59'),
	(2, 2, '', '', '2014-05-28 00:45:28');
/*!40000 ALTER TABLE `disposisi_tanggapan` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.instansi
CREATE TABLE IF NOT EXISTS `instansi` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table hk2y3243_surat.instansi: ~1 rows (approximately)
DELETE FROM `instansi`;
/*!40000 ALTER TABLE `instansi` DISABLE KEYS */;
INSERT INTO `instansi` (`id`, `nama`, `alamat`, `logo`) VALUES
	(1, 'Universitas Jambi', 'Jl. Raya Jambi - Ma.Bulian KM 15 Mendalo Darat Jambi,\nINDONESIA\nTel/Fax: +62 741 583453', 'unja1.png');
/*!40000 ALTER TABLE `instansi` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `sub_dari` enum('instansi','aset','surat') NOT NULL,
  `nama` varchar(25) NOT NULL,
  `url` varchar(25) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hk2y3243_surat.menu: 9 rows
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `sub_dari`, `nama`, `url`, `icon`) VALUES
	(1, 'instansi', 'Instansi', 'atur_instansi', 'briefcase'),
	(2, 'instansi', 'Pengguna', 'atur_user', 'user'),
	(3, 'surat', 'S. Masuk', 'surat_masuk', 'folder-open-o'),
	(4, 'surat', 'S. Keluar', 'surat_keluar', 'folder'),
	(5, 'surat', 'Disp. Masuk', 'disposisi_masuk', 'hand-o-right'),
	(6, 'surat', 'Disp. Keluar', 'disposisi_keluar', 'hand-o-down'),
	(7, 'surat', 'Konsep', 'konsep', 'align-left'),
	(9, 'instansi', 'Setting Header', 'setting_header', 'star'),
	(12, 'surat', 'Jenis Surat', 'jenis_surat', 'thumb-tack');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.pengguna
CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_unit` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nomor_induk` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(75) NOT NULL,
  `tgl_aktif` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `level` enum('admin root','pimpinan','tata usaha','staff') NOT NULL,
  `apps` enum('instansi','aset','surat') NOT NULL,
  `id_menu` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ttd_image` varchar(50) NOT NULL DEFAULT 'blank.jpg',
  `kehadiran_status` enum('hadir','keluar') NOT NULL DEFAULT 'hadir',
  `kehadiran_keterangan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table hk2y3243_surat.pengguna: 6 rows
DELETE FROM `pengguna`;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` (`id`, `id_unit`, `nama`, `nomor_induk`, `username`, `password`, `tgl_aktif`, `status`, `level`, `apps`, `id_menu`, `email`, `ttd_image`, `kehadiran_status`, `kehadiran_keterangan`) VALUES
	(1, '', 'Hely Kurniawan', '11', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2014-05-20 09:10:20', 'Y', 'admin root', 'instansi', '1,2,9,', 'admin_super@gmail.com', '1f53738431bd77296ed51e2a9b787dab.jpg', 'keluar', ''),
	(4, '', 'Prilia Ardisa, S.Pd ', '', 'admin_surat', 'e10adc3949ba59abbe56e057f20f883e', '2014-05-26 12:53:13', 'Y', 'tata usaha', 'surat', '3,4,7,12,', 'priliaardisa@yahoo.co.id', '72dd83760ea91068161852c3a2e71784.jpg', 'hadir', 'HADIR'),
	(7, '', 'Prof. Dr. M. Rusdi, M.Sc', '0019127004', '0019127004', 'e10adc3949ba59abbe56e057f20f883e', '2014-05-27 08:29:55', 'Y', 'pimpinan', 'surat', '3,4,5,6,7,', 'rusdi@gmail.com', '1f53738431bd77296ed51e2a9b787dab.jpg', 'hadir', 'HADIR OK'),
	(8, '0101', 'Prof. Dr. Rahmat Murbojono, M.Pd', '', '0008085009', 'e10adc3949ba59abbe56e057f20f883e', '2014-05-27 08:32:49', 'Y', 'pimpinan', 'surat', '3,4,5,6,7,', 'helykurniawan@gmail.com', '1f53738431bd77296ed51e2a9b787dab.jpg', 'keluar', 'HADIR'),
	(10, '0101', 'Nur Akhwan', '', 'akhwan90', 'e10adc3949ba59abbe56e057f20f883e', '2014-05-27 23:03:58', 'Y', 'staff', 'surat', '5,6,7,', 'akhwan90@gmail.com', 'pemeriksa.jpg', 'hadir', 'HADIR'),
	(11, '', 'xxxxxxx', '1234567', 'xxxxxxx', 'e10adc3949ba59abbe56e057f20f883e', '2014-06-24 07:18:52', 'Y', 'pimpinan', 'instansi', '3,4,5,6,7,', 'xxxxxxx@gmail.com', 'blank.jpg', 'hadir', '');
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.r_jenis_surat
CREATE TABLE IF NOT EXISTS `r_jenis_surat` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hk2y3243_surat.r_jenis_surat: 5 rows
DELETE FROM `r_jenis_surat`;
/*!40000 ALTER TABLE `r_jenis_surat` DISABLE KEYS */;
INSERT INTO `r_jenis_surat` (`id`, `nama`) VALUES
	(1, 'Surat Tugas'),
	(2, 'SK Bimbingan'),
	(3, 'SK Penguji'),
	(4, 'SK Yudisium'),
	(5, 'SK Kepanitiaan');
/*!40000 ALTER TABLE `r_jenis_surat` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.surat_keluar
CREATE TABLE IF NOT EXISTS `surat_keluar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_rel_surat_masuk` int(6) NOT NULL,
  `id_rel_disposisi` int(6) NOT NULL,
  `pengirim` varchar(10) NOT NULL,
  `pengirim_user` int(5) NOT NULL,
  `tgl_surat` date NOT NULL,
  `no_agenda` varchar(10) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `penerima` varchar(200) NOT NULL,
  `perihal` text NOT NULL,
  `kecepatan` enum('sangat segera','segera','biasa') NOT NULL,
  `pemeriksa` varchar(10) NOT NULL,
  `pemeriksa_user` int(6) NOT NULL,
  `flag_setuju` enum('Y','N') NOT NULL,
  `flag_keluar` enum('Y','N') NOT NULL,
  `flag_del` enum('Y','N') NOT NULL,
  `tipe` enum('template','file') NOT NULL,
  `id_buat_surat` int(10) NOT NULL,
  `file` varchar(255) NOT NULL,
  `id_jenis_surat` int(11) NOT NULL,
  `isi_surat` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table hk2y3243_surat.surat_keluar: 2 rows
DELETE FROM `surat_keluar`;
/*!40000 ALTER TABLE `surat_keluar` DISABLE KEYS */;
INSERT INTO `surat_keluar` (`id`, `id_rel_surat_masuk`, `id_rel_disposisi`, `pengirim`, `pengirim_user`, `tgl_surat`, `no_agenda`, `no_surat`, `penerima`, `perihal`, `kecepatan`, `pemeriksa`, `pemeriksa_user`, `flag_setuju`, `flag_keluar`, `flag_del`, `tipe`, `id_buat_surat`, `file`, `id_jenis_surat`, `isi_surat`) VALUES
	(10, 0, 0, '', 4, '2014-06-22', '00005', '123456', 'xxxxx', 'xxxxxxxxxxx', 'sangat segera', '', 7, 'Y', 'Y', 'N', 'file', 0, '_Vamers-Geekosphere-Movies-The-Many-Voices-of-Darth-Vader-Mask-770x251.jpg', 1, '<p class="Point-1">Lampiran &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 5(lima) lembar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 29 Juni 2009</p>\r\n<p class="Point-1">Hal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Lamaran Kerja</p>\r\n<p class="Point-1">Nomor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : {NOMOR}</p>\r\n<p class="Point-2">&nbsp;</p>\r\n<p class="Point-2">Kepada Yth</p>\r\n<p class="Point-2">Bapak Pimpinan PT. PARAMITRA Group</p>\r\n<p class="Point-2">Jl. Kaliurang km 10,4 no. 333 Sleman&nbsp; Yogyakarta</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dengan hormat,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yang bertanda tangan di bawah ini :</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : KURNIAWAN</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tempat, tanggal lahir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Yogyakarta, 22 Nopember 1993</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pendidikan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : SMK PARAMITRA</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Program Keahlian : Teknik Otomotif</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat rumah&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Jl. Kaliurang km 17 Yogyakarta</p>\r\n<p class="Point-1">&nbsp;</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dengan ini mengajukan lamaran kerja sekiranya pada perusahaan Bapak terdapat lowongan pekerjaan yang sesuai dengan pendidikan saya.&nbsp; Sebagai bahan pertimbangan, bersama ini saya lampirkan foto kopi Ijazah terakhir, foto kopi Sertifikat Kompetensi, foto kopi Surat Keterangan Praktik Kerja di Industri, Daftar Riwayat Hidup, Keterangan Kesehatan serta Pas Foto.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Saya berkeinginan untuk&nbsp; maju dan sanggup&nbsp; bekerja keras, serta yakin akan dapat mengerjakan tugas di bidang otomotif.</p>\r\n<p class="Point-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jawaban dan kebijaksanan Bapak saya ucapkan terima kasih.</p>\r\n'),
	(9, 0, 0, '', 4, '2014-06-21', '00004', 'xxxxx', 'penerima', 'perihal', 'segera', '', 7, 'Y', 'Y', 'N', 'file', 0, 'header1.png', 1, '<p style="text-align: center;"><span style="font-family: \'arial black\', \'avant garde\'; font-size: large;"><strong>SURAT TUGAS</strong></span></p>\r\n<p style="text-align: center;"><span style="font-family: \'arial black\',\'avant garde\'; font-size: small;">NOMOR : {NOMOR}</span></p>\r\n\r\n<p style="text-align: center;"><span style="font-family: \'arial black\', \'avant garde\'; font-size: large;"><strong>ber</strong></span></p>\r\n<p style="text-align: left;"><span style="font-family: arial, helvetica, sans-serif; font-size: small;">berdasarkan surat dirjen DIKTI Kemendikbud nomor</span></p>\r\n<p style="text-align: left;"><span style="font-family: arial, helvetica, sans-serif; font-size: small;">berdasarkan surat dirjen DIKTI Kemendikbud nomor</span></p>\r\n<p style="text-align: left;"><span style="font-family: arial, helvetica, sans-serif; font-size: small;">berdasarkan surat dirjen DIKTI Kemendikbud nomor</span></p>\r\n<p style="text-align: left;"><span style="font-family: arial, helvetica, sans-serif; font-size: small;">berdasarkan surat dirjen DIKTI Kemendikbud nomor</span></p>\r\n<p style="text-align: left;"><span style="font-family: arial, helvetica, sans-serif; font-size: small;">berdasarkan surat dirjen DIKTI Kemendikbud nomor</span></p>\r\n<p style="text-align: left;"><span style="font-family: arial, helvetica, sans-serif; font-size: small;">berdasarkan surat dirjen DIKTI Kemendikbud nomor</span></p>\r\n<p style="text-align: left;">&nbsp;</p>');
/*!40000 ALTER TABLE `surat_keluar` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.surat_masuk
CREATE TABLE IF NOT EXISTS `surat_masuk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl_diterima` datetime NOT NULL,
  `tgl_surat` date NOT NULL,
  `pengirim` varchar(200) NOT NULL,
  `nomor` varchar(200) NOT NULL,
  `no_agenda` varchar(10) NOT NULL,
  `penerima` varchar(10) NOT NULL,
  `tembusan` varchar(10) NOT NULL,
  `perihal` text NOT NULL,
  `kecepatan` enum('sangat segera','segera','biasa') NOT NULL,
  `file` varchar(255) NOT NULL,
  `flag_read` enum('Y','N') NOT NULL,
  `flag_del` enum('Y','N') NOT NULL,
  `flag_lanjut` enum('Y','N') NOT NULL,
  `flag_tolak` enum('Y','N') NOT NULL,
  `alasan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hk2y3243_surat.surat_masuk: 6 rows
DELETE FROM `surat_masuk`;
/*!40000 ALTER TABLE `surat_masuk` DISABLE KEYS */;
INSERT INTO `surat_masuk` (`id`, `tgl_diterima`, `tgl_surat`, `pengirim`, `nomor`, `no_agenda`, `penerima`, `tembusan`, `perihal`, `kecepatan`, `file`, `flag_read`, `flag_del`, `flag_lanjut`, `flag_tolak`, `alasan`) VALUES
	(1, '2014-05-27 08:26:03', '2014-05-27', 'Universitas Indonesia', '01/DT/2014', '000002', '01', '', 'Agenda Pertemuan Dosen', 'sangat segera', 'AGENDA_PERTEMUAN_Dosen.doc', 'Y', 'Y', 'Y', 'N', ''),
	(2, '2014-05-27 23:05:36', '2014-05-27', 'FIP', '09090', '000003', '0101', '', 'aaaa', 'sangat segera', 'Cara_menentukan_Extent_MAP_File.pdf', 'N', 'Y', 'N', 'N', ''),
	(3, '2014-05-27 23:10:23', '2014-05-27', 'FIP', '09/2090/2013', '000004', '0101', '', 'aaaa', 'sangat segera', 'Kisi-kisi_UAMBN_PAI_dan_bahasa_Arab.pdf', 'N', 'Y', 'N', 'N', ''),
	(4, '2014-05-27 23:17:19', '2014-05-27', 'FIP', '09/2090/2013', '000005', '0101', '', 'aaaa', 'sangat segera', '', 'N', 'Y', 'N', 'N', ''),
	(5, '2014-05-28 00:33:23', '2014-05-28', 'Universitas Pelita Harapan', '002/34/2014', '000007', '01', '', 'Undangan Seminar', 'sangat segera', 'PAK_RUSDIANTO.docx', 'Y', 'Y', 'Y', 'N', ''),
	(6, '2014-05-29 11:23:25', '2014-05-29', 'kopertis 1', 'KPTS.01/20/5/2014', '000008', '0101', '', 'Visitasi akreditasi', 'sangat segera', '3273-3398-1-PB1.pdf', 'N', 'Y', 'N', 'N', '');
/*!40000 ALTER TABLE `surat_masuk` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.surat_tanggapan
CREATE TABLE IF NOT EXISTS `surat_tanggapan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_surat` int(10) NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `file` varchar(250) NOT NULL,
  `tgl_kirim` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table hk2y3243_surat.surat_tanggapan: 0 rows
DELETE FROM `surat_tanggapan`;
/*!40000 ALTER TABLE `surat_tanggapan` DISABLE KEYS */;
/*!40000 ALTER TABLE `surat_tanggapan` ENABLE KEYS */;


-- Dumping structure for table hk2y3243_surat.unit
CREATE TABLE IF NOT EXISTS `unit` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `unit_0` varchar(2) NOT NULL,
  `unit_1` varchar(2) NOT NULL,
  `unit_2` varchar(2) NOT NULL,
  `unit_3` varchar(2) NOT NULL,
  `kode_gabung` varchar(8) NOT NULL,
  `nama_unit` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_gabung` (`kode_gabung`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hk2y3243_surat.unit: 3 rows
DELETE FROM `unit`;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` (`id`, `unit_0`, `unit_1`, `unit_2`, `unit_3`, `kode_gabung`, `nama_unit`) VALUES
	(1, '', '', '', '', '', 'Universitas Jambi'),
	(2, '01', '', '', '', '01', 'Fakultas KIP'),
	(3, '01', '01', '', '', '0101', 'Pendidikan Ekonomi');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

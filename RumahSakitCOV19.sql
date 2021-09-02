-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for uas_pdb_19650079
CREATE DATABASE IF NOT EXISTS `uas_pdb_19650079` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `uas_pdb_19650079`;

-- Dumping structure for table uas_pdb_19650079.dokter
CREATE TABLE IF NOT EXISTS `dokter` (
  `Id_dokter` int(11) NOT NULL,
  `Nama_dokter` varchar(15) DEFAULT NULL,
  `Alamat_dokter` varchar(25) DEFAULT NULL,
  `No_telp_dokter` varchar(15) DEFAULT NULL,
  `Spesialisasi_dokter` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.pasien
CREATE TABLE IF NOT EXISTS `pasien` (
  `Id_pasien` int(11) NOT NULL,
  `Nama_pasien` varchar(15) DEFAULT NULL,
  `Gender_pasien` varchar(15) DEFAULT NULL,
  `Usia_pasien` int(11) NOT NULL,
  `Alamat_pasien` varchar(25) DEFAULT NULL,
  `No_telp_pasien` varchar(15) DEFAULT NULL,
  `Keluhan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.pcr_swab_test
CREATE TABLE IF NOT EXISTS `pcr_swab_test` (
  `Id_swtest` varchar(15) NOT NULL,
  `Hasil_swtest` varchar(15) DEFAULT NULL,
  `Biaya_swtest` int(11) NOT NULL,
  PRIMARY KEY (`Id_swtest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `Id_pembayaran` varchar(15) NOT NULL,
  `Id_pasien` int(11) NOT NULL,
  `Tgl_bayar` date DEFAULT NULL,
  `Total_biaya` int(11) NOT NULL,
  PRIMARY KEY (`Id_pembayaran`,`Id_pasien`),
  KEY `Id_pasien` (`Id_pasien`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`Id_pasien`) REFERENCES `pasien` (`Id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.rapid_test
CREATE TABLE IF NOT EXISTS `rapid_test` (
  `Id_rptest` varchar(15) NOT NULL,
  `Hasil_rptest` varchar(15) DEFAULT NULL,
  `Biaya_rptest` int(11) NOT NULL,
  PRIMARY KEY (`Id_rptest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.resep_dokter
CREATE TABLE IF NOT EXISTS `resep_dokter` (
  `Id_resep` int(11) NOT NULL,
  `Id_pasien` int(11) NOT NULL,
  `Nama_obat` varchar(50) DEFAULT NULL,
  `Biaya_obat` int(11) NOT NULL,
  `Id_dokter` int(11) NOT NULL,
  PRIMARY KEY (`Id_resep`,`Id_pasien`,`Id_dokter`),
  KEY `Id_pasien` (`Id_pasien`),
  KEY `Id_dokter` (`Id_dokter`),
  CONSTRAINT `resep_dokter_ibfk_1` FOREIGN KEY (`Id_pasien`) REFERENCES `pasien` (`Id_pasien`),
  CONSTRAINT `resep_dokter_ibfk_2` FOREIGN KEY (`Id_dokter`) REFERENCES `dokter` (`Id_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.ruang_rawat_inap
CREATE TABLE IF NOT EXISTS `ruang_rawat_inap` (
  `Id_ruang` int(11) NOT NULL,
  `Id_pasien` int(11) NOT NULL,
  `Nama_ruang` varchar(20) DEFAULT NULL,
  `Nama_gedung` varchar(20) DEFAULT NULL,
  `Tgl_masuk` date DEFAULT NULL,
  `Tgl_keluar` date DEFAULT NULL,
  `Biaya_rawatinap` int(11) NOT NULL,
  PRIMARY KEY (`Id_ruang`,`Id_pasien`),
  KEY `Id_pasien` (`Id_pasien`),
  CONSTRAINT `ruang_rawat_inap_ibfk_1` FOREIGN KEY (`Id_pasien`) REFERENCES `pasien` (`Id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.ruang_rawat_inap_covid19
CREATE TABLE IF NOT EXISTS `ruang_rawat_inap_covid19` (
  `Id_ruang_cov19` int(11) NOT NULL,
  `Id_pasien` int(11) NOT NULL,
  `Nama_ruang` varchar(20) DEFAULT NULL,
  `Nama_gedung` varchar(20) DEFAULT NULL,
  `Tgl_masuk` date DEFAULT NULL,
  `Tgl_keluar` date DEFAULT NULL,
  `Biaya_rawatinap` int(11) NOT NULL,
  PRIMARY KEY (`Id_ruang_cov19`,`Id_pasien`),
  KEY `Id_pasien` (`Id_pasien`),
  CONSTRAINT `ruang_rawat_inap_covid19_ibfk_1` FOREIGN KEY (`Id_pasien`) REFERENCES `pasien` (`Id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table uas_pdb_19650079.status_covid19
CREATE TABLE IF NOT EXISTS `status_covid19` (
  `Id_status` varchar(15) NOT NULL,
  `Id_pasien` int(11) NOT NULL,
  `Id_rptest` varchar(15) NOT NULL,
  `Id_swtest` varchar(15) NOT NULL,
  `Status_cov19` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_status`,`Id_pasien`,`Id_rptest`,`Id_swtest`),
  KEY `Id_pasien` (`Id_pasien`),
  KEY `Id_rptest` (`Id_rptest`),
  KEY `Id_swtest` (`Id_swtest`),
  CONSTRAINT `status_covid19_ibfk_1` FOREIGN KEY (`Id_pasien`) REFERENCES `pasien` (`Id_pasien`),
  CONSTRAINT `status_covid19_ibfk_2` FOREIGN KEY (`Id_rptest`) REFERENCES `rapid_test` (`Id_rptest`),
  CONSTRAINT `status_covid19_ibfk_3` FOREIGN KEY (`Id_swtest`) REFERENCES `pcr_swab_test` (`Id_swtest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2016 at 06:37 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nathaayu`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsip_barang`
--

CREATE TABLE IF NOT EXISTS `arsip_barang` (
  `idBarang` bigint(20) NOT NULL DEFAULT '0',
  `namaBarang` varchar(30) DEFAULT ' ',
  `idKategoriBarang` int(5) DEFAULT '0',
  `idSatuanBarang` int(5) DEFAULT '0',
  `jumBarang` int(10) DEFAULT '0',
  `hargaJual` bigint(20) DEFAULT '0',
  `last_update` date DEFAULT '2000-01-01',
  `idSupplier` bigint(20) DEFAULT '0',
  `barcode` varchar(25) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `idRak` bigint(5) DEFAULT NULL,
  UNIQUE KEY `barcode` (`barcode`),
  KEY `idKategoriBarang` (`idKategoriBarang`),
  KEY `namaBarang` (`namaBarang`),
  KEY `idSupplier` (`idSupplier`),
  KEY `idKategoriBarang_2` (`idKategoriBarang`),
  KEY `idSupplier_2` (`idSupplier`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE IF NOT EXISTS `audit` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglTransaksi` datetime NOT NULL,
  `jenisTransaksi` varchar(30) NOT NULL COMMENT 'returnotajual, batalitemjual, returnotabeli, batalitembeli',
  `username` varchar(30) NOT NULL,
  `nomorStruk` bigint(20) NOT NULL,
  `nominalStruk` bigint(20) NOT NULL DEFAULT '0',
  `barcode` varchar(25) NOT NULL,
  `hargaBeli` bigint(20) NOT NULL DEFAULT '0',
  `hargaJual` bigint(20) NOT NULL DEFAULT '0',
  `jumBarang` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `idBank` int(3) NOT NULL,
  `namaBank` varchar(20) DEFAULT NULL,
  `noRekening` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idBank`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `idBarang` bigint(20) NOT NULL DEFAULT '0',
  `namaBarang` varchar(30) DEFAULT ' ',
  `idKategoriBarang` int(5) DEFAULT '0',
  `idSatuanBarang` int(5) DEFAULT '0',
  `jumBarang` int(10) DEFAULT '0',
  `hargaJual` bigint(20) DEFAULT '0',
  `hargaJualLastUpdate` datetime DEFAULT NULL,
  `last_update` date DEFAULT '2000-01-01',
  `idSupplier` bigint(20) DEFAULT '0',
  `barcode` varchar(25) NOT NULL DEFAULT '',
  `username` varchar(30) DEFAULT NULL,
  `idRak` bigint(5) DEFAULT NULL,
  `nonAktif` tinyint(1) DEFAULT NULL COMMENT '1=Tidak Aktif',
  PRIMARY KEY (`barcode`),
  KEY `idKategoriBarang` (`idKategoriBarang`),
  KEY `idSupplier` (`idSupplier`),
  KEY `namaBarang_2` (`namaBarang`),
  KEY `idRak` (`idRak`),
  KEY `idKategoriBarang_2` (`idKategoriBarang`),
  FULLTEXT KEY `namaBarang` (`namaBarang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`idBarang`, `namaBarang`, `idKategoriBarang`, `idSatuanBarang`, `jumBarang`, `hargaJual`, `hargaJualLastUpdate`, `last_update`, `idSupplier`, `barcode`, `username`, `idRak`, `nonAktif`) VALUES
(1, 'Mie Sedap Goreng Kari Spesial', 4, 3, 155, 1250, NULL, '2010-03-26', 5, '80808080', NULL, NULL, NULL),
(2, 'Mie Sedap Rebus Kari Ayam', 4, 3, 154, 1094, NULL, '2010-03-26', 5, '82828282', NULL, NULL, NULL),
(3, 'Sirup ABC Lemon', 3, 3, 15, 9375, NULL, '2010-03-26', 3, '90909090', NULL, NULL, NULL),
(4, 'Sirup ABC Strawberry', 3, 3, 15, 10000, NULL, '2010-03-26', 3, '91919191', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `idConfig` bigint(20) NOT NULL AUTO_INCREMENT,
  `option` varchar(30) NOT NULL,
  `value` varchar(70) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idConfig`),
  KEY `option` (`option`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`idConfig`, `option`, `value`, `description`) VALUES
(1, 'store_name', 'KLINIK KECANTIKAN NATHA AYU', 'Nama Toko'),
(2, 'receipt_footer1', 'Terimakasih atas kunjungan anda.', 'Struk Footer 1'),
(3, 'receipt_footer2', '', 'Struk Footer 2'),
(4, 'receipt_header1', '---------------------------', 'Struk Header 1'),
(5, 'temporary_space', '/tmp/', 'Temporary Space'),
(6, 'version', 'a:3:{i:0;i:2;i:1;i:0;i:2;i:17;}', 'Versi'),
(7, 'ukm_mode', '0', 'UKM Mode'),
(8, 'point_value', '', 'Nilai rupiah untuk member mendapatkan 1 point'),
(9, 'footer_nota_a4', 'Barang yang sudah dibeli tidak bisa ditukar atau dikembalikan', 'Footer Nota A4'),
(10, 'abangadek_mode', '0', 'Abang Adek Mode');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `idCustomer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomor_kartu` varchar(45) DEFAULT NULL,
  `namaCustomer` varchar(30) DEFAULT NULL,
  `alamatCustomer` varchar(1000) DEFAULT NULL,
  `telpCustomer` varchar(15) DEFAULT NULL,
  `keterangan` text,
  `uname` varchar(8) DEFAULT NULL,
  `pwd` varchar(35) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `diskon_persen` int(11) DEFAULT '0',
  `diskon_rupiah` decimal(15,5) DEFAULT '0.00000',
  `nomor_ktp` varchar(45) DEFAULT NULL,
  `jenis_kelamin` tinyint(1) DEFAULT NULL COMMENT '0=Laki-laki; 1=Perempuan',
  `tanggal_lahir` date DEFAULT NULL,
  `handphone` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=bukan, 1=member',
  PRIMARY KEY (`idCustomer`),
  UNIQUE KEY `nomor_kartu_UNIQUE` (`nomor_kartu`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`idCustomer`, `nomor_kartu`, `namaCustomer`, `alamatCustomer`, `telpCustomer`, `keterangan`, `uname`, `pwd`, `last_update`, `diskon_persen`, `diskon_rupiah`, `nomor_ktp`, `jenis_kelamin`, `tanggal_lahir`, `handphone`, `email`, `member`) VALUES
(1, NULL, 'Umum', 'Customer Umum / Non Member', '', 'Customer Umum / Non Member', NULL, NULL, '2009-12-01', 0, 0.00000, NULL, NULL, NULL, NULL, NULL, 0),
(2, NULL, 'Rosari Prima', 'JL. GelarSena 1', '0272325540', 'rosa', NULL, NULL, '2009-11-21', 0, 0.00000, NULL, NULL, NULL, NULL, NULL, 0),
(3, NULL, 'Priska', 'STM Pembangunan', '08562969601', 'kantin', NULL, NULL, '2009-12-06', 0, 0.00000, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE IF NOT EXISTS `detail_beli` (
  `idDetailBeli` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTransaksiBeli` bigint(20) NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `tglExpire` date NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` bigint(20) NOT NULL,
  `isSold` varchar(1) DEFAULT 'N',
  `barcode` varchar(25) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `jumBarangAsli` int(11) DEFAULT NULL COMMENT 'Jumlah Barang pada saat Pembelian',
  PRIMARY KEY (`idDetailBeli`),
  KEY `isSold` (`isSold`),
  KEY `jumBarang` (`jumBarang`),
  KEY `idBarang` (`idBarang`),
  KEY `barcode` (`barcode`),
  KEY `barcode_2` (`barcode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`idDetailBeli`, `idTransaksiBeli`, `idBarang`, `tglExpire`, `jumBarang`, `hargaBeli`, `isSold`, `barcode`, `username`, `jumBarangAsli`) VALUES
(1, 1, 1, '0000-00-00', 155, 1000, 'N', '80808080', 'ariefadmin', 160),
(2, 1, 2, '0000-00-00', 154, 875, 'N', '82828282', 'ariefadmin', 160),
(3, 2, 4, '0000-00-00', 15, 8000, 'N', '91919191', 'ariefadmin', 20),
(4, 2, 3, '0000-00-00', 15, 7500, 'N', '90909090', 'ariefadmin', 20);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE IF NOT EXISTS `detail_jual` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idTransaksiJual` bigint(20) NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` bigint(20) DEFAULT NULL,
  `hargaJual` bigint(20) NOT NULL,
  `harga_jual_asli` bigint(20) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `diskon` bigint(20) NOT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  `nomorStruk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `nomorStruk` (`nomorStruk`),
  KEY `barcode` (`barcode`),
  KEY `barcode_2` (`barcode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`uid`, `idTransaksiJual`, `idBarang`, `jumBarang`, `hargaBeli`, `hargaJual`, `harga_jual_asli`, `username`, `diskon`, `barcode`, `nomorStruk`) VALUES
(1, 1, 2, 2, 875, 1094, NULL, 'ariefadmin', 0, '82828282', 1),
(2, 1, 1, 2, 1000, 1250, NULL, 'ariefadmin', 0, '80808080', 1),
(3, 2, 4, 1, 8000, 10000, NULL, 'kasir1', 0, '91919191', 2),
(4, 2, 3, 1, 7500, 9375, NULL, 'kasir1', 0, '90909090', 2),
(5, 0, 3, 1, 7500, 9375, NULL, 'kasir1', 0, '90909090', 3),
(6, 0, 3, 1, 7500, 10000, NULL, 'kasir1', 0, '90909090', 4),
(7, 0, 1, 2, 1000, 1250, NULL, 'admin', 0, '80808080', 5),
(8, 0, 3, 3, 7500, 9375, NULL, 'admin', 0, '90909090', 5),
(9, 0, 2, 3, 875, 1094, NULL, 'input', 0, '82828282', 6),
(10, 0, 4, 5, 8000, 10000, NULL, 'input', 0, '91919191', 6),
(11, 0, 1, 3, 1000, 1250, NULL, 'admin', 0, '80808080', 7),
(12, 0, 2, 3, 875, 1094, NULL, 'admin', 0, '82828282', 7);

-- --------------------------------------------------------

--
-- Table structure for table `detail_retur_barang`
--

CREATE TABLE IF NOT EXISTS `detail_retur_barang` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTransaksiRetur` bigint(20) NOT NULL,
  `tglTransaksi` datetime NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` bigint(20) DEFAULT NULL,
  `hargaJual` bigint(20) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_retur_beli`
--

CREATE TABLE IF NOT EXISTS `detail_retur_beli` (
  `idTransaksiBeli` bigint(20) NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `tglExpire` date NOT NULL,
  `jumRetur` int(10) NOT NULL,
  `hargaBeli` bigint(20) NOT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `idSupplier` varchar(10) DEFAULT NULL,
  `nominal` bigint(20) DEFAULT '0',
  `idTipePembayaran` int(3) DEFAULT NULL,
  `NomorInvoice` varchar(15) NOT NULL DEFAULT '0',
  `idReturBeli` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglRetur` date NOT NULL,
  PRIMARY KEY (`idReturBeli`),
  KEY `idBarang` (`idTransaksiBeli`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci' AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_stock_opname`
--

CREATE TABLE IF NOT EXISTS `detail_stock_opname` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `idStockOpname` bigint(20) NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `namaBarang` varchar(30) NOT NULL,
  `jmlTercatat` int(11) NOT NULL,
  `selisih` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `idStockOpname` (`idStockOpname`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transfer_barang`
--

CREATE TABLE IF NOT EXISTS `detail_transfer_barang` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idBarang` bigint(20) NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaJual` bigint(20) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  `nomorStruk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `nomorStruk` (`nomorStruk`),
  KEY `barcode` (`barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `diskon_detail`
--

CREATE TABLE IF NOT EXISTS `diskon_detail` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `diskon_tipe_id` bigint(20) unsigned NOT NULL,
  `diskon_tipe_nama` varchar(25) NOT NULL,
  `trigger` varchar(25) NOT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  `tanggal_dari` datetime DEFAULT '0000-00-00 00:00:00',
  `tanggal_sampai` datetime DEFAULT '0000-00-00 00:00:00',
  `diskon_rupiah` decimal(15,2) NOT NULL DEFAULT '0.00',
  `diskon_persen` int(11) NOT NULL DEFAULT '0',
  `min_item` int(11) unsigned DEFAULT NULL COMMENT 'if (value >= qty) dapatDiskon;',
  `max_item` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT 'true=aktif; ',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1000 ;

-- --------------------------------------------------------

--
-- Table structure for table `diskon_tipe`
--

CREATE TABLE IF NOT EXISTS `diskon_tipe` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `deskripsi` varchar(250) DEFAULT NULL,
  `trigger_quantity` tinyint(1) NOT NULL DEFAULT '0',
  `trigger_price` tinyint(1) NOT NULL DEFAULT '0',
  `trigger_time` tinyint(1) NOT NULL DEFAULT '0',
  `trigger_total` tinyint(1) NOT NULL DEFAULT '0',
  `trigger_barcode` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1003 ;

--
-- Dumping data for table `diskon_tipe`
--

INSERT INTO `diskon_tipe` (`uid`, `nama`, `deskripsi`, `trigger_quantity`, `trigger_price`, `trigger_time`, `trigger_total`, `trigger_barcode`) VALUES
(1, 'Admin', 'Entry Diskon Manual by Admin', 0, 0, 0, 0, 0),
(2, 'Customer', 'Diskon per Customer/Member', 0, 0, 0, 0, 0),
(1000, 'Grosir', 'Beli banyak harga turun', 1, 0, 0, 0, 1),
(1001, 'Waktu', 'Turun Harga selama waktu tertentu', 0, 0, 1, 0, 1),
(1002, 'Member: Waktu', 'Turun Harga selama waktu tertentu', 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `diskon_transaksi`
--

CREATE TABLE IF NOT EXISTS `diskon_transaksi` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `diskon_detail_uids` varchar(255) NOT NULL COMMENT 'json = {diskon_detail_uid : diskon_rupiah}',
  `barcode` varchar(25) DEFAULT NULL,
  `waktu` datetime NOT NULL,
  `diskon_rupiah` decimal(15,2) NOT NULL DEFAULT '0.00',
  `diskon_persen` int(11) NOT NULL DEFAULT '0',
  `idDetailJual` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `diskon_transaksi`
--

INSERT INTO `diskon_transaksi` (`uid`, `diskon_detail_uids`, `barcode`, `waktu`, `diskon_rupiah`, `diskon_persen`, `idDetailJual`) VALUES
(1, '{"1":-625}', '90909090', '2014-08-05 15:56:13', -625.00, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `fast_stock_opname`
--

CREATE TABLE IF NOT EXISTS `fast_stock_opname` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `idRak` bigint(20) NOT NULL,
  `tanggalSO` date NOT NULL,
  `username` varchar(30) NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `namaBarang` varchar(30) NOT NULL,
  `jmlTercatat` int(11) NOT NULL,
  `selisih` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `idRak` (`idRak`,`tanggalSO`,`approved`),
  KEY `barcode` (`barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `harga_banded`
--

CREATE TABLE IF NOT EXISTS `harga_banded` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barcode` varchar(25) NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode_UNIQUE` (`barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hutang`
--

CREATE TABLE IF NOT EXISTS `hutang` (
  `idTransaksiBeli` bigint(20) NOT NULL,
  `nominal` bigint(20) NOT NULL,
  `tglBayar` date NOT NULL,
  `last_update` date NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idTransaksiBeli`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hutang`
--

INSERT INTO `hutang` (`idTransaksiBeli`, `nominal`, `tglBayar`, `last_update`, `username`) VALUES
(1, 300000, '2010-04-19', '2010-03-26', 'ariefadmin');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE IF NOT EXISTS `kasir` (
  `idTransKasir` int(15) NOT NULL AUTO_INCREMENT,
  `tglBukaKasir` datetime DEFAULT NULL,
  `idUser` int(3) DEFAULT NULL,
  `kasAwal` float DEFAULT NULL,
  `kasSeharusnya` float DEFAULT NULL,
  `kasTutup` float DEFAULT NULL,
  `currentWorkstation` bigint(20) DEFAULT NULL,
  `tglTutupKasir` datetime DEFAULT NULL,
  `totalTransaksi` bigint(20) DEFAULT NULL,
  `totalProfit` bigint(20) DEFAULT NULL,
  `totalRetur` bigint(20) DEFAULT NULL,
  `totalTransaksiKas` bigint(20) DEFAULT NULL,
  `totalTransaksiKartu` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idTransKasir`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`idTransKasir`, `tglBukaKasir`, `idUser`, `kasAwal`, `kasSeharusnya`, `kasTutup`, `currentWorkstation`, `tglTutupKasir`, `totalTransaksi`, `totalProfit`, `totalRetur`, `totalTransaksiKas`, `totalTransaksiKartu`) VALUES
(1, '2010-03-26 20:37:52', 10, 100000, 119375, 119375, 1, '2016-06-18 06:20:26', 19375, 4375, 0, 0, 0),
(2, '2016-06-18 06:20:57', 10, 119375, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE IF NOT EXISTS `kategori_barang` (
  `idKategoriBarang` int(5) NOT NULL AUTO_INCREMENT,
  `namaKategoriBarang` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idKategoriBarang`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`idKategoriBarang`, `namaKategoriBarang`) VALUES
(1, 'wafer'),
(2, 'biskuit'),
(3, 'sirup'),
(4, 'mie'),
(5, 'kopi'),
(6, 'isotonik drink'),
(7, 'makanan'),
(8, 'Gulaku'),
(9, 'kosmetik'),
(10, 'Perlengkapan'),
(11, 'sabun cuci'),
(12, 'minuman'),
(13, 'Susu'),
(14, 'ATK'),
(15, 'Elektronik'),
(16, 'Bayi'),
(17, 'Detergent/Obat Nyamuk'),
(18, 'Pecah Belah'),
(19, 'Muslim'),
(20, 'Sabun/Shampo'),
(21, 'Mainan'),
(22, 'Pakaian'),
(23, 'Obat');

-- --------------------------------------------------------

--
-- Table structure for table `leveluser`
--

CREATE TABLE IF NOT EXISTS `leveluser` (
  `idLevelUser` int(2) NOT NULL,
  `levelUser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idLevelUser`),
  KEY `idLevelUser` (`idLevelUser`),
  KEY `levelUser` (`levelUser`),
  KEY `idLevelUser_2` (`idLevelUser`),
  KEY `levelUser_2` (`levelUser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leveluser`
--

INSERT INTO `leveluser` (`idLevelUser`, `levelUser`) VALUES
(1, 'semua'),
(2, 'admin'),
(3, 'gudang'),
(4, 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `accesskey` varchar(1) DEFAULT NULL,
  `publish` enum('Y','N') NOT NULL,
  `level_user_id` int(11) NOT NULL,
  `urutan` int(11) NOT NULL DEFAULT '1',
  `level` int(11) NOT NULL DEFAULT '0',
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nama`, `link`, `icon`, `parent_id`, `label`, `accesskey`, `publish`, `level_user_id`, `urutan`, `level`, `last_update`) VALUES
(1, 'Home', 'media.php?module=home', 'fa fa-home fa-4x', 0, 'Home', '', 'Y', 1, 1, 0, '0000-00-00 00:00:00'),
(2, 'Barang', 'media.php?module=barang', 'fa fa-barcode fa-4x', 0, 'Barang', '', 'Y', 3, 2, 0, '0000-00-00 00:00:00'),
(3, 'Pembelian', 'media.php?module=pembelian_barang', 'fa fa-truck fa-4x', 0, 'Pembelian', '', 'Y', 3, 3, 0, '0000-00-00 00:00:00'),
(4, 'Kasir', 'media.php?module=penjualan_barang', 'fa fa-shopping-cart fa-4x', 0, 'Kasir', '', 'Y', 3, 4, 0, '0000-00-00 00:00:00'),
(5, 'Laporan', 'media.php?module=laporan', 'fa fa-bar-chart-o fa-4x', 0, 'Laporan', '', 'Y', 2, 5, 0, '0000-00-00 00:00:00'),
(6, 'Stock Opname', 'media.php?module=barang&act=cetakbarang1', 'fa fa-check-square-o fa-4x', 0, 'Stock Op', '', 'Y', 3, 5, 0, '0000-00-00 00:00:00'),
(7, 'Settings', 'media.php?module=ganti_password', 'fa fa-wrench fa-4x', 0, 'Settings', '', 'Y', 4, 7, 0, '0000-00-00 00:00:00'),
(8, 'Logout', 'logout.php', 'fa fa-power-off fa-4x', 0, 'Logout', '', 'Y', 1, 9, 0, '0000-00-00 00:00:00'),
(9, 'Satuan Barang', 'media.php?module=satuan_barang', '', 2, 'Satuan Barang', '', 'Y', 3, 1, 0, '0000-00-00 00:00:00'),
(10, 'Menu', 'media.php?module=menu', '', 7, 'Menu', '', 'Y', 2, 4, 0, '0000-00-00 00:00:00'),
(11, 'Supplier', 'media.php?module=supplier', '', 7, 'Supplier', '', 'Y', 3, 1, 0, '0000-00-00 00:00:00'),
(12, 'Kategori Barang', 'media.php?module=kategori_barang', '', 2, 'Kategori Barang', '', 'Y', 3, 2, 0, '0000-00-00 00:00:00'),
(13, 'Rak Barang', 'media.php?module=rak', '', 2, 'Rak Barang', '', 'Y', 3, 3, 0, '0000-00-00 00:00:00'),
(14, 'Tambah Barang', 'media.php?module=barang&act=tambahbarang', '', 2, 'Tambah Barang', '', 'Y', 3, 4, 0, '0000-00-00 00:00:00'),
(15, 'Cari Barang', 'media.php?module=barang&act=caribarang1', '', 2, 'Cari Barang', '', 'Y', 3, 5, 0, '0000-00-00 00:00:00'),
(16, 'Cetak Label per Rak', 'media.php?module=barang&act=cetaklabel1', '', 2, 'Cetak Label per Rak', '', 'Y', 3, 6, 0, '0000-00-00 00:00:00'),
(17, 'Transfer Barang Antar Ahad', 'media.php?module=barang&act=transfer1', '', 2, 'Transfer Barang Antar Ahad', '', 'Y', 3, 7, 0, '0000-00-00 00:00:00'),
(18, 'Input Rak Barang', 'media.php?module=barang&act=inputrak', '', 2, 'Input Rak Barang', '', 'Y', 3, 8, 0, '0000-00-00 00:00:00'),
(19, 'Pembelian Barang', 'media.php?module=pembelian_barang&act=pembelianbarang', '', 3, 'Pembelian Barang', '', 'Y', 3, 1, 0, '0000-00-00 00:00:00'),
(20, 'Retur Pembelian', 'media.php?module=pembelian_barang&act=returpembelianpernota', '', 3, 'Retur Pembelian per Nota', '', 'Y', 3, 2, 0, '0000-00-00 00:00:00'),
(21, 'Cetak Nota Retur', 'media.php?module=pembelian_barang&act=cetakretur', '', 3, 'Cetak Nota Retur', '', 'Y', 3, 4, 0, '0000-00-00 00:00:00'),
(22, 'Input pembelian elektronik', 'media.php?module=pembelian_barang&act=inputeprocurement1', '', 3, 'Input Pembelian Elektronik', '', 'Y', 3, 5, 0, '0000-00-00 00:00:00'),
(23, 'Input RPO per item', 'media.php?module=pembelian_barang&act=buatrpo1', '', 3, 'Input RPO (per Item)', '', 'Y', 3, 6, 0, '0000-00-00 00:00:00'),
(24, 'Input RPO per Supplier', 'media.php?module=pembelian_barang&act=rposup1', '', 3, 'Input RPO per Supplier', '', 'Y', 3, 7, 0, '0000-00-00 00:00:00'),
(25, 'Buka kasir', 'media.php?module=kasir&act=bukakasir', '', 4, 'Buka Kasir', '', 'Y', 3, 1, 0, '0000-00-00 00:00:00'),
(26, 'Tutup kasir', 'media.php?module=kasir&act=tutupkasir', '', 4, 'Tutup Kasir', '', 'Y', 3, 2, 0, '0000-00-00 00:00:00'),
(27, 'Penambahan Dana', 'media.php?module=kasir&act=tambahdana', '', 4, 'Penambahan Dana', '', 'Y', 3, 3, 0, '0000-00-00 00:00:00'),
(28, 'Penjualan', 'media.php?module=penjualan_barang', '', 4, 'Penjualan', '', 'Y', 4, 4, 0, '0000-00-00 00:00:00'),
(29, 'User', 'media.php?module=user', '', 7, 'User', '', 'Y', 2, 3, 0, '0000-00-00 00:00:00'),
(34, 'Customer', 'media.php?module=customer', '', 7, 'Customer', '', 'Y', 4, 2, 0, '0000-00-00 00:00:00'),
(35, 'Workstation', 'media.php?module=workstation', '', 7, 'Workstation', '', 'Y', 2, 5, 0, '0000-00-00 00:00:00'),
(36, 'Personal Info', 'media.php?module=ganti_password', '', 7, 'Personal Info', '', 'Y', 2, 6, 0, '0000-00-00 00:00:00'),
(37, 'Laporan Pemb Brg / tgl', 'media.php?module=pembelian_barang&act=laporanpembeliantanggal', '', 5, 'Pembelian Barang per Tanggal', '', 'Y', 2, 1, 0, '0000-00-00 00:00:00'),
(38, 'Laporan Pemb Brg / sup', 'media.php?module=pembelian_barang&act=laporanpembelian', '', 5, 'Pembelian Barang per Supplier', '', 'Y', 2, 2, 0, '0000-00-00 00:00:00'),
(39, 'Laporan Penjualan', 'media.php?module=laporan&act=penjualan1', '', 5, 'Penjualan', '', 'Y', 3, 3, 0, '0000-00-00 00:00:00'),
(40, 'Total Stock', 'media.php?module=laporan&act=total1', '', 5, 'Total Stock', '', 'Y', 2, 4, 0, '0000-00-00 00:00:00'),
(41, 'Top Rank', 'media.php?module=laporan&act=toprank1', '', 5, 'Top Rank', '', 'Y', 2, 5, 0, '0000-00-00 00:00:00'),
(42, 'Aging', 'media.php?module=laporan&act=aging1', '', 5, 'Aging Stock', '', 'Y', 2, 6, 0, '0000-00-00 00:00:00'),
(43, 'Cetak Stock Barang', 'media.php?module=barang&act=cetakbarang1', '', 6, 'Cetak Stock Barang', '', 'Y', 3, 1, 0, '0000-00-00 00:00:00'),
(44, 'Cetak Form Stock Op', 'media.php?module=barang&act=cetakSO', '', 6, 'Cetak Form Stock Opname', '', 'Y', 3, 2, 0, '0000-00-00 00:00:00'),
(45, 'Input SO Manual', 'media.php?module=barang&act=inputSO', '', 6, 'Input SO Manual', '', 'Y', 3, 3, 0, '0000-00-00 00:00:00'),
(46, 'Fast SO', '../tools/fast-stock-opname/fast-SO.php', '', 6, 'Input Fast SO', '', 'Y', 3, 4, 0, '0000-00-00 00:00:00'),
(47, 'Approve Fast SO', 'media.php?module=barang&act=ApproveFastSO1', '', 6, 'Approve Fast SO', '', 'Y', 3, 5, 0, '0000-00-00 00:00:00'),
(48, 'Input Mobil SO', '../tools/fast-stock-opname/fast-SO-mobile.php', '', 6, 'Input Mobile SO', '', 'Y', 3, 6, 0, '0000-00-00 00:00:00'),
(49, 'Approve Mobile SO', 'media.php?module=barang&act=ApproveMobileSO1', '', 6, 'Approve Mobile SO', '', 'Y', 3, 7, 0, '0000-00-00 00:00:00'),
(50, 'System', 'media.php?module=system', 'fa fa-cogs fa-4x', 0, 'System', '', 'Y', 2, 8, 0, '0000-00-00 00:00:00'),
(51, 'Setting', 'media.php?module=system&act=setting', '', 50, 'Setting', '', 'Y', 2, 1, 0, '0000-00-00 00:00:00'),
(52, 'Maintenance', 'media.php?module=system&act=maintenance', '', 50, 'Maintenance', '', 'Y', 2, 2, 0, '0000-00-00 00:00:00'),
(53, 'Diskon', 'media.php?module=barang&act=diskon', '', 2, 'Diskon', '', 'Y', 2, 9, 0, '0000-00-00 00:00:00'),
(54, 'Diskon', 'media.php?module=laporan&act=diskon1', '', 5, 'Diskon', '', 'Y', 2, 7, 0, '0000-00-00 00:00:00'),
(55, 'Pindah Supplier', 'media.php?module=barang&act=pindahsupplier', '', 2, 'Pindah Supplier', '', 'Y', 2, 10, 0, '0000-00-00 00:00:00'),
(56, 'Pindah Rak', 'media.php?module=barang&act=pindahrak', '', 2, 'Pindah Rak', '', 'Y', 2, 11, 0, '0000-00-00 00:00:00'),
(57, 'Rpo per Supplier Responsive', '../tools/rpo', '', 3, 'Input RPO per Supplier per Rak', '', 'Y', 3, 8, 0, '0000-00-00 00:00:00'),
(58, 'SO dengan Summary', '../tools/stok', '', 6, 'Stok', '', 'Y', 3, 10, 0, '0000-00-00 00:00:00'),
(59, 'Input SO dengan Portable Data Terminal', '../tools/fast-stock-opname/pdt-so.php', '', 6, 'Input PDT SO', '', 'Y', 3, 8, 0, '0000-00-00 00:00:00'),
(60, 'Approve SO dengan Portable Data Terminal', 'media.php?module=barang&act=ApprovePdtSO1', '', 6, 'Approve PDT SO', '', 'Y', 3, 9, 0, '0000-00-00 00:00:00'),
(61, 'Harga Banded', 'media.php?module=barang&act=hargabanded', '', 2, 'Harga Banded', '', 'Y', 2, 12, 0, '0000-00-00 00:00:00'),
(62, 'Laporan Transfer Barang', 'media.php?module=laporan&act=transferbarang', '', 5, 'Transfer Barang', '', 'Y', 3, 8, 0, '0000-00-00 00:00:00'),
(63, 'Membership', 'media.php?module=membership', '', 7, 'Membership', '', 'Y', 2, 7, 0, '0000-00-00 00:00:00'),
(64, 'Jumlah POIN member', 'media.php?module=laporan&act=jumlahpoin', '', 5, 'Jumlah Poin', '', 'Y', 3, 8, 0, '0000-00-00 00:00:00'),
(65, 'List kasir yang aktif', 'media.php?module=kasir', '', 4, 'Kasir Aktif', '', 'Y', 3, 5, 0, '0000-00-00 00:00:00'),
(66, 'Cetak label per barcode / update HJ', 'media.php?module=barang&act=cetakperbarcode', '', 2, 'Cetak Label per Barcode/Update HJ', '', 'Y', 3, 13, 0, '0000-00-00 00:00:00'),
(67, 'Sinkronisasi harga jual dari toko lain', 'module=barang&act=hargajualsync', '', 2, 'Sync HJ', '', 'N', 2, 14, 0, '0000-00-00 00:00:00'),
(68, 'Kartu Stok', 'media.php?module=barang&act=kartustok', '', 2, 'Kartu Stok', '', 'Y', 3, 15, 0, '0000-00-00 00:00:00'),
(69, 'Retur Beli per Barcode', 'media.php?module=pembelian_barang&act=returpembelianperbarang', '', 3, 'Retur Pembelian per barang', '', 'Y', 3, 3, 0, '0000-00-00 00:00:00'),
(70, 'PO by jumlah barang (stok)', 'media.php?module=laporan&act=po', '', 5, 'Purchase Order', '', 'Y', 3, 9, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `idModul` int(3) NOT NULL,
  `namaModul` varchar(50) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `publish` enum('Y','N') DEFAULT NULL,
  `idLevelUser` int(2) DEFAULT NULL,
  `urutan` int(3) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `script_name` varchar(50) NOT NULL,
  PRIMARY KEY (`idModul`),
  KEY `script_name` (`script_name`),
  KEY `idLevelUser` (`idLevelUser`),
  KEY `publish` (`publish`),
  KEY `idLevelUser_2` (`idLevelUser`),
  KEY `publish_2` (`publish`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`idModul`, `namaModul`, `link`, `publish`, `idLevelUser`, `urutan`, `last_update`, `script_name`) VALUES
(1, 'Manajemen User', '?module=user', 'N', 2, 101, '2009-10-19', 'mod_user.php'),
(2, 'Supplier', '?module=supplier', 'Y', 3, 5, '2009-10-19', 'mod_supplier.php'),
(3, 'Customer', '?module=customer', 'Y', 4, 6, '2009-10-19', 'mod_customer.php'),
(4, 'Barang', '?module=barang', 'Y', 3, 3, '2009-10-19', 'mod_barang.php'),
(5, 'Rak', '?module=rak', 'Y', 3, 4, '2009-10-19', 'mod_rak.php'),
(6, 'Satuan Barang', '?module=satuan_barang', 'Y', 3, 1, '2009-10-19', 'mod_satuan_barang.php'),
(7, 'Kategori Barang', '?module=kategori_barang', 'Y', 3, 2, '2009-10-19', 'mod_kategori_barang.php'),
(8, 'Pembelian', '?module=pembelian_barang', 'Y', 3, 7, '2009-10-19', 'mod_beli_barang.php'),
(9, 'Penjualan', '?module=penjualan_barang', 'Y', 4, 8, '2009-10-19', 'mod_jual_barang.php'),
(10, 'Ganti Password', '?module=ganti_password', 'N', 1, 100, '2009-10-19', ''),
(11, 'Hutang', '?module=hutang', 'Y', 3, 9, '2009-10-19', 'mod_hutang.php'),
(12, 'Piutang', '?module=piutang', 'Y', 4, 10, '2009-10-19', 'mod_piutang.php'),
(13, 'Manajemen Modul', '?module=modul', 'N', 2, 102, '2009-10-19', 'mod_modul.php'),
(14, 'Kasir', '?module=kasir', 'Y', 2, 11, NULL, 'mod_kasir.php'),
(15, 'Laporan Manajemen', '?module=laporan', 'Y', 2, 12, NULL, 'mod_laporan.php'),
(16, 'Manajemen Workstation', '?module=workstation', 'Y', 2, 13, NULL, 'mod_manage_workstation.php');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `idTipePembayaran` int(3) NOT NULL AUTO_INCREMENT,
  `tipePembayaran` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idTipePembayaran`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`idTipePembayaran`, `tipePembayaran`) VALUES
(1, 'CASH'),
(2, 'Tempo'),
(3, 'Voucher'),
(4, 'Debit'),
(5, 'Kredit');

-- --------------------------------------------------------

--
-- Table structure for table `periode_poin`
--

CREATE TABLE IF NOT EXISTS `periode_poin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `awal` tinyint(4) NOT NULL,
  `akhir` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_UNIQUE` (`nama`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE IF NOT EXISTS `piutang` (
  `idTransaksiJual` bigint(20) NOT NULL,
  `nominal` bigint(20) unsigned DEFAULT NULL,
  `tglDiBayar` date DEFAULT NULL,
  `idUser` int(3) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`idTransaksiJual`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE IF NOT EXISTS `purchase_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal_buat` datetime NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `range` int(11) NOT NULL COMMENT 'hari',
  `buffer` int(11) NOT NULL COMMENT '%',
  `jumlah_hari_persediaan` int(11) NOT NULL COMMENT 'hari',
  `updated_by` varchar(30) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=rpo; 1=po',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_detail`
--

CREATE TABLE IF NOT EXISTS `purchase_order_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `harga_beli_terakhir` bigint(20) NOT NULL,
  `stok_saat_ini` int(11) DEFAULT NULL,
  `avg_daily_sales` float DEFAULT NULL,
  `saran_order` int(11) DEFAULT NULL,
  `jumlah_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE IF NOT EXISTS `rak` (
  `idRak` bigint(5) NOT NULL AUTO_INCREMENT,
  `namaRak` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idRak`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`idRak`, `namaRak`) VALUES
(1, 'Rak Depan Kasir'),
(2, 'Susu 1'),
(3, 'Susu 2'),
(4, 'Susu 3'),
(5, 'Susu 4'),
(6, 'Susu 5'),
(7, 'Susu 6'),
(8, 'Rak 8'),
(9, 'Rak 9'),
(10, 'Rak 10'),
(11, 'Rak 11'),
(12, 'Rak 12'),
(13, 'Rak 13'),
(14, 'Rak 14'),
(15, 'Rak 15'),
(16, 'Rak 16'),
(17, 'Rak 17'),
(18, 'Rak 18'),
(19, 'Rak 19'),
(20, 'Rak 20');

-- --------------------------------------------------------

--
-- Table structure for table `retur`
--

CREATE TABLE IF NOT EXISTS `retur` (
  `idRetur` int(10) NOT NULL AUTO_INCREMENT,
  `idCustomer` varchar(10) DEFAULT NULL,
  `idJenisRetur` int(2) DEFAULT NULL,
  `idTransaksi` bigint(20) DEFAULT NULL,
  `idAksiRetur` int(2) DEFAULT NULL,
  PRIMARY KEY (`idRetur`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `satuan_barang`
--

CREATE TABLE IF NOT EXISTS `satuan_barang` (
  `idSatuanBarang` int(5) NOT NULL,
  `namaSatuanBarang` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idSatuanBarang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan_barang`
--

INSERT INTO `satuan_barang` (`idSatuanBarang`, `namaSatuanBarang`) VALUES
(1, 'Kg'),
(2, 'Ons'),
(3, 'Pcs'),
(4, 'Kardus');

-- --------------------------------------------------------

--
-- Table structure for table `self_checkout`
--

CREATE TABLE IF NOT EXISTS `self_checkout` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `ipv4` varchar(15) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `self_checkout_detail`
--

CREATE TABLE IF NOT EXISTS `self_checkout_detail` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `self_checkout_uid` bigint(20) NOT NULL,
  `barcode` varchar(45) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `diskon` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `self_checkout_temp`
--

CREATE TABLE IF NOT EXISTS `self_checkout_temp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `barcode` varchar(45) NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `diskon` bigint(20) NOT NULL DEFAULT '0',
  `ipv4` varchar(15) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname`
--

CREATE TABLE IF NOT EXISTS `stock_opname` (
  `idStockOpname` bigint(20) NOT NULL AUTO_INCREMENT,
  `idRak` bigint(5) NOT NULL,
  `tanggalSO` date NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`idStockOpname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stok_stat`
--

CREATE TABLE IF NOT EXISTS `stok_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(1000) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stok_stat_detail`
--

CREATE TABLE IF NOT EXISTS `stok_stat_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stok_stat_id` int(10) unsigned NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `stok_tercatat` int(11) NOT NULL,
  `stok_sebenarnya` int(11) DEFAULT NULL,
  `updated_by` varchar(30) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stok_stat_id_UNIQUE` (`stok_stat_id`,`barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `idSupplier` bigint(20) NOT NULL AUTO_INCREMENT,
  `namaSupplier` varchar(30) DEFAULT NULL,
  `alamatSupplier` varchar(100) DEFAULT NULL,
  `telpSupplier` varchar(15) DEFAULT NULL,
  `Keterangan` text,
  `last_update` date DEFAULT NULL,
  `interval` int(11) NOT NULL DEFAULT '7',
  PRIMARY KEY (`idSupplier`),
  KEY `namaSupplier` (`namaSupplier`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=368 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`idSupplier`, `namaSupplier`, `alamatSupplier`, `telpSupplier`, `Keterangan`, `last_update`, `interval`) VALUES
(1, 'Catur Edi', 'Jl. Wuluh 5, Papringan, Sleman', '0274567876', 'Thanx', '2009-11-30', 7),
(2, 'Albertus Supriyadi', 'Jl. Jonggrangan 1 No.3, Jonggrangan Baru\r\nKlaten', '0282435009', 'Tenda LUV', '2009-10-22', 7),
(3, 'MAKRO', 'Ciputat', '', 'sembako', '2010-02-05', 7),
(4, 'Jepara', 'Jembatan Lima', '', '', '2010-02-06', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tmp`
--

CREATE TABLE IF NOT EXISTS `tmp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bigint1` bigint(20) DEFAULT NULL,
  `bigint2` bigint(20) DEFAULT NULL,
  `bigint3` bigint(20) DEFAULT NULL,
  `integer1` int(11) DEFAULT NULL,
  `integer2` int(11) DEFAULT NULL,
  `integer3` int(11) DEFAULT NULL,
  `vc1` varchar(45) DEFAULT NULL,
  `vc2` varchar(45) DEFAULT NULL,
  `vc3` varchar(45) DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `dt1` datetime DEFAULT NULL,
  `dt2` datetime DEFAULT NULL,
  `dt3` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_cetak_label_perbarcode`
--

CREATE TABLE IF NOT EXISTS `tmp_cetak_label_perbarcode` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tmpBarcode` varchar(50) DEFAULT NULL,
  `tmpNama` varchar(100) DEFAULT NULL,
  `tmpKategori` varchar(50) DEFAULT NULL,
  `tmpSatuan` varchar(50) DEFAULT NULL,
  `tmpJumlah` varchar(100) DEFAULT NULL,
  `tmpHargaJual` varchar(100) DEFAULT NULL,
  `tmpIdBarang` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_detail_beli`
--

CREATE TABLE IF NOT EXISTS `tmp_detail_beli` (
  `idSupplier` int(10) NOT NULL,
  `tglTransaksi` date NOT NULL,
  `idBarang` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglExpire` date NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` float NOT NULL,
  `hargaJual` float NOT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  KEY `idBarang` (`idBarang`),
  KEY `idSupplier` (`idSupplier`),
  KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_detail_jual`
--

CREATE TABLE IF NOT EXISTS `tmp_detail_jual` (
  `idCustomer` bigint(20) NOT NULL,
  `tglTransaksi` datetime NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` float NOT NULL,
  `hargaJual` float NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `idBarang` bigint(20) DEFAULT NULL,
  `diskon_persen` int(11) NOT NULL DEFAULT '0',
  `diskon_rupiah` decimal(15,2) NOT NULL DEFAULT '0.00',
  `diskon_detail_uids` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `barcode` (`barcode`),
  KEY `username` (`username`),
  KEY `idCustomer` (`idCustomer`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `tmp_detail_jual`
--

INSERT INTO `tmp_detail_jual` (`idCustomer`, `tglTransaksi`, `barcode`, `jumBarang`, `hargaBeli`, `hargaJual`, `username`, `uid`, `idBarang`, `diskon_persen`, `diskon_rupiah`, `diskon_detail_uids`) VALUES
(1, '2014-08-05 16:00:15', '90909090', 1, 7500, 25000, 'kasir1', 76, 3, 0, -15625.00, '{"1":-15625}');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_detail_retur_barang`
--

CREATE TABLE IF NOT EXISTS `tmp_detail_retur_barang` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTransaksiRetur` bigint(20) NOT NULL,
  `tglTransaksi` datetime NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` bigint(20) DEFAULT NULL,
  `hargaJual` bigint(20) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_edit_detail_beli`
--

CREATE TABLE IF NOT EXISTS `tmp_edit_detail_beli` (
  `idDetailBeli` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTransaksiBeli` bigint(20) NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `tglExpire` date NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` bigint(20) NOT NULL,
  PRIMARY KEY (`idDetailBeli`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112276 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_edit_detail_retur_beli`
--

CREATE TABLE IF NOT EXISTS `tmp_edit_detail_retur_beli` (
  `idDetailBeli` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTransaksiBeli` bigint(20) NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `tglExpire` date NOT NULL,
  `jumBarang` int(10) NOT NULL,
  `hargaBeli` bigint(20) NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `jumRetur` int(11) NOT NULL,
  PRIMARY KEY (`idDetailBeli`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10047776 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_harga_banded`
--

CREATE TABLE IF NOT EXISTS `tmp_harga_banded` (
  `barcode` varchar(25) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` float NOT NULL,
  PRIMARY KEY (`barcode`,`user_name`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_pesan_barang`
--

CREATE TABLE IF NOT EXISTS `tmp_pesan_barang` (
  `username` varchar(30) NOT NULL,
  `idSupplier` int(3) NOT NULL,
  `idBarang` bigint(20) NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `jumBarang` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksibeli`
--

CREATE TABLE IF NOT EXISTS `transaksibeli` (
  `idTransaksiBeli` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglTransaksiBeli` date DEFAULT NULL,
  `idSupplier` varchar(10) DEFAULT NULL,
  `nominal` bigint(20) DEFAULT '0',
  `idTipePembayaran` int(3) DEFAULT NULL,
  `idUser` int(3) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `NomorInvoice` varchar(15) NOT NULL DEFAULT '0',
  `username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idTransaksiBeli`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `transaksibeli`
--

INSERT INTO `transaksibeli` (`idTransaksiBeli`, `tglTransaksiBeli`, `idSupplier`, `nominal`, `idTipePembayaran`, `idUser`, `last_update`, `NomorInvoice`, `username`) VALUES
(1, '2010-03-26', '5', 300000, 2, NULL, '2010-03-26', '001', 'ariefadmin'),
(2, '2010-03-26', '3', 310000, 1, NULL, '2010-03-26', '0', 'ariefadmin');

-- --------------------------------------------------------

--
-- Table structure for table `transaksijual`
--

CREATE TABLE IF NOT EXISTS `transaksijual` (
  `idTransaksiJual` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglTransaksiJual` datetime DEFAULT NULL,
  `idCustomer` varchar(10) DEFAULT NULL,
  `tglKirimBarang` date DEFAULT NULL,
  `idTipePembayaran` int(3) DEFAULT NULL,
  `nominal` bigint(20) DEFAULT '0',
  `idUser` int(3) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `uangDibayar` bigint(20) DEFAULT NULL,
  `jumlah_poin` int(11) DEFAULT '0',
  PRIMARY KEY (`idTransaksiJual`),
  KEY `idUser` (`idUser`),
  KEY `tglTransaksiJual` (`tglTransaksiJual`),
  KEY `nominal` (`nominal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `transaksijual`
--

INSERT INTO `transaksijual` (`idTransaksiJual`, `tglTransaksiJual`, `idCustomer`, `tglKirimBarang`, `idTipePembayaran`, `nominal`, `idUser`, `last_update`, `uangDibayar`, `jumlah_poin`) VALUES
(1, '2010-03-26 20:32:45', '1', NULL, 1, 4688, 1, '2010-03-26', 5000, 0),
(2, '2010-03-26 20:36:14', '1', NULL, 1, 19375, 10, '2010-03-26', 20000, 0),
(3, '2014-08-05 15:53:05', '1', NULL, 1, 9375, 10, '2014-08-05', 0, 0),
(4, '2014-08-05 15:56:21', '1', NULL, 1, 10000, 10, '2014-08-05', 10000, 0),
(5, '2016-06-18 06:29:58', '1', NULL, 1, 30625, 7, '2016-06-18', 40000, 0),
(6, '2016-06-18 06:33:33', '1', NULL, 1, 53282, 8, '2016-06-18', 60000, 0),
(7, '2016-06-18 06:36:41', '1', NULL, 1, 7032, 7, '2016-06-18', 10000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksikas`
--

CREATE TABLE IF NOT EXISTS `transaksikas` (
  `idTransaksiKas` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglTransaksiKas` date DEFAULT NULL,
  `idUser` int(3) DEFAULT NULL,
  `kasAwal` bigint(20) DEFAULT NULL,
  `kasAkhir` bigint(20) DEFAULT '0',
  `kasSeharusnya` bigint(20) DEFAULT '0',
  PRIMARY KEY (`idTransaksiKas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksikasir`
--

CREATE TABLE IF NOT EXISTS `transaksikasir` (
  `idTransKasir` bigint(20) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL COMMENT 'idUser of the Cashier',
  `jumlahTransaksi` bigint(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `approvedBy` int(11) NOT NULL COMMENT 'idUser of the Approver',
  `tglTransaksi` datetime NOT NULL,
  PRIMARY KEY (`idTransKasir`),
  KEY `idUser` (`idUser`,`tglTransaksi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksireturjual`
--

CREATE TABLE IF NOT EXISTS `transaksireturjual` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglTransaksi` datetime DEFAULT NULL,
  `idCustomer` varchar(10) DEFAULT NULL,
  `nominal` bigint(20) DEFAULT '0',
  `idUser` int(3) DEFAULT NULL,
  `idKasir` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `tglTransaksi` (`tglTransaksi`),
  KEY `nominal` (`nominal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksitransferbarang`
--

CREATE TABLE IF NOT EXISTS `transaksitransferbarang` (
  `idTransaksi` bigint(20) NOT NULL AUTO_INCREMENT,
  `tglTransaksi` datetime DEFAULT NULL,
  `idCustomer` varchar(10) DEFAULT NULL,
  `tglKirimBarang` date DEFAULT NULL,
  `idTipePembayaran` int(3) DEFAULT NULL,
  `nominal` bigint(20) DEFAULT '0',
  `idUser` int(3) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`idTransaksi`),
  KEY `idUser` (`idUser`),
  KEY `tglTransaksi` (`tglTransaksi`),
  KEY `nominal` (`nominal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(3) NOT NULL,
  `namaUser` varchar(30) DEFAULT NULL,
  `idLevelUser` int(2) DEFAULT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `pass` varchar(35) DEFAULT NULL,
  `currentWorkstation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `namaUser`, `idLevelUser`, `uname`, `pass`, `currentWorkstation`) VALUES
(7, 'admin', 2, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL),
(8, 'input', 3, 'input', 'a43c1b0aa53a0c908810c06ab1ff3967', NULL),
(10, 'kasir1', 4, 'kasir1', '29c748d4d8f4bd5cbc0f3f60cb7ed3d0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workstation`
--

CREATE TABLE IF NOT EXISTS `workstation` (
  `idWorkstation` bigint(20) NOT NULL AUTO_INCREMENT,
  `namaWorkstation` varchar(30) NOT NULL,
  `workstation_address` varchar(30) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `printer_type` enum('pdf','rlpr','text') NOT NULL DEFAULT 'pdf' COMMENT 'types: pdf - Adobe PDF, rlpr: remote lpr (for unix/linux), text: Text/plain',
  `printer_commands` varchar(100) NOT NULL,
  `send_cdopen_commands` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=tidak, 1=Ya',
  `send_autocut_commands` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=Tidak, 1=Ya',
  PRIMARY KEY (`idWorkstation`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `workstation`
--

INSERT INTO `workstation` (`idWorkstation`, `namaWorkstation`, `workstation_address`, `keterangan`, `printer_type`, `printer_commands`, `send_cdopen_commands`, `send_autocut_commands`) VALUES
(1, 'kasir1', '192.168.1.1', '', 'pdf', '-H 192.168.1.1 -P printer192.168.1.1', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

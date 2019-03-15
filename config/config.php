<?php

date_default_timezone_set('Asia/Jakarta');
//echo date_default_timezone_get();
//echo date("Y-m-d H:i:s");


$server = "localhost";
$username = "root";
$password = ""; //"NATH44YUkepanj3n"
$database = "nathaayu";

// disable error message level E_NOTICE
//error_reporting(E_ALL);
//error_reporting(E_ALL ^ E_NOTICE);
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED ^ E_WARNING);
//error_reporting(0);


// Koneksi dan memilih database di server
mysql_connect($server,$username,$password) or die("Koneksi gagal");
mysql_select_db($database) or die("Database tidak bisa dibuka");



// ================= STOP KONFIGURASI ==========================



?>

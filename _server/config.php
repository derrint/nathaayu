<?php

$server = "localhost";
$username = "u803624213_admin";
$password = "nathaayudodik";
$database = "u803624213_na";

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

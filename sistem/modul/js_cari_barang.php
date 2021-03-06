<?php
/* js_cari_barang.php ------------------------------------------------------
  version: 1.01

  Part of AhadPOS : http://ahadpos.com
  License: GPL v2
  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
  http://vlsm.org/etc/gpl-unofficial.id.html

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License v2 (links provided above) for more details.
  ---------------------------------------------------------------- */

include "../../config/config.php";
?>

<SCRIPT TYPE="text/javascript">
<!--
   function targetopener(mylink, closeme, closeonly)
   {
      if (!(window.focus && window.opener))
         return true;
      window.opener.focus();
      if (!closeonly)
         window.opener.location.href = mylink.href;
      if (closeme)
         window.close();
      return false;
   }
//-->
</SCRIPT>


<?php
$caller = $_GET[caller];
?>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />

<form method="post" action="<?php echo $caller; ?>.php?act=caricustomer&action=tambah">
   <?php
   /*
     <table>
     <tr>

     //echo "<td>Barcode</td><td>: <select name='barcode' id='barcode1'>";
     // ambil daftar barang
     //$sql="SELECT namaBarang,barcode,hargaJual
     //	FROM barang FORCE INDEX (barcode) ORDER BY barcode ASC";
     //$namaBarang=mysql_query($sql);
     //while($brg = mysql_fetch_array($namaBarang)){
     //	echo "<option value='$brg[barcode]'>$brg[barcode] - $brg[namaBarang] - Rp ".number_format($brg[hargaJual],0,',','.')."</option>\n";
     //}
     //echo "</select> </td> <td><input type=submit name=PilihBarcode value='Pilih Barcode' onClick=\"return targetopener(this,true)\">";
     ?>
     </td>
     </tr>
     </table>
    * 
    */
   ?>
   <?php
   $sql = "SELECT * FROM barang WHERE namaBarang LIKE '%".$_POST[namabarang]."%' AND jumBarang > 0 ORDER BY IFNULL(NULLIF(nonAktif,'0'),0), namaBarang ASC";
//$sql = "SELECT * FROM barang WHERE match(namaBarang) against ('+\"".$_POST[namabarang]."\"' in boolean mode) ORDER BY namaBarang ASC ";
//$sql = "SELECT * FROM barang WHERE match(namaBarang) against ('".$_POST[namabarang]."' in boolean mode) ORDER BY namaBarang ASC ";
//echo $sql;
   $query = mysql_query($sql);

   $transferahad = '';
   if ($_POST['transferahad'] == 1) {
      $transferahad = '&transferahad=1';
   }
   $jumBarang = '&jumBarang=1';
   if (isset($_POST['jumBarang'])) {
      $jumBarang = '&jumBarang='.$_POST['jumBarang'];
   }
   ?>
   <table class="tabel" style="width:100%">
      <tr>
         <th>Barcode</th>
         <th>Nama Barang</th>
         <th>Stok</th>
         <th>Harga</th>
         <th>Pilih</th>
      </tr>
      <?php
      $no = 1;
      $adaNonAktif = false;
      while ($data = mysql_fetch_array($query)) :
         $nonAktif = $data['nonAktif'] == 1 ? true : false;
         if ($nonAktif) {
            $adaNonAktif = true;
         }

         $s_tmp_detail_jual = "SELECT jumBarang FROM tmp_detail_jual WHERE barcode = '".$data['barcode']."' AND date(tglTransaksi) = '".date('Y-m-d')."' LIMIT 1";      
         $q_tmp_detail_jual = mysql_query($s_tmp_detail_jual);
         $r_tmp_detail_jual = mysql_fetch_array($q_tmp_detail_jual);

         $masuk_keranjang = !empty($r_tmp_detail_jual['jumBarang']) ? $r_tmp_detail_jual['jumBarang'] : 0 ;
         $stok_live = $data['jumBarang']-$masuk_keranjang;
         // $stok_note = ($masuk_keranjang>0) ? " (".$masuk_keranjang." sudah masuk)" : "" ;

         ?>
         <tr class="<?php echo $no % 2 === 0 ? 'alt' : ''; ?> <?php echo $nonAktif ? 'merah' : '' ?>">
            <td><?php echo $data['barcode']; ?></td>
            <td><?php echo $data['namaBarang']; ?></td>
            <td class="right"><?php echo $stok_live;?></td>
            <td class="right"><?php echo number_format($data['hargaJual'], 0, ',', '.'); ?></td>
            <td class="center">
               <?php if($stok_live >= $_POST['jumBarang']){?>
                  <a class="pilih" href="<?php echo $caller; ?>.php?act=caricustomer&action=tambah&barcode=<?php echo $data['barcode'].$transferahad.$jumBarang; ?>" onClick="return targetopener(this, true)">[Pilih]</a> 
               <?php }else{
                  ?>
                  <i>stok tidak cukup</i>
                  <?php
               } ?>
            </td>
         </tr>
         <?php
         $tot_pembelian += $total;
         $no++;
      endwhile;
      ?>
   </table>

</form>
<?php
if ($adaNonAktif) {
   ?>
   <table>
      <tr>
         <td>&nbsp;</td>
         <td style="background-color: #f00">&nbsp;&nbsp;</td>
         <td>: Barang non aktif</td>
      </tr>
   </table>
   <?php
}
?>

<?php
/* CHANGELOG -----------------------------------------------------------

  1.0.1 / 2010-11.22 : Harry Sufehmi		: $_GET[caller] enable this script to be called from various module
  and return the result back properly
  1.0.1 / 2010-06-03 : Harry Sufehmi		: various enhancements, bugfixes
  0.7.5		    : Harry Sufehmi		: initial release

  ------------------------------------------------------------------------ */
?>

<?php
$fp = fopen("cachedshowdata.html","rb");
fpassthru($fp);
fclose($fp);
?>

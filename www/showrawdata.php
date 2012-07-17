<?php
header("Content-Type: text/plain");
$fp = fopen("/tmp/vote.txt","rb");
fpassthru($fp);
fclose($fp);
?>

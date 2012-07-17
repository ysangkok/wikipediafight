<?php
header("Content-type: application/json");
$f_contents = file("fa.txt"); 
$line = trim($f_contents[rand(0, count($f_contents) - 1)]);
echo json_encode(array("article" => $line));
?>

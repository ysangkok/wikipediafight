<?php
require_once("memoize.php");

$localgethostbyaddr = memoize("gethostbyaddr");

function iptoflag($ip) {
	global $localgethostbyaddr;
  	$imgsrc = "pmdci-flagpack_2.1.1/FLAGS/16/flag_" . strtolower(@geoip_country_code_by_name($localgethostbyaddr($ip))) . ".png";
	$cname = htmlentities(@geoip_country_name_by_name($localgethostbyaddr($ip)));
	if (empty($cname)) return "N/A";
	return "<span style='background-image: url($imgsrc);padding-left:35px;background-repeat: no-repeat'>$cname</span>";
}
?>

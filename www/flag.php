<?php
require_once("memoize.php");

$localgethostbyaddr = memoize("gethostbyaddr");

$map = json_decode(file_get_contents("iso3166.json"),true);

function memoizedgethostbyaddr($ip) {
	global $localgethostbyaddr;
	return $localgethostbyaddr($ip);
}

function codetoflag($code) {
	global $map;

	return codeandnametoflag($code, $map[strtoupper($code)][0]);
}

function iptoflag($ip) {
	global $localgethostbyaddr;
  	return codeandnametoflag(@geoip_country_code_by_name($localgethostbyaddr($ip)),@geoip_country_name_by_name($localgethostbyaddr($ip)));
}

function codeandnametoflag($code,$name) {
	$imgsrc = "pmdci-flagpack_2.1.1/FLAGS/16/flag_" . htmlentities(strtolower($code)) . ".png";
	$cname = htmlentities($name);
	if (empty($cname)) return "N/A";
	return "<span style='background-image: url($imgsrc);padding-left:35px;background-repeat: no-repeat'>$cname</span>";
}
?>

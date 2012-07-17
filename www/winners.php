<?php
require_once("flag.php");

function getmaxcountry($arr) {
	// $arr  is country to count
	arsort($arr);
	$keys = array_keys($arr);
	return $keys[0];
}

function winners() {
$c = file_get_contents("/tmp/vote.txt");
$ar = explode("\n", $c);
$counts = array();
$times = array();
$ips = array();
foreach ($ar as &$line) {
	$matches = json_decode("[$line]");
	if (sizeof($matches) < 3) continue;
	$p1win = $matches[0] !== true;
	if ($p1win) {
		if (!isset($counts[$matches[1]]))
			$counts[$matches[1]] = 1;
		else
			$counts[$matches[1]]++;
		$article = $matches[1];
	} else {
		if (!isset($counts[$matches[2]]))
			$counts[$matches[2]] = 1;
		else
			$counts[$matches[2]]++;
		$article = $matches[2];
	}
	if (isset($matches[3])) {
		$thinkingtime = (int) $matches[3];
		if (!isset($times[$article]))
			$times[$article] = array();
		if ($thinkingtime > 0)
			$times[$article][] = $thinkingtime;
	}
	if (isset($matches[4])) {
		if (!isset($ips[$article]))
			$ips[$article] = array();
		$ips[$article][] = $matches[4];
	}
}


arsort($counts);
$keys = array_keys($counts);
$winners = array();
for ($i=0; $i<10; $i++) {

	$countries = array();
	foreach ($ips[$keys[$i]] as $ip) {
		$host = memoizedgethostbyaddr($ip);
		$countryname = @geoip_country_code_by_name($host);
		$article = $keys[$i];
		if (!empty($countryname)) {
			if (!isset($countries[$countryname]))
				$countries[$countryname] = 0;
			$countries[$countryname]++;
		}
	}
	//print_r($countries);

	//$average = array_sum($times[$article]) / sizeof($times[$article]);
	$sum = array_reduce($times[$keys[$i]], function($a,$b){return $a+$b;});
	$average = $sum / count($times[$keys[$i]]);
	$country = getmaxcountry($countries);
	$winners[] = array("article" => $keys[$i], "count" => (int) $counts[$keys[$i]], "avgthinktime" => $average, "country" => $country);
}
return $winners;
}

?>

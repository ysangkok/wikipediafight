<?php
function winners() {
$c = file_get_contents("/tmp/vote.txt");
$ar = explode("\n", $c);
$counts = array();
foreach ($ar as &$line) {
	preg_match("/^([a-z]+),(\".*\"),(\".*\")/",$line,$matches);
	if (sizeof($matches) != 4) continue;
	$p1win = $matches[1] !== "true";
	if ($p1win) {
		if (!isset($counts[$matches[2]]))
			$counts[$matches[2]] = 1;
		else
			$counts[$matches[2]]++;
	} else {
		if (!isset($counts[$matches[3]]))
			$counts[$matches[3]] = 1;
		else
			$counts[$matches[3]]++;
	}
}
arsort($counts);
$keys = array_keys($counts);
$winners = array();
for ($i=0; $i<10; $i++) {
	$winners[] = array("article" => json_decode($keys[$i]) , "count" => (int) $counts[$keys[$i]]);
}
return $winners;
}

?>

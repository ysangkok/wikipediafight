<?php
header("Content-type: application/json");
ini_set('user_agent', 
  'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3');
function get($unlike = null) {

$oldurl = "http://en.wikipedia.org/wiki/Special:Random";
$headers = get_headers($oldurl);
foreach ($headers as &$v) {
	if (stripos($v,"Location") === 0) {
		$url = trim(substr($v,9));
		break;
	}
}

/*
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,$oldurl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HEADER, 1);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
$html = curl_exec($ch);
$url = curl_getinfo($ch,CURLINFO_EFFECTIVE_URL);           
curl_close($ch);
*/
$part = urldecode(substr($url, strrpos($url,"/")+1));
if ($unlike == null || $unlike != $part)
return json_encode(array("article" => $part));
else
return get($unlike);
}
if (isset($_GET["unlike"]))
	echo get($_GET["unlike"]);
else
	echo get();
?>

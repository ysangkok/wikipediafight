<?php
define("TESTING", false);
if (!TESTING) ob_start();
chdir("www");
require_once("flag.php");
require_once("winners.php");
define("NUM", 50);
function fmtlnk($org) {
	$p1rawurl = str_replace("\'","'",$org);
	$p1text = htmlentities( limit_text($p1rawurl,5),ENT_QUOTES,"UTF-8");
	return $p1text;
}
function fmturl($org) {
	$p1rawurl = str_replace("\'","'",$org);
	$p1link = urlencode(str_replace(" ","_",$p1rawurl));
	return $p1link;
}
function limit_text($text, $limit) {
      if (str_word_count($text,0) > $limit) {
          $words = str_word_count($text, 2);
          $pos = array_keys($words);
          $text = substr($text, 0, $pos[$limit]) . '...';
      }
      return $text;
}

$lasttime = 0;

while(true) {
if (microtime(true) - $lasttime < 5) {
	file_put_contents("php://stderr","Sleeping...\n");
	sleep(1);
	continue;
}
file_put_contents("php://stderr","Generating...\n");

$lasttime = microtime(true);
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="//current.bootstrapcdn.com/bootstrap-v204/css/bootstrap-combined.min.css" />
<script src="//current.bootstrapcdn.com/bootstrap-v204/js/bootstrap.min.js" type="text/javascript"></script>
<meta charset="UTF-8" />
<title>Wikipedia Fight Winners Listing</title>
<style type="text/css">
.winner {
font-weight:bold;
}
body {
margin: 1em;
}
</style>
</head>
<body>
<h1>Wikipedia Fight Results</h1>
<h2>Winners</h2>
<table class="table table-striped table-condensed">
<tr><th>article<th>count<th>voter majority origin<th>average consideration time [seconds]</tr>
<?php
$winners = winners();
foreach ($winners as $winner) {
	$countryhtml = codetoflag($winner["country"]);
	$output_thinking_time = number_format($winner['avgthinktime'] / 1000, 1, '.', '');
	echo "<tr><td><a href='http://en.wikipedia.org/wiki/" . fmturl($winner["article"]) . "'>" . fmtlnk($winner['article']) . "</a><td>${winner['count']}<td>$countryhtml<td>$output_thinking_time</tr>\n";
}

$c = file_get_contents("/tmp/vote.txt");
$ar = array_reverse(explode("\n", $c));
?>
</table>
<h2>Votes</h2>
<p>Last <?php echo NUM; ?> shown. Most recent first. Winner in bold.</p>
<p>Total number of votes: <?php echo sizeof($ar); ?></p>
<p>Get <a href="showrawdata.php">raw data</a>.</p>
<table class="table table-striped table-condensed">
<tr><th>page 1<th>page 2<th>consideration time [seconds]<th>country</tr>
<?php



$i = 0;
foreach ($ar as &$line) {
	if ($i++ > NUM) break;
	$matches = json_decode("[$line]");
	if (sizeof($matches) < 3) continue;
	$p1win = $matches[0] !== true;
	if ($p1win) {
		$winstr1 = " class='winner'";
		$winstr2 = "";
	} else {
		$winstr1 = "";
		$winstr2 = " class='winner'";
	}
	$p1link =  fmturl($matches[1]);
	$p2link =  fmturl($matches[2]);
	$p1text = fmtlnk($matches[1]);
	$p2text = fmtlnk($matches[2]);
	$p1html = "<a href='http://en.wikipedia.org/wiki/$p1link'>$p1text</a>";
	$p2html = "<a href='http://en.wikipedia.org/wiki/$p2link'>$p2text</a>";
	if (sizeof($matches) > 3) {
		$thinkingtime = (int) $matches[3];
		$remote_addr = (string) $matches[4];
		$unix_time = (int) $matches[5];
		$output_thinking_time = number_format($thinkingtime / 1000, 1, '.', '');
		$flaghtml = iptoflag($remote_addr);
		echo "<tr><td$winstr1>$p1html<td$winstr2>$p2html<td>$output_thinking_time<td>$flaghtml</tr>\n";
	} else {
		echo "<tr><td$winstr1>$p1html<td$winstr2>$p2html</tr>\n";
	}
}
?>
</table>
<div>Genetated on <?php echo date("r"); ?>.</div>
</body>
</html>
<?php
if (!TESTING) {
$c = ob_get_contents();
ob_clean();
file_put_contents("cachedshowdata.html", $c);
file_put_contents("php://stderr","Wrote new page...\n");
} else {
break;
}
}
?>

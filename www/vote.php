<?php
session_start();

function doWrite() {
global $thinkingtime;

$line = "";
$line .= $_POST["firstonebetter"];
$line .= ",";
$line .= json_encode($_POST["p1"]);
$line .= ",";
$line .= json_encode($_POST["p2"]);
$line .= ",";
$line .= $thinkingtime;
$line .= ",";
$line .= json_encode($_SERVER["REMOTE_ADDR"]);
$line .= ",";
$line .= (int) microtime(true);
$line .= "\n";

file_put_contents("/tmp/vote.txt", $line, FILE_APPEND | LOCK_EX);
}
if (!isset($_POST["firstonebetter"])) throw new Exception("missing argument!");
if (!isset($_POST["p1"])) throw new Exception("missing argument!");
if (!isset($_POST["p2"])) throw new Exception("missing argument!");
if (!isset($_POST["thinkingtime"])) $thinkingtime = -1;
else
$thinkingtime = (int) $_POST["thinkingtime"];

if ($_POST["firstonebetter"] != "false")
if ($_POST["firstonebetter"] != "true")
throw new Exception("not allowed");

if ($_POST["firstonebetter"] === "true")
	if (isset($_SESSION[$_POST["p1"]]))
		throw new Exception("already voted!");
	else
		$_SESSION[$_POST["p1"]] = 1;
if ($_POST["firstonebetter"] === "false")
	if (isset($_SESSION[$_POST["p2"]]))
		throw new Exception("already voted!");
	else
		$_SESSION[$_POST["p2"]] = 1;

doWrite();
?>

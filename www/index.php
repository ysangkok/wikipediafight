<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Random Wikipedia page!</title>
<style type="text/css">
body{vertical-align:bottom}
html, body, .div2, .div1, iframe { margin:0; padding:0; height:90%; }
.div2 { top: 90%; height: 10%; position:fixed; }
button { width: 50%; height: 10%; display:block; position: fixed; }
iframe { position: fixed;  width:50%; }
#iframe2 { left: 50%; }
#b2 { left:50%; }
button { font-size:xx-large; }
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
var loaded1, loaded2, startthinkingtime;
var prefix = function() {
	var isMobile = (/iPhone|iPod|iPad|Android|BlackBerry/).test(navigator.userAgent);
	if (isMobile) {
		return "http://en.m.wikipedia.org/wiki/";
	} else {
		return "http://en.wikipedia.org/wiki/";
	}
}();
var setButtons = function(enab) {
	$("#b1").attr("disabled", !enab);
	$("#b2").attr("disabled", !enab);
}
var click = function (firstonebetter) {
	//var p1e = $("#iframe1");
	//var p2e = $("#iframe2");
	//var p1 = p1e.contents().find("title").text();
	//var p2 = p2e.contents().find("title").text();
	var p1 = loaded1;
	var p2 = loaded2;

	var endthinkingtime = (new Date()).getTime();
	var thinkingtime = endthinkingtime - startthinkingtime;

	$.post("vote.php", { firstonebetter: firstonebetter, p1: p2 , p2: p1, thinkingtime: thinkingtime } );
};
var reload = function() {
	$.get("getrand.php", function(data1) {
		$.get("getrand.php?unlike=" + encodeURIComponent(data1.article), function(data2) {
			loaded1 = data1.article;
			loaded2 = data2.article;

			document.getElementById("iframe1").src = "about:blank";
			document.getElementById("iframe2").src = "about:blank";
			document.getElementById("iframe1").src = prefix + encodeURIComponent(loaded1);
			document.getElementById("iframe2").src = prefix + encodeURIComponent(loaded2);
			setButtons(true);
			startthinkingtime = (new Date()).getTime();

		});
	});
};
var b1 = function() {
	setButtons(false);
	click(true);
	reload();
};
var b2 = function() {
	setButtons(false);
	click(false);
	reload();
};
//$.ready(function(){
//reload();
//});
</script>

  </head>
  <body>
<div class="div1">
    <iframe  id="iframe1" src="about:blank"></iframe>
    <iframe  id="iframe2" src="about:blank"></iframe>
</div>
<div class="div2">
<button disabled="yes" onclick="javascript:b1();" id="b1">This one's better!</button>
<button disabled="yes" onclick="javascript:b2();" id="b2">No, this one's better!</button>
</div>
<script>
reload();
</script>
  </body>
</html>

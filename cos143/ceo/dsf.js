function $(ele) {
	return document.getElementById(ele);
}
var time = 0;
var new = ""

function timer() {
	clearTimeout(time);
	time = setTimeout("updateTweets()",60000);
}
function updateTweets() {
	
	var myRequest;
	
	
	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	myRequest.open("GET","http://www.newtwitter.com/mytweets");
	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			$(document).createElement(new);
		}
	};
	myRequest.send(updateHTML);	
}

function updateHTML(){
	$.insertBefore(new);
}
console.log()
window.onload = timer;
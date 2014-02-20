//search.js

function $(ele) {
	return document.getElementById(ele);
}
var time = 0;
var parameter="";

function main() {
	//normal search check test
	//$("search").addEventListener("click",search,false);
	
	//live search check
	$("text").onkeyup = timer; //when txt is typed
	//$("name").addEventListener("checked",search,false) //radio buttons checked, fire search
}
function timer() {
	clearTimeout(time);
	time = setTimeout("search()",500);
}
function search() {
	
	var myRequest;
	
	//name box text
	if ($("name").checked) {
		parameter = "Name="+$("text").value;
		console.log(parameter)
	}
	//industry box text
	if ($("industry").checked) {
		parameter = "Industry="+$("text").value;
		console.log(parameter)
	}
	//location box text
	if ($("location").checked) {
		parameter = "Location="+$("text").value;
		console.log(parameter)
	}
	
	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	myRequest.open("GET","http://cse.taylor.edu/~jgeisler/cos143/project/execs.php?" + parameter);
	//myRequest.setRequestHeader('content-type','application')
	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			$("ceoDisplay").innerHTML = myRequest.responseText;
			
		}
	};
	myRequest.send();	
}
console.log()
window.onload = main;
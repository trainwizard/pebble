function $(ele) {
	return document.getElementById(ele);
}

function main() {

	changeLogonButton();
	
	$("signupButton").onclick = registerFunction;
	
	$("passBox").onkeypress = function(e) {
		if(e.keyCode == 13) $("signupButton").click();
	}

	var myRequest;

	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}

	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			if (myRequest.responseText.indexOf("Currently logged in as") != -1) {
				$("content").innerHTML = "You are already Logged in";
			}
		}
	};

	myRequest.open("GET","http://cse.taylor.edu/~jgeisler/cos143/project/sessions.php",true);
	myRequest.send(null);
	
}

function registerFunction() {

	var name = $("nameBox").value;
	var pass = $("passBox").value;
	
	var myRequest;

	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}

	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			window.location = "login.html";
		}
	};

	myRequest.open("POST","http://cse.taylor.edu/~jgeisler/cos143/project/users.php",true);
	myRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	myRequest.send("Name=" + name + "&Password=" + pass);

}

window.onload = main;

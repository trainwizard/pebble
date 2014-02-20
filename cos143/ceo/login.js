function $(ele) {
	return document.getElementById(ele);
}

function main() {

	changeLogonButton();

	$("loginButton").onclick = doLogin;
	
	$("passBox").onkeypress = function(e) {
		if(e.keyCode == 13) $("loginButton").click();
	}
	
	var myRequest;

	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}

	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			if (myRequest.responseText.indexOf("Current User") != -1) {
				$("content").innerHTML = "";
			}
		}
	};

	myRequest.open("GET","http://cse.taylor.edu/~jgeisler/cos143/project/sessions.php",true);
	myRequest.send(null);
	
}

function doLogin() {
	
	var name = $("nameBox").value;
	var pass = $("passBox").value;
	
	var myRequest;

	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	myRequest.open("POST","http://cse.taylor.edu/~jgeisler/cos143/project/sessions.php",true);
	myRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	myRequest.send("Name=" + name + "&Password=" + pass);
	
	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			findError(myRequest.responseText);
		}
	};
	
}

function findError(respTxt) {
	
	if (respTxt.indexOf("Unable to match") == -1) {
		window.location = 'settings.html';
	} else {
		alert("UserName or password incorrect, please try again.");
		window.location.reload();
	}
	
}

window.onload = main;

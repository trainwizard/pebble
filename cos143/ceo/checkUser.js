function changeLogonButton() {
	var respTxt;
	var myRequest;

	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}

	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			chLoginButton(myRequest.responseText);
		}
	};

	myRequest.open("GET","http://cse.taylor.edu/~jgeisler/cos143/project/sessions.php",true);
	myRequest.send(null);
}

function chLoginButton(respTxt) {
	if (respTxt.indexOf("Currently logged in as") != -1) {
		$("loginMenu").innerHTML = "<a href='JavaScript:void(0)' id='logoutButton'>Log Out</a>";
		$("signupMenu").parentNode.removeChild($("signupMenu"));
		$("logoutButton").onclick = doLogout;
	}
}
function doLogout() {
	
	var myRequest;

	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}

	myRequest.open("POST","http://cse.taylor.edu/~jgeisler/cos143/project/sessions.php",true);
	myRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	myRequest.send("method=delete");

	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			window.location.reload();
		}
	};
	
}

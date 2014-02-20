function $(ele) {
	return document.getElementById(ele);
}

function main() {

	changeLogonButton();
	var respTxt;
	var myRequest;
	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	myRequest.open("GET","http://cse.taylor.edu/~jgeisler/cos143/project/sessions.php",true);
	myRequest.send(null);
	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			checkLogin(myRequest.responseText);
		}
	};
}
function checkLogin(respTxt) {
	if (respTxt.indexOf("Currently logged in as") != -1) {
		if (respTxt.indexOf("if.<") != -1) {
			//
		} else {
			$("content").innerHTML = '\
					<div class="forms">\
						<form>\
							New username: <input type="text" name="Name" id="nameBox" />\
							<br>\
							New password: <input type="password" name="Password" id="passBox" />\
							<input id="changeButton" type="button" value="Update" />\
						</form>\
					</div>\
				';
				
			$("changeButton").onclick = Update;
	
			$("passBox").onkeypress = function(e) {
				if(e.keyCode == 13) $("changeButton").click();
			}
		}
	}
}

function Update() {
	
	var name = $("nameBox").value;
	var pass = $("passBox").value;
	var myRequest;
	if (window.XMLHttpRequest) {
	  myRequest = new XMLHttpRequest();
	} else {
	  myRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	myRequest.open("POST","http://cse.taylor.edu/~jgeisler/cos143/project/users.php",true);
	myRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	myRequest.send("method=put&Name=" + name + "&Password=" + pass);
	myRequest.onreadystatechange = function() {
		if (myRequest.readyState === 4) {
			window.location.reload();
		}
	};
}
window.onload = main;

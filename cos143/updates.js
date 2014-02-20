//1 MINUTE
function update1M(){
var myRequest;

if (window.XMLHttpRequest) {
    myRequest = new XMLHttpRequest();
}

myRequest.onreadystatechange = function(){
    console.log("We were called!");
	console.log(myRequest.readyState);
	
	
	if (myRequest.readyState === 4) {
        
		//1 minute
        var minute1 = document.getElementById("minute1");
		var ol1 = minute1.children[1];
		var li1 = document.createElement("li");
		var minute1TxtNode = document.createTextNode(myRequest.responseText);
		li1.appendChild(minute1TxtNode);
		ol1.appendChild(li1)
		
	}	
};



myRequest.open('GET', 'http://cse.taylor.edu/~jgeisler/cos143/time.php', true);
myRequest.send(null);
}

var sec=1000;
setInterval(update1M, sec);
//
//5 MINUTE
//

function update5M(){
var myRequest;

if (window.XMLHttpRequest) {
    myRequest = new XMLHttpRequest();
}

myRequest.onreadystatechange = function(){
    console.log("We were called!");
	console.log(myRequest.readyState);
	
	
	if (myRequest.readyState === 4) {
        
		//5 minutes
		var minute5 = document.getElementById("minute5");
		var ol5 = minute5.children[1];
		var li5 = document.createElement("li");
		var minute1TxtNode = document.createTextNode(myRequest.responseText);
		li5.appendChild(minute1TxtNode);
		ol5.appendChild(li5)
		
	}	
};



myRequest.open('GET', 'http://cse.taylor.edu/~jgeisler/cos143/time.php', true);
myRequest.send(null);
}

var sec=5000;
setInterval(update5M, sec);
//
//15 MINUTE
//
function update15M(){
var myRequest;

if (window.XMLHttpRequest) {
    myRequest = new XMLHttpRequest();
}

myRequest.onreadystatechange = function(){
    console.log("We were called!");
	console.log(myRequest.readyState);
	
	
	if (myRequest.readyState === 4) {
        
		//15 minutes
		var minute5 = document.getElementById("minute15");
		var ol15 = minute5.children[1];
		var li15 = document.createElement("li");
		var minute1TxtNode = document.createTextNode(myRequest.responseText);
		li15.appendChild(minute1TxtNode);
		ol15.appendChild(li15)
		
	}	
};



myRequest.open('GET', 'http://cse.taylor.edu/~jgeisler/cos143/time.php', true);
myRequest.send(null);
}

var sec=15000;
setInterval(update15M, sec);
//
//60 MINUTE
//
function update60M(){
var myRequest;

if (window.XMLHttpRequest) {
    myRequest = new XMLHttpRequest();
}

myRequest.onreadystatechange = function(){
    console.log("We were called!");
	console.log(myRequest.readyState);
	
	
	if (myRequest.readyState === 4) {
        
		//60 minutes
		var minute60 = document.getElementById("minute60");
		var ol60 = minute60.children[1];
		var li60 = document.createElement("li");
		var minute1TxtNode = document.createTextNode(myRequest.responseText);
		li60.appendChild(minute1TxtNode);
		ol60.appendChild(li60)
		
	}	
};



myRequest.open('GET', 'http://cse.taylor.edu/~jgeisler/cos143/time.php', true);
myRequest.send(null);
}

var sec=60000;
setInterval(update60M, sec);
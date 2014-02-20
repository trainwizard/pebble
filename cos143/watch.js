//java
function refreshPage(){
var myRequest;

if (window.XMLHttpRequest) {
    myRequest = new XMLHttpRequest();
}

myRequest.onreadystatechange = function(){
    console.log("We were called!");
	console.log(myRequest.readyState);
	if (myRequest.readyState === 4) {
        
        document.getElementById("logins").innerHTML = 
		myRequest.responseText;
		}
};

myRequest.open('GET', 'http://cse.taylor.edu/~jgeisler/cos143/connect.php', true);
myRequest.send(null);

var sec = 1000;
setInterval(refreshPage, 2*sec);
}
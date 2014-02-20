var parameters ="Name=admin&Password=admin";
var xhr = new XHRHTTPRequest();
xhr.open('Post',URL);
xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
xhr.onreadystatechange = function(){

};
xhr.send(parameters);

var nameList = [];

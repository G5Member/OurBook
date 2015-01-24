/**
 * 
 */
function loadXMLDoc(filename)
{
	if(window.XMLHttpRequest)
	{
		xhr = new XMLHttpRequest();
	}
	else
	{
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhr.open("GET", filename, false);
	xhr.send();
	return xhr.responseXML;
}
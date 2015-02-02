<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
String user_id = request.getParameter("user_id");
if(!user_id.equals(session.getAttribute("user_id")))
{
	response.sendRedirect("404.jsp");
}
else
{
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Profile</title>
<script type="text/javascript" language="javascirpt">
function salingbook(str)
{
	var xhr;//xmlHttpRequest
	if(str.length == 0)
	{
		document.getElementById("userbook_block").innerHTML="您的图书信息将在此列出...";
		return ;
	}
	//for IE7+, Firefox, Chrome, Opera, Safari
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange=function()
	{
		if(xhr.readyState==4 && xhr.status==200)
		{
			document.getElementById("userbook_block").innerHTML=xhr.responseText;
		}
	}
	//window.open("userbook.jsp?user=owner&book_status=" + str);
	xhr.open("GET", "userbook.jsp?user=owner&book_status=" + str, true);
	xhr.send();
}
function boughtbook(str)
{
	var xhr;//xmlHttpRequest
	if(str.length == 0)
	{
		document.getElementById("userbook_block").innerHTML="您的图书信息将在此列出...";
		return ;
	}
	//for IE7+, Firefox, Chrome, Opera, Safari
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange=function()
	{
		if(xhr.readyState==4 && xhr.status==200)
		{
			document.getElementById("userbook_block").innerHTML=xhr.responseText;
		}
	}
	//window.open("userbook.jsp?user=buyer&book_status=" + str);
	xhr.open("GET", "userbook.jsp?user=buyer&book_status=" + str, true);
	xhr.send();	
}
</script>
</head>
<body>
</body>	
用户名：<%= session.getAttribute("user_id") %> <br />
昵称：<%= session.getAttribute("user_nickname") %> <br />
书币；<%= session.getAttribute("user_coins") %> <br />
图书
<a href="javascript:void(0)" onclick="salingbook('unchecked')">待审核</a> <br />
<a href="javascript:void(0)" onclick="salingbook('onsale')">出售中</a> <br />
<a href="javascript:void(0)" onclick="salingbook('saled')">已售出</a> <br />

<a href="javascript:void(0)" onclick="boughtbook('delivered')">未收货</a> <br />
<a href="javascript:void(0)" onclick="boughtbook('ackrecved')">已收货</a> <br />
<div id="userbook_block">您的图书信息将在此列出...</div>
<%	
}
%>


</html>
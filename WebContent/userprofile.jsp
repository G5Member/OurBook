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
</head>
<body>
</body>	
用户名：<%= session.getAttribute("user_id") %> <br />
昵称：<%= session.getAttribute("user_nickname") %> <br />
书币；<%= session.getAttribute("user_coins") %> <br />
图书

<%	
}
%>


</html>
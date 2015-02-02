<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user = request.getParameter("user");
String book_status = request.getParameter("book_status");
%>
<iframe src="userbookinfo.jsp?user=<%= user %>&book_status=<%= book_status %>" frameborder="0" width="500" height="600"></iframe>
</body>
</html>
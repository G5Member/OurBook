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
if(session.isNew() || session.getAttribute("admin_id")==null)
{
%>
<script type="text/javascript" language="javascirpt">
	alert("请先登录");
	window.document.location.href = "adminlogin.jsp";
</script>
<%
}
else
{
%>
欢迎登录管理员系统。管理员<%= session.getAttribute("admin_id") %> <a href="adminlogout.jsp">注销登录</a>
<%
}
%>
</body>
</html>
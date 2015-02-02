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
if(session.getAttribute("user_id") == null)
{
if(session.isNew() || session.getAttribute("admin_id") == null)
{
%>
<form action="adminlogincheck.jsp" method="POST">
用户名：<input type="text" name="admin_id" /><br />
密码<input type="password" name="admin_password" /><br />
<input type="submit" value="登录" />
<input type="reset" value="重置" />
</form>
<%
}
else
{
response.sendRedirect("adminmain.jsp");
}
}
else
{
%>
<script type="text/javascript" language="javascirpt">
	alert("请先退出用户账户...");
	window.document.location.href = "../index.jsp";
</script>
<%
}
%>
</body>
</html>
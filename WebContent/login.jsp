<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
用户登录模块
<%
if(session.isNew() || session.getAttribute("user_id") == null)
{
%>
<a href="register.jsp" >点我注册</a>
 <br />
<form action="logincheck.jsp" method="POST">
用户名：<input type="text" name="user_id" /><br />
密码<input type="password" name="user_password" /><br />
<input type="submit" value="登录" />
<input type="reset" value="重置" />
</form>
<%
}
else
{
%>
<%= session.getAttribute("user_id") %>,欢迎回来
<%= session.getAttribute("user_coins") %>书币
<a href="logout.jsp">登出</a>
<%
}
%>
<br />
</body>
</html>
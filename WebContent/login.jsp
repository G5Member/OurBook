<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<style type="text/css">
a:link,a:visited {text-decoration:none;}
a:hover{}

#login {
 width:240px; /*设定宽度*/
 text-align:left; /*文字左对齐*/
 float:left; /*浮动居左*/
 clear:left; /*不允许左侧存在浮动*/
 overflow:hidden; /*超出宽度部分隐藏*/

}
</style>
<script type="text/javascript" language="javascirpt">
function checkadmin()
{
	if(<%= session.getAttribute("admin_id") != null %>)
	{
		alert("请先退出管理员账户,然后刷新此页面...");
		return false;
	}
	else
	{
		return true;
	}
}
</script>


</head>
<body>
<div id="login">
<%
if(session.isNew() || session.getAttribute("user_id") == null)
{
%>
<a href="register.jsp" target="_blank">点我注册</a>
 <br />
<form action="logincheck.jsp" onsubmit="return checkadmin()" method="POST">
用户名：<input type="text" name="user_id" /><br />
密码：<input type="password" name="user_password" /><br />
<input type="submit" value="登录" />
<input type="reset" value="重置" />
</form>
<%
}
else
{
%>
<a href="userprofile.jsp?user_id=<%= session.getAttribute("user_id") %>"><%= session.getAttribute("user_nickname") %><a/>,欢迎
<%= session.getAttribute("user_coins") %>书币
<a href="logout.jsp">登出</a>
<br />
<a href="recharge.jsp" target="_blank">充值书币</a>
<%
}
%>
</div>
</body>
</html>
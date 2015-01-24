<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<br />
<a href="logout.jsp">登出</a>
<%
}
%>
<%

//out.println(request.getParameter("user_id"));
//out.println(request.getParameter("user_password"));
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
用户登录模块 <a href="register.jsp" >点我注册</a>
 <br />
<form action="logincheck.jsp" method="POST">
用户名：<input type="text" name="user_id" /><br />
密码<input type="password" name="user_password" /><br />
<input type="submit" value="登录" />
<input type="reset" value="重置" />
</form>
<%

out.println(request.getParameter("user_id"));
out.println(request.getParameter("user_password"));
%>
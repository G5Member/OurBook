<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%--@ include file="service/conn.jsp" --%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OurBook</title>
</head>
<body>
<% out.println("your ip address is " + request.getRemoteAddr()); %>
Today's date: <%= (new java.util.Date()).toLocaleString() %>
<br />
<c:out value="这句话使用jstl写出来的0.0" />

<%
   // 设置每隔5秒自动刷新
   //response.setIntHeader("Refresh", 1);
   // 获取当前时间
   Calendar calendar = new GregorianCalendar();
   String am_pm;
   int hour = calendar.get(Calendar.HOUR);
   int minute = calendar.get(Calendar.MINUTE);
   int second = calendar.get(Calendar.SECOND);
   if(calendar.get(Calendar.AM_PM) == 0)
      am_pm = "AM";
   else
      am_pm = "PM";
   String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
   out.println("Current Time is: " + CT + "\n");
%>

<br />
<!-- 新手引导 -->
<%@ include file="leading.jsp" %>
<!-- 用户登录 -->
<%@ include file="login.jsp" %>
<!-- 新书上架 -->
<%@ include file="newbook.jsp" %>
<!-- 书籍搜索 -->
<%@ include file="booksearch.jsp" %>
<!-- 购物车 -->
<%@ include file="cart.jsp" %>
<!-- 页面顶部 -->
<%@ include file="top.jsp" %>
<!-- 页面底部 -->
<%@ include file="bottom.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
<script type="text/javascript" language="javascript">
<!--
function gotosale()
{
	if(<%= (session.isNew() || session.getAttribute("user_id") == null) %>)
	{
		alert("先登录才可以出售书籍...");
	}
	else
	{
		var winH = 400;
		var winW = 400;
		var winT = (window.screen.availHeight - winH)/2;
		var winL = (window.screen.availWidth - winW)/2;
		window.open ("salebook.jsp", "salepage", "height="+ winH + ", width=" + winW + ", top=" + winT + ", left=" + winL); 
	}
}
-->
</script>
<!-- 页面顶部 -->
<jsp:include page="top.jsp" flush="true" />
<a href="javascript:void(0)" onclick="gotosale()">我要出售书籍</a>
<br />
<!-- 新手引导 -->
<jsp:include page="leading.jsp" flush="true" />
<!-- 新书上架 -->
<jsp:include page="newbook.jsp" flush="true" />
<!-- 页面底部 -->
<jsp:include page="bottom.jsp" flush="true" />
<br />
</body>
</html>
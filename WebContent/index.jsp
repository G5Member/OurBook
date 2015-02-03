<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OurBook</title>
<link rel="stylesheet" type="text/css" href="css.css" />
<script type="text/javascript" language="javascript">
function startTime()
{
var today=new Date()
var h=today.getHours()
var m=today.getMinutes()
var s=today.getSeconds()
// add a zero in front of numbers<10
m=checkTime(m)
s=checkTime(s)
document.getElementById('clockdiv').innerHTML=h+":"+m+":"+s
t=setTimeout('startTime()',500)
}

function checkTime(i)
{
if (i<10) 
  {i="0" + i}
  return i
}
</script>
</head>
<body onload="startTime()">
<div id="container">

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
<div id="Header">
<div id="clockdiv" style="background-color:#FDF5E6"></div>
<div id="menu">
　　　<ul>
　　　　<li><a href="index.jsp">首页</a></li>
　　　　<li class="menuDiv"></li>
　　　　<li><a href="javascript:void(0)" onclick="gotosale()">出售书籍</a></li>
　　　　<li class="menuDiv"></li>
　　　　<li><a href="#">联系我们</a></li>
　　　　<li class="menuDiv"></li>
	</ul>
</div>
<div id="banner">
</div>
</div>
<div id="PageBody">
<div id="SiderBar">
<!-- 用户登录 -->
<jsp:include page="login.jsp" flush="true" />
</div>
<div id="MainBody">
<!-- 书籍搜索 -->
<jsp:include page="searchframe.jsp" flush="true" />
<!-- 新书上架 -->
<jsp:include page="newbook.jsp" flush="true" />
</div>
</div>
<div id="Footer">
<!-- 页面底部 -->
<jsp:include page="bottom.jsp" flush="true" />
</div>
</div>
</body>
</html>
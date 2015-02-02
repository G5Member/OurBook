<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" language="javascirpt">

function get_book(str)
{
	var xhr;//xmlHttpRequest
	if(str.length == 0)
	{
		document.getElementById("bookinfo_block").innerHTML="图书信息将在此列出...";
		return ;
	}
	//for IE7+, Firefox, Chrome, Opera, Safari
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange=function()
	{
		if(xhr.readyState==4 && xhr.status==200)
		{
			document.getElementById("bookinfo_block").innerHTML=xhr.responseText;
		}
	}
	//window.open("adminbook.jsp?book_status=" + str);
	xhr.open("GET", "adminbook.jsp?book_status=" + str, true);
	xhr.send();
}
</script>

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
欢迎登录管理员系统。管理员<%= session.getAttribute("admin_id") %> <a href="adminlogout.jsp">注销登录</a><br />
<a href="javascript:void(0)" onclick="get_book('unchecked')">待审核图书</a> <br />
<a href="javascript:void(0)" onclick="get_book('onsale')">上架图书</a> <br />
<a href="javascript:void(0)" onclick="get_book('saled')">待发图书</a> <br />
<a href="javascript:void(0)" onclick="get_book('delivered')">待确认图书</a> <br />
<div id="bookinfo_block">图书信息将在此列出...</div>
<%

}
%>
</body>
</html>
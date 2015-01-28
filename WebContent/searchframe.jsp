<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" language="javascript">
function checkSearch(form)
{
	if(form.book_keyword.value.length == 0)
	{
		alert("请输入搜索内容...");
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

<form action="booksearch.jsp" onsubmit="return checkSearch(this)" method="GET" target="_blank">
<input type="text" name="book_keyword" />
<input type="submit" value="搜索" />
</form>

</body>
</html>
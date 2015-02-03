<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#searchframe {
width:500px; /*设定宽度*/
text-align:left; /*文字左对齐*/
}
</style>

<script type="text/javascript" language="javascript">
function checkSearch(form)
{
	if(form.book_keyword.value.length == 0)
	{
		alert("请输入搜索内容...");
		return false;
	}
	else if(form.book_search_type.value == "search_book_id" && isNaN(form.book_keyword.value))
	{
		alert("按编号搜索时仅能输入数字");
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
<div id="searchframe">
<form action="booksearch.jsp" onsubmit="return checkSearch(this)" method="GET" target="_blank">
<input type="text" name="book_keyword" />
<input type="radio" name="book_search_type" value="search_book_name" />按书名、简介
<input type="radio" name="book_search_type" value="search_book_id" />按编号
<input type="submit" value="搜索" />
</form>
</div>
</body>
</html>
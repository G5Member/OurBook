<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#newbook {
 width:500px;
 text-align:left;
 float:left; /*浮动居右*/
 clear:right; /*不允许右侧存在浮动*/
 overflow:hidden;
background-color: #F0FFFF;
}
</style>
<script type="text/javascript" language="javascirpt">
function lookBook(book_id)
{
	window.open("book.jsp?book_id=" + String(book_id));
}
</script>
</head>
<body>
<div id="newbook">
<table border="1">
<tr>
<td>编号</td>
<td>书名</td>
<td>价格</td>
<td>存量</td>
<td>封面</td>
<td>来源</td>
<td>简介</td>
<td>入库时间</td>
</tr>
<%
String sql = "select * from book_info where book_amount > 0 and book_status = 'onsale' order by book_jointime desc limit 5";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
while(rs.next())
{
%>
<tr>
<td><%= rs.getInt("book_id") %></td>
<td><a href="javascript:void(0);" onclick="lookBook(<%= rs.getInt("book_id")%>)">《 <%= rs.getString("book_name")%>》</a></td>
<td><%= rs.getInt("book_price") %>书币</td>
<td><%= rs.getInt("book_amount") %>件</td>
<td><img src="<%= "book_img/" + rs.getString("book_cover") %>" /></td>
<td><%= rs.getString("book_owner") %></td>
<td>
<%
	if(rs.getString("book_intro").equals(""))
	{
%>
暂无简介
<%
	}
	else
	{
%>
<%= rs.getString("book_intro") %>
<%
	}
%>
</td>
<td><%= rs.getTimestamp("book_jointime") %></td>
</tr>
<%
}
%>
</table>
</div>
</body>
</html>
<%
pstmt.close();
conn.close();
%>
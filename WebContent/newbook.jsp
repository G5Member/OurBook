<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>newbook</title>
<script type="text/javascript" language="javascirpt">
function lookBook(book_id)
{
	window.open("book.jsp?book_id=" + String(book_id));
}
</script>
</head>
<body>
新书上架模块 <br />
编号 书名 价格 存量 封面 来源 简介 入库时间  <br />
<%
String sql = "select * from book_info where book_amount > 0 order by book_jointime desc limit 5";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
while(rs.next())
{
	out.print(rs.getInt("book_id") + " ");
%>
<a href="javascript:void(0);" onclick="lookBook(<%= rs.getInt("book_id")%>)">《 <%= rs.getString("book_name")%>》</a>
<%
	out.print(" " + rs.getInt("book_price") + "书币");
	out.print(" " + rs.getInt("book_amount") + "件");
%>
<img src="<%= "book_img/" + rs.getString("book_cover") %>" />
<%
	out.print(" " + rs.getString("book_owner"));
	if(rs.getString("book_intro") == null)
	{
		out.print(" 暂无简介");
	}
	else
	{
		out.print(" " + rs.getString("book_intro"));
	}
	out.print(" " + rs.getTimestamp("book_jointime"));
%>
<br />
<%
}
%>

<br />
</body>
</html>
<%
pstmt.close();
conn.close();
%>
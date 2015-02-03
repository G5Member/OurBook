<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" language="javascirpt">
function lookBook(book_id)
{
	window.open("book.jsp?book_id=" + String(book_id));
}
</script>

</head>
<%!
int pageSize = 5;
int pageCount;
int showPage;
%>
<%
String book_keyword = request.getParameter("book_keyword");
String book_search_type = request.getParameter("book_search_type");
//out.print(book_search_type);
String sql;
PreparedStatement pstmt;
if(book_search_type == null)
{
	book_search_type = "search_book_name";
}
if(book_search_type.equals("search_book_id"))
{
	sql = "select * from book_info where book_id = ?;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.valueOf(book_keyword));
}
else
{
	sql = "select * from book_info where book_name like ? or book_intro like ?;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%" + book_keyword + "%");
	pstmt.setString(2, "%" + book_keyword + "%");
}
ResultSet rs = pstmt.executeQuery();

//将游标移到最后一行 
rs.last();
//获取最后一行的行号 
int recordCount=rs.getRow();
%>
<body>
<jsp:include page="searchframe.jsp" flush="true" />

<%
if(recordCount == 0)
{
	out.print("无搜索结果");
}
else
{
%>
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
//计算分页后的总数 
pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);

//获取用户想要显示的页数：
String integer = request.getParameter("showPage");
if(integer == null)
{
	integer = "1";
}
try
{
	showPage=Integer.parseInt(integer);
}
catch(NumberFormatException e)
{
	showPage = 1;
}

if(showPage <= 1)
{
	showPage = 1;
}

if(showPage >= pageCount)
{
	showPage = pageCount;
}

//如果要显示第showPage页，那么游标应该移动到的position的值是：
int position=(showPage-1)*pageSize+1;
//设置游标的位置
rs.absolute(position);
//用for循环显示本页中应显示的的记录
for(int i=1;i<=pageSize;i++)
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
	if(!rs.next()) break;
}
%>
</table>
<a href="booksearch.jsp?book_keyword=<%= book_keyword %>&showPage=1">首页</a>
<a href="booksearch.jsp?book_keyword=<%= book_keyword %>&showPage=<%= showPage-1 %>">上一页</a>
<%
for(int i=1; i<=pageCount; i++)
{
%>
<a href="booksearch.jsp?book_keyword=<%= book_keyword %>&showPage=<%= i %>"><%= i %></a>
<%
}
%>
<a href="booksearch.jsp?book_keyword=<%= book_keyword %>&showPage=<%= showPage+1 %>">下一页</a>
<a href="booksearch.jsp?book_keyword=<%= book_keyword %>&showPage=<%= pageCount %>">末页</a>
<form action="booksearch.jsp?book_keyword=<%= book_keyword %>" method="POST">
跳转到第<input type="text" name="showPage" size="4" />页
<input type="submit" value="跳转" />
</form>
<%
}
pstmt.close();
conn.close();
%>
</body>
</html>
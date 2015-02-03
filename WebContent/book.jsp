<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String id = request.getParameter("book_id");
if(id==null)
{
%>
<jsp:forward page="404.jsp" />
<%
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书信息</title>
<style type="text/css">
body {
background-color: #DCDCDC;
}
#book {
width:800px;
float: right;
text-align:left;
overflow:hidden;
claer: both;

}
#bookinfo {
width: 800px;
margin: auto;
test-align:left;
clear: both;


}
</style>
<script type="text/javascript" language="javascript">
function gotobuy(book_id)
{
	//alert( notonline + " " + user_id + " " + book_id);
	if(<%= (session.isNew() || session.getAttribute("user_id") == null) %>)
	{
		alert("请先登录再购买...");
	}
	else
	{
		window.document.location.href = "buy.jsp?user_id=" + '<%= (String) session.getAttribute("user_id") %>' + "&book_id=" + book_id;
	}
}
</script>
</head>
<body>
<div id="book">
<div style="width: 400px; float: right; clear: both;">
<jsp:include page="login.jsp" flush="true"/>
</div>
<div id="bookinfo">
<%
int book_id = Integer.valueOf(id);
String sql = "select * from book_info where book_id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, book_id);
ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
%>
<table border="1">
<tr>
<td>编号：</td>
<td><%= rs.getInt("book_id") %></td>
</tr>
<tr>
<td>价格：</td>
<td><%= rs.getInt("book_price") %>书币</td>
</tr>
<tr>
<td>存量：</td>
<td><%= rs.getInt("book_amount") %></td>
</tr>
<tr>
<td>封面：</td>
<td><img src="<%= "book_img/" + rs.getString("book_cover") %>" /></td>
</tr>
<tr>
<td>来源：</td>
<td>
<%= rs.getString("book_owner") %>
</td>
</tr>
<tr>
<td>简介：</td>
<td>
<%
	if(rs.getString("book_intro").equals(""))
	{
		out.print("暂无。");
	}
	else
	{
		out.print(rs.getString("book_intro"));
	}
%>
</td>
</tr>
<tr>
<td>入库时间：</td>
<td><%= rs.getTimestamp("book_jointime") %></td>
</tr>
<tr>
<td>状态；</td>
<td>
<%
	String book_status = rs.getString("book_status");
	if(book_status.equals("unchecked"))
	{
		out.print("待审核");
	}
	else if(book_status.equals("onsale"))
	{
		out.print("待售中");
	}
	else if(book_status.equals("saled"))
	{
		out.print("已售待发货");
	}
	else if(book_status.equals("delivered"))
	{
		out.print("已发货待确认");
	}
	else if(book_status.equals("ackrecved"))
	{
		out.print("已确认收货");
	}
%>
</td>
</tr>
</table>
<a href="javascript:void(0)" onclick = "gotobuy(<%= book_id %>)" >购买</a>

<%
}
else
{
%>
<script type="text/javascript" language="javascript">
//alert("该书不存在...");
window.document.location.href = "404.jsp";
</script>
<%
}
pstmt.close();
conn.close();
%>
</div>
</div>
</body>
</html>
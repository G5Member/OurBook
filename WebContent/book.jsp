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
<title>Insert title here</title>
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
<jsp:include page="login.jsp" flush="true"/>
<%
int book_id = Integer.valueOf(id);
String sql = "select * from book_info where book_id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, book_id);
ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
%>
编号：<%= rs.getInt("book_id") %><br />
价格：<%= rs.getInt("book_price") %>书币<br />
存量：<%= rs.getInt("book_amount") %><br />
<img src="<%= "book_img\\" + rs.getString("book_cover") %>" />
来源：<%= rs.getString("book_owner") %><br />
<%
	if(rs.getString("book_intro") == null)
	{
		out.println("简介：暂无。");
	}
	else
	{
		out.println("简介：" + rs.getString("book_intro"));
	}
	out.println("入库时间：" + rs.getTimestamp("book_jointime") + "<br />");
%>
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
</body>
</html>
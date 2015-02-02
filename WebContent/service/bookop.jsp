<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("admin_id") == null)
{
	response.sendRedirect("../404.jsp");	
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String op = request.getParameter("op");
int book_id = Integer.valueOf(request.getParameter("book_id"));

switch(op)
{
case "admit":
{
	String sql = "select book_price, book_owner from book_info where book_id=? and book_amount>0;";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, book_id);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next())
	{
		int book_price = rs.getInt("book_price");
		String book_owner = rs.getString("book_owner");
		
		sql = "update user_member, book_info set user_coins=user_coins+?, book_status='onsale' where user_id=? and book_id=?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, book_price);
		pstmt.setString(2, book_owner);
		pstmt.setInt(3, book_id);
		if(pstmt.execute())
		{
			out.print("失败，请稍后重试");
		}
		else
		{
			out.print("成功");
		}
	}
	else
	{
		out.print("该书信息不存在，请刷新页面或检查数据库...");
	}
	break;
}
case "send":
{

	String sql = "update book_info set book_status='delivered' where book_id=?;";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, book_id);
	if(pstmt.execute())
	{
		out.print("失败，请稍后重试");
	}
	else
	{
		out.print("成功");
	}
	break;
}
	default: break;
}
%>
</body>
</html>
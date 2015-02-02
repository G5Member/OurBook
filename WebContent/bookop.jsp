<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("user_id") == null)
{
	response.sendRedirect("404.jsp");	
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
case "ackrecv":
{

	String sql = "update book_info set book_status='ackrecved' where book_id=?;";
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String admin_id = request.getParameter("admin_id");
String admin_password = request.getParameter("admin_password");
String sql = "select * from admin_member where admin_id=? and admin_password=?;";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, admin_id);
pstmt.setString(2, admin_password);
ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
	session.setAttribute("admin_id", admin_id);
%>
<script type="text/javascript" language="javascript">
	alert("登录成功");
	window.document.location.href = "adminmain.jsp";
</script>
<%
}
else
{
%>
<script type="text/javascript" language="javascript">
	alert("用户名或密码错误...");
	window.document.location.href = "adminlogin.jsp";
</script>
<%
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user_reginfo" class="ourbook.UserMemberBean" scope="page">
<jsp:setProperty name="user_reginfo" property="*" />
</jsp:useBean>

<%

String sql = "select * from user_member where user_id=?;";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, user_reginfo.getUser_id());
ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
	out.print("用户名已存在");
}
else
{
	out.print("用户名可以使用");
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
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
%>
<script type="text/javascript" language="javascript">
	alert("用户名已经被使用，请更换...");
	window.document.location.href="register.jsp";
</script>
<%	
}

sql = "insert into user_member values (?, ?, ?, 0);";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, user_reginfo.getUser_id());
pstmt.setString(2, user_reginfo.getUser_nickname());
pstmt.setString(3, user_reginfo.getUser_password());
if(pstmt.execute())
{
%>
<script type="text/javascript" language="javascript">
	alert("添加用户信息失败，请重试...");
	window.document.location.href="register.jsp";
</script>
<%		
}
else
{	
	session.setAttribute("user_id", user_reginfo.getUser_id());
	session.setAttribute("user_coins", 0);

%>
<script type="text/javascript" language="javascript">
	alert("注册成功，将返回主页...");
	window.document.location.href="index.jsp";
</script>
<%	
}
pstmt.close();
conn.close();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
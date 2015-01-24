<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="service/conn.jsp" %>

<jsp:useBean id="user_info" class="ourbook.UserMemberBean" scope="page">
<jsp:setProperty name="user_info" property="*" />
</jsp:useBean>

<%
//out.print(user_info.getUser_id() + user_info.getUser_password());
String sql = "select * from user_member where user_id=? and user_password=?;";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, user_info.getUser_id());
pstmt.setString(2, user_info.getUser_password());

ResultSet rs = pstmt.executeQuery();
if(!rs.next()) 
{ 
%>
<script type="text/javascript" language="javascript">
	alert("登录失败，请重新登录...");
	window.document.location.href="index.jsp";
</script>
<%
}
else
{
%>
<script type="text/javascript" language="javascript">
	alert("登录成功");
	window.document.location.href="index.jsp";
</script>
<%
}
%>
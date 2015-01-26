<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="service/conn.jsp" %>

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
pstmt.close();
conn.close();
%>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="service/conn.jsp" %>

<%
response.setContentType("text/xml");  //解析为XML档  
response.setHeader("Cache-Control","no-cache");  
%>
<jsp:useBean id="user_reginfo" class="ourbook.UserMemberBean" scope="page">
<jsp:setProperty name="user_reginfo" property="*" />
</jsp:useBean>

<%
out.println("<!DOCTYPE  user_idExist [");
out.println("<!ELEMENT user_idExist (used)>");
out.println("<!ELEMENT used (#PCDATA)>");
out.println("]>");
out.println("<user_idExist>");

String sql = "select * from user_member where user_id=?;";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, user_reginfo.getUser_id());
ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
	out.println("<used>" + "NO" + "</used>");
}
else
{
	out.println("<used>" + "YES" + "</used>");
}
out.println("</user_idExist>");
pstmt.close();
conn.close();

%>


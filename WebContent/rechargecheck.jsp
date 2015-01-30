<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.isNew() || session.getAttribute("user_id")==null)
{
%>
<script type="text/javascript" language="javascirpt">
	alert("请先登录");
	window.document.location.href = "login.jsp";
</script>
<%
}
else
{
int rechargenum = Integer.valueOf(request.getParameter("coinsnum"));
//out.print(rechargenum);
String sql = "update user_member set user_coins = user_coins + ? where user_id=?;";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, rechargenum);
pstmt.setString(2, (String) session.getAttribute("user_id"));
if(!pstmt.execute())
{
	sql = "select user_coins from user_member where user_id=?;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String) session.getAttribute("user_id"));
	ResultSet rs = pstmt.executeQuery();
	int user_coins = 0;
	if(rs.next())
	{
		user_coins = rs.getInt("user_coins");
	}
	else
	{
		out.print("获取您的书币失败，请稍后再试...");
	}

	session.setAttribute("user_coins", user_coins);
%>
<script type="text/javascript" language="javascirpt">
	alert("充值成功");
	window.document.location.href = "recharge.jsp";
</script>
<%
}
else
{
%>
<script type="text/javascript" language="javascirpt">
	alert("充值失败，请稍后再试...");
	window.document.location.href = "recharge.jsp";
</script>
<%
	
}
}
%>
</body>
</html>
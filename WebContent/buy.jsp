<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="buyinfo" class="ourbook.BookBuyBean" scope="page">
<jsp:setProperty name="buyinfo" property="*" />
</jsp:useBean>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
String sql = "select book_price, book_owner from book_info where book_id=? and book_amount>0;";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, buyinfo.getBook_id());
ResultSet rs = pstmt.executeQuery();
int book_price = 0;
String book_owner;
if(rs.next())
{
	book_price = rs.getInt("book_price");
	book_owner = rs.getString("book_owner");
	if(book_owner.equals(buyinfo.getUser_id()))
	{
%>
		<script type="text/javascript" language="javascript">
		alert("您不能购买自己的图书...");
		window.document.location.href="book.jsp?book_id=" + <%= buyinfo.getBook_id()%> ;
		</script>
<%
	}
	else
	{
	sql = "select user_coins from user_member where user_id=?;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String) buyinfo.getUser_id());
	rs = pstmt.executeQuery();
	int user_coins = 0;
	if(rs.next())
	{
		user_coins = rs.getInt("user_coins");
	}
	else
	{
		out.print("获取您的书币失败，请稍后再试...");
	}

	if(book_price > user_coins)
	{
	%>
	<script type="text/javascript" language="javascript">
	alert("您的书币不足...");
	window.document.location.href="book.jsp?book_id=" + <%= buyinfo.getBook_id()%> ;
	</script>
	<%
	}
	else
	{
		sql = "update user_member, book_info set user_coins = if(user_id = ?, user_coins-?, user_coins), user_coins = if(user_id = ?, user_coins+?, user_coins), book_amount=book_amount-?, book_buyer=?, book_leavetime=? where book_id=? and (user_id=? or user_id=?);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, buyinfo.getUser_id());
		pstmt.setInt(2, book_price);
		pstmt.setString(3, book_owner);
		pstmt.setInt(4, book_price);
		pstmt.setInt(5, 1);
		pstmt.setString(6, buyinfo.getUser_id());
		pstmt.setString(7, (new java.util.Date()).toLocaleString());
		pstmt.setInt(8, buyinfo.getBook_id());
		pstmt.setString(9, buyinfo.getUser_id());
		pstmt.setString(10, book_owner);
		if(pstmt.execute())
		{
	%>
	<script type="text/javascript" language="javascript">
			alert("购买失败");
	</script>
	<%
		}
		else
		{
			session.setAttribute("user_coins", user_coins - book_price);
	%>
	<script type="text/javascript" language="javascript">
			alert("购买成功");
			window.document.location.href = "index.jsp";
	</script>
	<%
		}
	}
	}
}
else
{
%>
	<script type="text/javascript" language="javascript">
	alert("您慢了一步哦，该商品已售完...");
	window.document.location.href="book.jsp?book_id=" + <%= buyinfo.getBook_id()%> ;
	</script>
<%
}

pstmt.close();
conn.close();
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("admin_id") == null)
{
	response.sendRedirect("../404.jsp");	
}
String book_status = request.getParameter("book_status");
if(book_status != null)
{
	String sql = "select * from book_info where book_status=?;";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, book_status);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" language="javascirpt">
function lookBook(book_id)
{
	window.open("../book.jsp?book_id=" + String(book_id));
}
function admit_book(book_id)
{
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange=function()
	{
		if(xhr.readyState==4 && xhr.status==200)
		{
			document.getElementById("admitresult" + book_id).innerHTML=xhr.responseText;
		}
	}
	//window.open("adminbook.jsp?book_status=" + str);
	xhr.open("GET", "bookop.jsp?op=admit&book_id=" + book_id, true);
	xhr.send();
}
function send_book(book_id)
{
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange=function()
	{
		if(xhr.readyState==4 && xhr.status==200)
		{
			document.getElementById("sendresult" + book_id).innerHTML=xhr.responseText;
		}
	}
	//window.open("adminbook.jsp?book_status=" + str);
	xhr.open("GET", "bookop.jsp?op=send&book_id=" + book_id, true);
	xhr.send();

}
</script>

</head>
<%!
int pageSize = 10;
int pageCount;
int showPage;
%>
<%
ResultSet rs = pstmt.executeQuery();

//将游标移到最后一行 
rs.last();
//获取最后一行的行号 
int recordCount=rs.getRow();
%>
<body>
<%
if(recordCount == 0)
{
	out.print("无搜索结果");
}
else
{
%>
编号 书名 价格 存量 封面 来源 简介 入库时间  <br />
<%
//计算分页后的总数 
pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);

//获取用户想要显示的页数：
String integer = request.getParameter("showPage");
if(integer == null)
{
	integer = "1";
}
try
{
	showPage=Integer.parseInt(integer);
}
catch(NumberFormatException e)
{
	showPage = 1;
}

if(showPage <= 1)
{
	showPage = 1;
}

if(showPage >= pageCount)
{
	showPage = pageCount;
}

//如果要显示第showPage页，那么游标应该移动到的position的值是：
int position=(showPage-1)*pageSize+1;
//设置游标的位置
rs.absolute(position);
//用for循环显示本页中应显示的的记录
for(int i=1;i<=pageSize;i++)
{  
	out.print(rs.getInt("book_id") + " ");
%>
<a href="javascript:void(0);" onclick="lookBook(<%= rs.getInt("book_id")%>)">《 <%= rs.getString("book_name")%>》</a>
<%
	out.print(" " + rs.getInt("book_price") + "书币");
	out.print(" " + rs.getInt("book_amount") + "件");
%>
<img src="<%= "../book_img/" + rs.getString("book_cover") %>" />
<%
	out.print(" " + rs.getString("book_owner"));
	if(rs.getString("book_intro").equals(""))
	{
		out.print(" 暂无简介");
	}
	else
	{
		out.print(" " + rs.getString("book_intro"));
	}
	out.print(" " + rs.getTimestamp("book_jointime"));
	if(book_status.equals("unchecked"))
	{
%>
<input type="button" onclick="admit_book(<%= rs.getInt("book_id") %>)" value="通过" />
<span id="admitresult<%= rs.getInt("book_id") %>"></span>
<%	
	}
	else if(book_status.equals("saled"))
	{
%>
<input type="button" onclick="send_book(<%= rs.getInt("book_id") %>)" value="已发货" />
<span id="sendresult<%= rs.getInt("book_id") %>"></span>
<%		
	}
%>
	<br />
<% 
	if(!rs.next()) break;
}
%>
<br />
<a href="adminbookinfo.jsp?book_status=<%= book_status %>&showPage=1">首页</a>
<a href="adminbookinfo.jsp?book_status=<%= book_status %>&showPage=<%= showPage-1 %>">上一页</a>
<%
for(int i=1; i<=pageCount; i++)
{
%>
<a href="adminbookinfo.jsp?book_status=<%= book_status %>&showPage=<%= i %>"><%= i %></a>
<%
}
%>
<a href="adminbookinfo.jsp?book_status=<%= book_status %>&showPage=<%= showPage+1 %>">下一页</a>
<a href="adminbookinfo.jsp?book_status=<%= book_status %>&showPage=<%= pageCount %>">末页</a>
<form action="adminbookinfo.jsp?book_status=<%= book_status %>" method="POST">
跳转到第<input type="text" name="showPage" size="4" />页
<input type="submit" value="跳转" />
</form>
<%
}
pstmt.close();
}
else
{
	response.sendRedirect("../404.jsp");
}
conn.close();
%>
</body>
</html>
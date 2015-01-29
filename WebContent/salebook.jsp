<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="service/conn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="salecheck.jsp" method="POST" enctype="multipart/form-data">
<%-- 类型enctype用multipart/form-data，这样可以把文件中的数据作为流式数据上传，不管是什么文件类型，均可上传。--%>
图书名称：<input type="text" name="book_name" /><br />
您的定价：<input type="text" name="book_price" /><br />
简介：<textarea rows="3" cols="20" name="book_intro">请在简介中包含图书作者、出版社、出版时间、新旧程度等必要信息</textarea><br />
请选择要上传的文件<input type="file" name="file" size="50" />
<input type="submit" value="上传" />
<input type="reset" value="重置" />
<br />
</form>

<%= System.getProperty("java.io.tmpdir") %>

</body>
</html>
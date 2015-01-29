<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ include file="service/conn.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int book_id = 1;
String book_name = "";
int book_price = 0;
int book_amount = 0;
String book_intro = null;
String book_cover = "";

String sql = "select max(book_id) from book_info;";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
	book_id = rs.getInt(1) + 1;
}


File file ;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = context.getInitParameter("file-upload");
   

// 验证上传内容了类型
String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) 
{
	DiskFileItemFactory factory = new DiskFileItemFactory();
	// 设置内存中存储文件的最大值
	factory.setSizeThreshold(maxMemSize);
	// 本地存储的数据大于 maxMemSize.
	factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	
	// 创建一个新的文件上传处理程序

	ServletFileUpload upload = new ServletFileUpload(factory);
	// 设置最大上传的文件大小
	upload.setSizeMax( maxFileSize );
	try
	{
		// 解析获取的文件
		List fileItems = upload.parseRequest(request);
		// 处理上传的文件
		Iterator i = fileItems.iterator();
        while ( i.hasNext () ) 
        {
        	FileItem fi = (FileItem)i.next();
        	if ( !fi.isFormField () )	
        	{
        		// 获取上传文件的参数
        		String fieldName = fi.getFieldName();
        		String fileName = fi.getName();
        		boolean isInMemory = fi.isInMemory();
        		long sizeInBytes = fi.getSize();
        	
	       		if(sizeInBytes > 0)
        		{
        			// 写入文件 
        			switch(fileName.substring( fileName.lastIndexOf(".")))
        			{
        			case ".jpg":
        			case ".jpeg":
        			case ".gif":
        			case ".bmp":
        			case ".png":
        				book_cover = book_id + fileName.substring( fileName.lastIndexOf("."));
        				file = new File(filePath, book_cover);
        				fi.write(file ) ;
        				//out.println("Uploaded Filename: " + filePath + "\\" + fileName + "<br />");
        				break;
        			default: out.print("上传的不是图片文件！");
        			}
        		}
    	      	else
    	      	{
    	      		out.print("并未选择文件...");
    	      	}
        	}
        	else
        	{
        		switch(fi.getFieldName())
        		{
        		case "book_name":
        			book_name = fi.getString("UTF-8");
        			break;
        		case "book_price":
        			book_price = Integer.valueOf(fi.getString("UTF-8"));
        			break;
           		case "book_intro":
           			book_intro = fi.getString("UTF-8");
           			break;
           		default: break;
           		}
        	}
        }
        if(book_cover.equals(""))
        {
        	sql = "insert into book_info(book_id, book_name, book_price, book_amount, book_owner, book_intro, book_jointime) values(?, ?, ?, ?, ?, ?, ?);";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, book_id);
            pstmt.setString(2, book_name);
            pstmt.setInt(3, book_price);
            pstmt.setInt(4, 1);
            pstmt.setString(5, (String)session.getAttribute("user_id"));
            pstmt.setString(6, book_intro);
            pstmt.setString(7, (new java.util.Date()).toLocaleString());
        }
        else
        {
        	sql = "insert into book_info(book_id, book_name, book_price, book_amount, book_cover, book_owner, book_intro, book_jointime) values(?, ?, ?, ?, ?, ?, ?, ?);";
        	pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, book_id);
            pstmt.setString(2, book_name);
            pstmt.setInt(3, book_price);
            pstmt.setInt(4, 1);
            pstmt.setString(5, book_cover);
            pstmt.setString(6, (String)session.getAttribute("user_id"));
            pstmt.setString(7, book_intro);
            pstmt.setString(8, (new java.util.Date()).toLocaleString());
        }
        if(pstmt.execute())
        {
%>
        	<script type="text/javascript" language="javascript">
        			alert("上架失败");
        			window.document.location.href = "index.jsp";
        	</script>
<%        	
        }
        else
        {
        	out.print("页面即将跳转，请稍等...");
%>
        	<script type="text/javascript" language="javascript">
        	function reDirect()
        	{
        		window.document.location.href = "book.jsp?book_id=" + <%= book_id%>;
        	}
        			alert("上架成功");
        			window.setTimeout("reDirect()",7000);
        			
        	</script>
<%

        }
	}
	catch(Exception ex)
    {
		System.out.println(ex);
    }
}
else
{
	out.println("<p>No file uploaded</p>"); 
}
pstmt.close();
conn.close();
%>
</body>
</html>
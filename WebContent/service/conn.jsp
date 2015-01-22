<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" import = "com.mysql.jdbc.Driver" %>

<%
String driverName="com.mysql.jdbc.Driver";
String userName="root";
String userPasswd="huangxuan";
String dbName="maindb";
String strurl="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
Class.forName(driverName).newInstance();
Connection conn=DriverManager.getConnection(strurl);

/*
String tableName="eshow_admin";
Statement statement = conn.createStatement();
String sql="SELECT * FROM "+tableName;
ResultSet rs = statement.executeQuery(sql);

ResultSetMetaData rmeta = rs.getMetaData();

int numColumns=rmeta.getColumnCount();

out.print("id");
out.print("|");
out.print("eshow_admin");
out.print("|");
out.print("eshow_adminpwd");
out.print("<br>");
while(rs.next()) {
out.print(rs.getString(1)+" ");
out.print("|");
out.print(rs.getString(2)+" ");
out.print("|");
out.print(rs.getString(3));
out.print("<br>");
}
out.print("<br>");
out.print("数据库操作成功");

rs.close();
statement.close();
conn.close();
*/
%>
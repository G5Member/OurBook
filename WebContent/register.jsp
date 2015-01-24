<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" language="javascript">
<%@ include file="loadXMLDoc.js" %>
function verify_submit(regform)
{
	if(regform.user_id.value.length == 0)
	{
		alert("用户名不能为空");
		return false;
	}
	if(regform.user_nickname.value.length == 0)
	{
		alert("昵称不能为空");
		return false;
	}
	if(regform.user_password.value.length == 0)
	{
		alert("密码不能为空");
		return false;
	}
	if(regform.user_password2.value != regform.user_password.value)
	{
		alert("确认密码错误");
		return false;
	}
	
	xmlDoc = loadXMLDoc("checkIdresult.jsp?user_id=" + regform.user_id.value);
	//alert(xmlDoc.getElementsByTagName("used")[0].childNodes[0].nodeValue);
	if(xmlDoc.getElementsByTagName("used")[0].childNodes[0].nodeValue == "NO")
	{
		alert("用户名已存在...");
		return false;
	}

	return true;
}
function showIdExist(str)
{
	var xhr;//xmlHttpRequest
	if(str.length == 0)
	{
		document.getElementById("txtHint").innerHTML="用户名请使用5~18个英文字符、数字或下划线";
		return ;
	}
	//for IE7+, Firefox, Chrome, Opera, Safari
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange=function()
	{
		if(xhr.readyState==4 && xhr.status==200)
		{
			document.getElementById("txtHint").innerHTML=xhr.responseText;
		}
	}
	xhr.open("GET", "checkId.jsp?user_id=" + str, true);
	xhr.send();
}
</script>
</head>
<body>

注册模块
<form action="registercheck.jsp" name="regform" onsubmit="return verify_submit(this)" method="POST">
用户名：<input type="text" onkeyup="showIdExist(this.value)" onblur="showIdExist(this.value)" name="user_id" />
<span id="txtHint">用户名请使用5~18个英文字符、数字或下划线</span>
<br />
昵称：<input type="text" name="user_nickname" />
<span>昵称请使用18个英文字符或9个中文字符以内</span>
<br />
密码：<input type="password" name="user_password" />
<span>密码请使用24个英文字符、数字或下划线</span>
<br />
确认密码：<input type="password" name="user_password2" />
<span>请输入与密码相同</span>
<br />
<input type="submit" value="注册" />
<input type="reset" value="重置" />
</form>


</body>
</html>
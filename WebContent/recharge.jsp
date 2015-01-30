<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" language="javascript">
function checkrecharge(form)
{
	if(form.coinsnum.value.length == 0)
	{
		alert("请输入充值数额...");
		return false;
	}
	else if(isNaN(form.coinsnum.value))
	{
		alert("充值数额仅能输入数字...");
		return false;
	}
	else
	{
		return true;
	}
}
</script>

</head>
<body>
<jsp:include page="top.jsp" />
<form action="rechargecheck.jsp" onsubmit="return checkrecharge(this)" method="POST">
请填写您要充值的数额（1人民币=1书币）：<input type="text" name="coinsnum" />
<input type="submit" value="充值" />
</form>
</body>
</html>
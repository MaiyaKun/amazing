<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>로그인 안내</title>

<style type="text/css">
.loginFailCss1{
	font-family: arial;
	font-size: 22px;
	font-weight: bold;
	height: 60px;
	padding: 2px;
	
}

.loginFailCss2{
	padding: 5px 10px;
	height: 35px;
	width: 330px;
	font-size: 20px;
	font-family: arial;
	padding: 4px 10px;
}
</style>

<script type="text/javascript">

	function goMainFnc() {
		location.href = "/amazing/index.jsp";
	}
	
</script>

</head>
<body>
<p style="font-family: arial; font-size: 70px; font-weight: bold; 
	text-align: center; margin: 40px 0px 20px 0px; cursor: pointer;"
	onclick="goMainFnc()">으 메 이 징</p>
<hr style="width: 550px; border: solid 2px;">
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">로그인 안내</p>
	<div style="height: 380px;">
	<div style="margin: auto; width: 600px; background-color: lightgrey; 
		padding: 50px;">
	<p style="font-size: 20px; font-weight: bold; text-align: center;">
		입력하신 아이디와 패스워드가 존재하지 않습니다.<br>
		다시 한번 확인해주세요.
	<table style="margin: auto;">
		<tr>
			<td class="loginFailCss1" style="width: 180px;">아이디</td>
			<td class="loginFailCss1" style="width: 300px;">
				<input class="loginFailCss2" type="text" name="userName" 
					value="${id}">
			</td>
		</tr>
		<tr>
			<td class="loginFailCss1">패스워드</td>
			<td class="loginFailCss1">
				<input class="loginFailCss2" type="text" name="passWord" 
					value="${passWord}">
			</td>
		</tr>
	</table>
	</div>
	<div style="width: 700px; margin: auto;">
	<input style="height: 50px; width: 200px; font-size: 22px; margin: 0px; 
		float: right; cursor: pointer; background-color: #00d63d; 
		color: white; font-weight: bold; border-radius: 7px; padding: 0px;"
		type="button" id="goMainBtn" onclick="goMainFnc()" value="로그인 다시하기">
	</div>
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
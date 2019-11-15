<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>아이디 중복 확인</title>

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

	function goAddFormFnc() {
		location.href = "/amazing/addForm.do?id=${id}";
	}
	
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
	text-align: center;">아이디 중복확인</p>
	<div style="height: 370px;">
	<div style="margin: auto; width: 600px; background-color: lightgrey; 
		padding: 50px;">
	<p style="font-size: 20px; font-weight: bold; text-align: center;">
		중복되는 아이디입니다.<br>다른 아이디를 입력해주세요</p>
	<table style="margin: auto;">
		<tr>
			<td class="loginFailCss1" style="width: 180px;">작성한 아이디</td>
			<td class="loginFailCss1" style="width: 300px;">
				<input class="loginFailCss2" type="text" name="userName" 
					readonly="readonly" value="${id}">
			</td>
		</tr>
	</table>
	</div>
	<div style="width: 700px; margin: auto;">
	<input style="height: 50px; width: 200px; font-size: 22px; margin: 0px; 
		float: right; cursor: pointer; background-color: #24afff; 
		color: white; font-weight: bold; border-radius: 7px; padding: 0px;"
		type="button" id="goMainBtn" onclick="goAddFormFnc()" value="뒤로 가기">
	</div>
	</div>

<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
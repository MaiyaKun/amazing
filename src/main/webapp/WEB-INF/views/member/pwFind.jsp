<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기</title>

<style type="text/css">
.pwFindCss1{
	font-family: arial;
	font-size: 22px;
	font-weight: bold;
	height: 60px;
	padding: 2px;
	
}

.pwFindCss2{
	padding: 5px 10px;
	height: 35px;
	width: 330px;
	font-size: 20px;
	font-family: arial;
	padding: 4px 10px;
}

</style>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js">
</script>

<script type="text/javascript">

	function pwFindFnc() {
		var formObj = $('#pwFind');
		formObj.attr("action", "./pwFindRevise.do");
		formObj.submit();
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
<hr style="width: 400px; border: solid 2px;">
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">패스워드 찾기</p>
	<div style="height: 380px;">
	<form id="pwFind" method="post">
	<div style="margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
	<table style="margin: auto;">
		<tr>
			<td class="pwFindCss1" style="width: 180px;">아이디</td>
			<td class="pwFindCss1" style="width: 300px;">
				<input class="pwFindCss2" type="text" name="id" placeholder="아이디 입력">
			</td>
		</tr>
		<tr>
			<td class="pwFindCss1">이름</td>
			<td class="pwFindCss1">
				<input class="pwFindCss2" type="text" name="userName" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<td class="pwFindCss1">핸드폰 번호</td>
			<td class="pwFindCss1">
				<input class="pwFindCss2" type="text" name="phone" placeholder="핸드폰 번호 입력">
			</td>
		</tr>
	</table>

	</div>
	<div style="margin: auto; width: 700px;">
		<input style="height: 50px; width: 200px; font-size: 22px; cursor: pointer; float: right;
			background-color: #24afff; color: white; font-weight: bold; border-radius: 7px;"
			type="button" id="pwFindBtn" onclick="pwFindFnc()" value="패스워드 찾기">
		<input style="height: 50px; width: 200px; font-size: 22px; margin: 0px; 
			float: left; cursor: pointer; background-color: #24afff; 
			color: white; font-weight: bold; border-radius: 7px; padding: 0px;"
			type="button" id="goMainBtn" onclick="goMainFnc()" value="뒤로가기">
	</div>
	</form>
	</div>

<jsp:include page="/WEB-INF/views/tail.jsp"/>	

</body>
</html>
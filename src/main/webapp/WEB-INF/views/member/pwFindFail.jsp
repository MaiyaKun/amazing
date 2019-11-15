<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>패스워드 안내</title>

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

	function goPwFindFnc() {
		location.href = "/amazing/pwFind.do";
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
	text-align: center;">패스워드 찾기 실패</p>
	<div style="height: 430px;">
	<div style="margin: auto; width: 600px; background-color: lightgrey; 
		padding: 50px;">
	<p style="font-size: 20px; font-weight: bold; text-align: center;">
		입력한 정보와 일치하는 아이디가 없습니다.<br>
		입력한 정보를 다시 확인해주세요.</p>
	<table style="margin: auto;">
		<tr>
			<td class="loginFailCss1" style="width: 180px;">아이디</td>
			<td class="loginFailCss1" style="width: 300px;">
				<input class="loginFailCss2" type="text" name="id" 
					value="${id}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="loginFailCss1" style="width: 180px;">이름</td>
			<td class="loginFailCss1" style="width: 300px;">
				<input class="loginFailCss2" type="text" name="userName" 
					value="${userName}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="loginFailCss1">핸드폰 번호</td>
			<td class="loginFailCss1">
				<input class="loginFailCss2" type="text" name="phone" 
					value="${phone}" readonly="readonly">
			</td>
		</tr>
	</table>
	</div>
	<div style="width: 700px; margin: auto;">
	<input style="height: 50px; width: 200px; font-size: 22px; margin: 0px; 
		float: right; cursor: pointer; background-color: #24afff; 
		color: white; font-weight: bold; border-radius: 7px; padding: 0px;"
		type="button" id="goMainBtn" onclick="goPwFindFnc()" value="뒤로 가기">
	</div>
	</div>

<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
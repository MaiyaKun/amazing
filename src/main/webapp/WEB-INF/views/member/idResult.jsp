<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>

<style type="text/css">
.idFindCss1{
	font-family: arial;
	font-size: 22px;
	font-weight: bold;
	height: 60px;
	padding: 2px;
	
}

.idFindCss2{
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
	text-align: center;">아이디 확인</p>
	<div style="height: 350px;">
	<div style="text-align:center; margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
	입력하신 정보와 일치하는 아이디는<br>
	<h1>${id}</h1>입니다.
	</div>
	<div style="margin: auto; width: 700px;">
		<input style="height: 50px; width: 700px; font-size: 22px; 
			background-color: #24afff; color: white; font-weight: bold; border-radius: 7px;"
			type="button" id="idFindBtn" onclick="goMainFnc()" value="로그인 하러 가기">
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
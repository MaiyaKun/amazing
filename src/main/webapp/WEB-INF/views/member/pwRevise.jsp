<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 재설정</title>

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
	
	function goMainFnc() {
		location.href = "/amazing/index.jsp";
	}
	
	function pwReviseFnc() {
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
		if(pwd1 == "" || pwd2 == "") {
			alert('빈 칸 없이 입력하세요');
			return;
		}else if(pwd1 != pwd2){
			alert('입력하신 정보가 서로 다릅니다.');
			return;
		}
		alert('비밀번호 변경이 완료 되었습니다.');
		var formObj = $('#pwRevise');
		formObj.attr("action", "./pwFinalCtr.do");
		formObj.submit();
	}
	
</script>
</head>
<body>

<p style="font-family: arial; font-size: 70px; font-weight: bold; 
	text-align: center; margin: 40px 0px 20px 0px; cursor: pointer;" 
	onclick="goMainFnc()">으 메 이 징</p>
<hr style="width: 550px; border: solid 2px;">
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">패스워드 재설정</p>
	<div style="height: 380px;">
	<form id="pwRevise" method="post">
	<div style="margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
	<table style="margin: auto;">
		<tr>
			<td class="pwFindCss1" style="width: 180px;">새로운 패스워드</td>
			<td class="pwFindCss1" style="width: 300px;">
				<input class="pwFindCss2" type="password" id="pwd1" 
					name="passWord" placeholder="패스워드 입력">
			</td>
		</tr>
		<tr>
			<td class="pwFindCss1">패스워드 확인</td>
			<td class="pwFindCss1">
			<input class="pwFindCss2" type="password" name="passwordConfirm" id="pwd2" placeholder="패스워드 입력">
			<input type="hidden" id="userNoHidden" name="userNo" value="${userNo}">
			</td>
		</tr>
	</table>
	
	</div>
	<div style="margin: auto; width: 700px;">
		<input style="height: 50px; width: 700px; font-size: 22px; 
			background-color: #24afff; color: white; font-weight: bold; 
			cursor: pointer; border-radius: 7px;" type="button" 
			id="pwFindBtn" onclick="pwReviseFnc()" value="패스워드 변경 확인">
 	</div>
	</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
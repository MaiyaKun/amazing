<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으메이징</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js">
</script>

<script type="text/javascript">

	$(document).ready(function () {
		var temp = $('#memberCheckTemp').val() * 1;
		
		if(temp * 1 > 0 ){
			location.href="./stillLogin.do";
		}
		
	});

	function moveHeaderFnc() {
		var formObj = $('#loginForm');
//		#loginForm이라고 하는 id를 가진 요소의 모든것을 가져온다
					
		formObj.attr("action", "./member/loginCtr.do");
		formObj.submit();

	}

	function moveIdFindFnc() {
		location.href="/amazing/idFind.do";
	}
	
	function movePwFindFnc() {
		location.href="/amazing/pwFind.do";
	}
	
	function moveAddFormFnc() {
		location.href="/amazing/addForm.do";
	}
	
	



</script>

<style type="text/css">

</style>

</head>
<body> 

<p style="font-family: arial; font-size: 70px; font-weight: bold; 
	text-align: center; margin: 40px 0px 20px 0px; cursor: pointer;" 
	onclick="goMainFnc()">으 메 이 징</p>
	<hr style="width: 400px; border: solid 2px;"><br><br>
	<p style="font-family: arial; font-size: 40px; font-weight: bold; 
		text-align: center;">로그인</p>
	<div style="margin: auto; width: 1000px;">
		<div>
			<form id="loginForm" method="post">
				<table style="margin: auto;">
					<tr>
						<td style="width: 280px; height: 60px;">
							<input style="padding: 5px 10px; height: 35px; 
								width: 250px; font-size: 20px;" 
								type="text" name="id" placeholder="아이디 입력">
						</td>
						<td rowspan="2">
							<input style="font-size: 20px; background-color: #24afff;
								font-size: 22px; color: white; font-weight: bold; 
								height: 115px; width: 115px; border-radius: 7px; cursor: pointer;" 
								type="button" id="loginBtn" value="로그인" onclick="moveHeaderFnc()">
						</td>
					</tr>
					<tr>
						<td style="width: 280px; height: 60px;">
							<input style="padding: 5px 10px; height: 35px; width: 250px; font-size: 20px;"
								type="password" name="passWord" placeholder="패스워드 입력">
						</td>
					</tr>
				</table>
			</form>
			<table style="margin: auto;">
				<tr>
					<td style="width: 280px; height: 30px;">
						<p style="width: 280px; height: 30px; cursor: pointer; margin: 0px; 
							padding: 0px; display: inline; font-weight: bold;" 
							onclick="moveIdFindFnc()">아이디 찾기</p>
							&nbsp;&nbsp;/&nbsp;&nbsp;
						<p style="width: 280px; height: 30px; cursor: pointer; margin: 0px; 
							padding: 0px; display: inline; font-weight: bold;" 
							onclick="movePwFindFnc()">패스워드 찾기</p>
					</td>
					<td>
						<input style="font-size: 15px; background-color: lightgrey; 
							font-weight: bold; font-size: 17px; height: 40px; 
							width: 115px; border-radius: 5px; cursor: pointer;" 
							type="button" id="memberAddBtn" onclick="moveAddFormFnc()" value="회원가입">
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div style="height: 125px;">
		<input type="hidden" id='memberCheckTemp' value="${sessionScope.memberLogin.userNo }">
	</div>
	
	<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
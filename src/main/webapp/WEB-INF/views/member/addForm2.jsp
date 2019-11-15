<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
.addFormCss1{
	font-family: arial;
	font-size: 22px;
	font-weight: bold;
	height: 60px;
	padding: 2px;
	
}

.addFormCss2{
	padding: 5px 10px;
	height: 35px;
	width: 330px;
	font-size: 20px;
	font-family: arial;
	padding: 4px 10px;
}

.addFormCss3{
	height: 50px;
	width: 200px;
	font-size: 22px;
	cursor: pointer; 
	background-color: #24afff;
	color: white;
	font-weight: bold;
	border-radius: 7px;"
}
</style>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js">
</script>

<script type="text/javascript">
	function goMainFnc() {
		location.href = "/amazing/index.jsp";
	}
	
	function moveIndexFnc() {
		location.href="/amazing/index.jsp";
	}

	function memberAddFnc() {
		
		var pwd3=$("#pwd3").val();
		var pwd4=$("#pwd4").val();
		if(pwd3 == "" || pwd4 == "") {
			alert('빈 칸 없이 입력하세요');
			return;
		}else if(pwd3 != pwd4){
			alert('입력하신 정보가 서로 다릅니다.');
			return;
		}
		var formObj = $('#addFormCpt');
		alert('회원가입이 완료 되었습니다.')
		formObj.attr("action", "./addCtr.do");
		formObj.submit();
	}
	
	function stringCheck() {	
		
		var stringTemp = $('#phone').val() + "";
		
		if(isNaN(stringTemp) == true){
			alert("숫자만 입력해 주세요.");
			$('#phone').val("");
		}
	}
	
</script>
</head>
<body>

<p style="font-family: arial; font-size: 70px; font-weight: bold; 
	text-align: center; margin: 40px 0px 20px 0px; cursor: pointer;"
	onclick="goMainFnc()">으 메 이 징</p>
<hr style="width: 350px; border: solid 2px;">
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">회원가입</p>
	<div style="height: 550px;">
	<form id="addFormCpt" method="post">
	<div style="margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
	<table style="margin: auto;">
		<tr>
			<td class="addFormCss1" style="width: 180px;">아이디</td>
			<td class="addFormCss1" style="width: 300px;">
				<input class="addFormCss2" type="text" name="id" 
					readonly="readonly" value="${memberDto.id}">
			</td>
		</tr>
		<tr>
			<td class="addFormCss1">패스워드</td>
			<td class="addFormCss1">
				<input class="addFormCss2" type="password" name="passWord" 
					id="pwd3" placeholder="패스워드 입력" value="${memberDto.passWord }">
			</td>
		</tr>
		<tr>
			<td class="addFormCss1">패스워드 확인</td>
			<td class="addFormCss1">
				<input class="addFormCss2" type="password" name="passwordChk" 
					id="pwd4" placeholder="패스워드 입력" value="${passwordChk }">
			</td>
		</tr>
		<tr>
			<td class="addFormCss1">이름</td>
			<td class="addFormCss1">
				<input class="addFormCss2" type="text" name="userName" 
					placeholder="이름 입력" value="${memberDto.userName }">
			</td>
		</tr>
		<tr>
			<td class="addFormCss1">핸드폰 번호</td>
			<td class="addFormCss1">
				<input class="addFormCss2" id="phone" type="text" name="phone" onkeyup="stringCheck();"
					placeholder="핸드폰 번호 입력" value="${memberDto.phone }">
			</td>
		</tr>
		<tr>
			<td class="addFormCss1">주소</td>
			<td class="addFormCss1">
				<input class="addFormCss2" type="text" name="address" 
					placeholder="주소 입력" ${memberDto.address }>
			</td>
		</tr>
	</table>
	</div>
	<div style="margin: auto; width: 700px;">
		<input class="addFormCss3" style="float: left" type="button" 
			id="indexBtn" onclick="moveIndexFnc()" value="뒤로 가기">
		
		<input class="addFormCss3" style="float: right"	type="button" 
			id="memberAddBtn" onclick="memberAddFnc()" value="가입 완료">
		
	</div>
	
	</form>
</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>

<style type="text/css">
.myInfoCss1{
	font-family: arial;
	font-size: 22px;
	font-weight: bold;
	height: 60px;
	padding: 2px;
	
}

.myInfoCss2{
	padding: 5px 10px;
	height: 35px;
	width: 330px;
	font-size: 20px;
	font-family: arial;
	padding: 4px 10px;
}

#whole {
	height: 520px;
}

</style>
<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js">
</script>

<script type="text/javascript">

function moveMyInfoReviseFnc() {
	var formObj = $('#myInfoReviseForm');
//	#myInfo이라고 하는 id를 가진 요소의 모든것을 가져온다
				
	formObj.attr("action", "./myInfoRevise.do");
	formObj.submit();
}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">내 정보 보기</p>
	<div id="whole">
		<div style="margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
			<table style="margin: auto;">
				<tr>
					<td class="myInfoCss1" style="width: 180px;">아이디</td>
					<td class="myInfoCss1" style="width: 300px;">
						<input class="myInfoCss2" type="text" name="id" readonly="readonly" value="${id}">
					</td>
				</tr>
				<tr>
					<td class="myInfoCss1">잔여캐시</td>
					<td class="myInfoCss1">
						<input class="myInfoCss2" type="text" name="cash" readonly="readonly" value="${cash}">
					</td>
				</tr>
				<tr>
					<td class="myInfoCss1">이름</td>
					<td class="myInfoCss1">
						<input class="myInfoCss2" type="text" name="userName" readonly="readonly" value="${userName}">
					</td>
				</tr>
				<tr>
					<td class="myInfoCss1">핸드폰 번호</td>
					<td class="myInfoCss1">
						<input class="myInfoCss2" type="text" name="phone" readonly="readonly" value="${phone}">
					</td>
				</tr>
				<tr>
					<td class="myInfoCss1">주소</td>
					<td class="myInfoCss1">
						<input class="myInfoCss2" type="text" name="address" readonly="readonly" value="${address}">
					</td>
				</tr>
			</table>
		</div>
		<form id="myInfoReviseForm" action="./myInfoRevise.do" method="post">
			<div style="margin: auto; width: 700px;">
				<input style="height: 50px; width: 700px; font-size: 22px; 
					background-color: #24afff; color: white; font-weight: bold; border-radius: 7px; cursor: pointer;"
					type="button" id="myInfoReviseBtn" onclick="moveMyInfoReviseFnc()" value="정보 수정하기">
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
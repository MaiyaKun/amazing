<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>

<style type="text/css">
.myInfoReviseCss1{
	font-family: arial;
	font-size: 22px;
	font-weight: bold;
	height: 60px;
	padding: 2px;
	
}

.myInfoReviseCss2{
	padding: 5px 10px;
	height: 35px;
	width: 330px;
	font-size: 20px;
	font-family: arial;
	padding: 4px 10px;
}

#whole{
	height : 520px;
}

</style>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js">
</script>

<script type="text/javascript">
// 	function updateCtrFnc() {
// 		var formObj = $('#updateCtr');
// 		formObj.attr("action", "./updateCtr.do");
// 		formObj.submit();
// 	}
</script>



</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">내 정보 수정</p>
	<div id="whole">
		<form id="updateCtr" action="./updateCtr.do" method="post"> 
			<div style="margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
				<table style="margin: auto;">
					<tr>
						<td class="myInfoReviseCss1" style="width: 180px;">아이디</td>
						<td class="myInfoReviseCss1" style="width: 300px;">
							<input maxlength="15" class="myInfoReviseCss2" type="text" name="id" value="${id}">
						</td>
					</tr>
					<tr>
						<td class="myInfoReviseCss1">이름</td>
						<td class="myInfoReviseCss1">
							<input maxlength="10" class="myInfoReviseCss2" type="text" name="userName" value="${userName}">
						</td>
					</tr>
					<tr>
						<td class="myInfoReviseCss1">핸드폰 번호</td>
						<td class="myInfoReviseCss1">
							<input maxlength="23" class="myInfoReviseCss2" type="text" name="phone" value="${phone}">
						</td>
					</tr>
					<tr>
						<td class="myInfoReviseCss1">주소</td>
						<td class="myInfoReviseCss1">
							<input maxlength="60" class="myInfoReviseCss2" type="text" name="address" value="${address}">
							<input class="myInfoReviseCss2" type="hidden" name="userNo" value="${userNo}">
						</td>
					</tr>
				</table>
			</div>
			<div style="margin: auto; width: 700px;">
				<input style="height: 50px; width: 700px; font-size: 22px; cursor: pointer;
					background-color: #24afff; color: white; font-weight: bold; border-radius: 7px;"
					type="submit" id="updateCtrBtn" value="수정 완료">
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
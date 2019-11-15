<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.headerCss1 {
	font-family: arial;
	font-size: 15px;
	font-weight: bold;
	text-align: bottom;
	height: 32px;
	cursor: pointer;
}

.headerCss2 {
	font-family: arial;
	font-weight: bold;
	background-color: #AAFFA3;
	font-size: 50px;
	text-align: center;
	margin: 0px;
	padding: 21px;
	cursor: pointer;
}

.headerCss3 {
	font-family: arial;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	margin: 0px;
	padding: 3px;
	width: 250px;
	height: 45px;
	cursor: pointer;
}

</style>
<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js">
</script>

<script type="text/javascript">
$(document).ready(function () {
	var memberTemp = $('#tempMemberInput').val() * 1;
	
	if(memberTemp == 0){
		location.href="/amazing/index.jsp";
	}
	
	$('td.headerCss3').hover(function(e) {
		$(this).css({'background-color':'#999999', 'color':'white'});
	}, function(e) {
		$(this).css({'background-color':'#EAEAEA', 'color':'black'});
	});
});

function moveMyInfoFnc() {
	var formObj1 = $('#myInfo');
//	#myInfo이라고 하는 id를 가진 요소의 모든것을 가져온다
				
	formObj1.attr("action", "/amazing/myInfo.do");
	formObj1.submit();
}

function moveCashChargeFnc() {
	var formObj2 = $('#myInfo');
//	#myInfo이라고 하는 id를 가진 요소의 모든것을 가져온다
				
	formObj2.attr("action", "/amazing/cashCharge.do");
	formObj2.submit();
}

function moveDvdShopFnc() {
	location.href="/amazing/product/list.do";
}
function moveFreeBoardFnc() {
	location.href="/amazing/board/boardList.do";
}
function moveMyOrderFnc() {
	location.href="/amazing/product/orderList.do";
}
function moveMyCartFnc() {
	location.href="/amazing/product/productBasket.do";
}

function logoutFnc() {
	location.href="/amazing/logout.do";
}



</script>

<title>header</title>
</head>
<body>

<input type="hidden" id="tempMemberInput" value="${sessionScope.memberLogin.userNo}">
<div style="width: 1000px; height: 36px; margin: auto;">
	<form id="myInfo" action="./myInfo.do" method="post">
	<table style="margin: auto;">
		<tr>
			<td style="width: 400px;"></td>
			
			<td class="headerCss1" 
				onclick="moveMyInfoFnc()">${sessionScope.memberLogin.userName}</td>
			<td style="color: lightgrey;">&nbsp;|&nbsp;</td>
			<td class="headerCss1" 
				onclick="moveCashChargeFnc()">${sessionScope.memberLogin.cash} 캐시</td>
			<td style="color: lightgrey;">&nbsp;|&nbsp;</td>
			<td class="headerCss1" 
				onclick="moveMyInfoFnc()">마이 페이지</td>
			<td style="width: 100px;"></td>
			<td class="headerCss1" onclick="logoutFnc()">로그아웃</td>
		</tr>
	</table>
	</form>
</div>
		<div>
			<p class="headerCss2" onclick="moveDvdShopFnc()">프 랑 켄 슈 타 인</p>
		</div>
<div style="width: 100%; height: 56px; background-color: #EAEAEA; margin-bottom:20px;">
<div style="width: 1000px; margin: auto;">
	<table style="margin: auto;">
		<tr>
			<td class="headerCss3" onclick="moveDvdShopFnc()">DVD 쇼핑하기</td>
			<td class="headerCss3" onclick="moveFreeBoardFnc()">자유게시판</td>
			<td class="headerCss3" onclick="moveMyOrderFnc()">주문내역 확인</td>
			<td class="headerCss3" onclick="moveMyCartFnc()">장바구니</td>
			<td class="headerCss3" onclick="moveCashChargeFnc()">캐시 충전</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>
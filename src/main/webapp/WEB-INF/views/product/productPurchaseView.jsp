<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 진행</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$('#container').css({'width':'700px', 'margin':'auto'});
		
		$('#container').find('table').css({'width':'700px', 'border-collapse':'collapse'});
		
		$('#container').find('td').css({'text-align':'center'});
		
		$('.listTable').css('border','2px solid #aaaaaa');
		
		$('.listTable').find('td').css('border','1px solid #eeeeee');
		
		$('#container').find('h1').css('text-align','center');
		$('#container').find('h2').css('text-align','right');
		
		$('.titleTd').css('text-align', 'left');
		
		$('.numTd').css('text-align', 'right');
		
		$('.btn').css({'border':'none','background-color': '#24afff', 'cursor': 'pointer',
			'font-size': '20px', 'font-weight': 'bolder',
			'color': 'white', 'margin-left':'5px;'});
		
		$('.textInput').css({'border':'3px solid #99ccff', 'width':'500px', 'height':'30px',
							'font-size':'20px', 'border-radius':'10px', 'padding':'5px'});
		
		$('#headTr').css({'background-color':'#dddddd', 'font-weight':'bold'});
		
		$('#cash').css({'font-size':'20px', 'font-weight':'bold',
					'text-align':'right'});
		
		$('.center').css('text-align', 'center');
		
		$('#container').find('p').css({'text-align':'center', 'font-size':'25px'});
		
		$('#order').css({'text-align':'right'});
		
		$('#order').find('table').css({'margin-top':'30px', 'margin-bottom':'30px',
									'font-size':'20px', 'font-weight':'bold'});
		
		$('#order').find('td').css({'text-align':'left'});
		
		$('#finalButton').css({'font-size':'30px', 'font-weight':'bold', 'width':'250px'});
		
		cashCheck();
	});
	
	function cashCheck() {
		if($('#hiddenCash').val()*1 < 0){
			$('#minusStr').css({'color':'red', 'font-weight':'bold'});
			$('#cashAlert').text('충전된 캐시가 부족합니다.');
		}
	}
		
	function goCashAdd() {
		location.href="";
	}
	
	function sameOrder() {
		$('#pickName').val($('#userName').val());
		$('#pickAddress').val($('#userAddress').val());
		$('#pickPhone').val($('#userPhone').val());
	}
	
	function finalPurchaseFnc() {
		if( $('#pickName').val() == "" ){
			alert("수령인 이름이 비어있습니다.");
			$('#pickName').focus();
			return;
		}
		if( $('#pickAddress').val() == "" ){
			alert("수령인 주소가 비어있습니다.");
			$('#pickAddress').focus();
			return;
		}
		if( $('#pickPhone').val() == "" ){
			alert("수령인 전화번호가 비어있습니다.");
			$('#pickPhone').focus();
			return;
		}
		
		
		var formObj = $('#orderForm');
		
		formObj.attr("action", "./productPurchaseCtr.do");
		formObj.attr("method", "post");
		
		formObj.submit();
	}
	
	function goChargePage() {
		var formObj = $('#tempForm');
		formObj.attr("action", "../cashCharge.do");
		formObj.attr("method", "post");
		formObj.submit();
	}

</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div id="container">
	<h1>결제 진행</h1>
	
	<table class="listTable">
		<colgroup>
			<col style="width: 30px">
			<col style="width: 340px">
			<col style="width: 120px">
			<col style="width: 60px">
			<col style="width: 150px">
		</colgroup>
		<tr id="headTr">
			<td></td>
			<td>상품명</td>
			<td>단가</td>
			<td>수량</td>
			<td>가격</td>
		</tr>	
		<c:choose>
			<c:when test="${orderType eq 'solo' }">
				<tr>
					<td></td>
					<td>${productMap.TITLE }</td>
					<td>${productMap.PRICE }</td>
					<td>${productMap.QUANTITY }</td>
					<td>${productMap.SUM}</td>
				</tr>
			</c:when>
			<c:when test="${orderType eq 'list' }">
				<c:forEach var="productList" items="${productList}">
					<tr>
						<td></td>
						<td class="titleTd">
							&nbsp; ${productList.TITLE }
						</td>
						<td class="numTd">
							<fmt:formatNumber value="${productList.PRICE }"
								type="currency" currencyCode="KRW"/>
						</td>
						<td>${productList.QUANTITY }</td>
						<td class="numTd">
							<fmt:formatNumber value="${productList.SUM }"
								type="currency" currencyCode="KRW"/>
						</td>
					</tr>
				</c:forEach>
			</c:when>
		
		</c:choose>
	</table>
	<div id="allSum">
		<h2>
			총 결제금액 : <fmt:formatNumber value="${allSum }" type="currency" currencyCode="KRW"/>
		</h2>
		<hr>
	</div>
	<div id="cash">
		<table>
			<colgroup>
				<col style="width: 350px">
				<col style="width: 350px">
			</colgroup>
			<tr>
				<td>사용 가능 캐쉬 잔액</td>
				<td>
					<fmt:formatNumber value="${memberDto.cash}"
						type="currency" currencyCode="KRW"/>
				</td>
			</tr>
			<tr>
				<td>결제 후 잔여 캐쉬</td>
				<td id="minusStr">
					<fmt:formatNumber value="${memberDto.cash - allSum }"
						type="currency" currencyCode="KRW"/>
					<input type="hidden" id="hiddenCash" value="${memberDto.cash - allSum}">
				</td>
			</tr>
		</table>
		<hr>
		<p id="cashAlert">결제를 진행 가능합니다.</p>
		<span><input type="button" class="btn" value="캐시충전" onclick="goChargePage();"></span>
	</div>
	<hr>
	<div id="order">
		<table>
			<colgroup>
				<col style="width: 200px">
				<col style="width: 500px">
			</colgroup>
			<tr>
				<td>주문자</td>
				<td>
					<input type="text" id="userName" class="textInput"
						value="${memberDto.userName }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" id="userAddress" class="textInput"
						value="${memberDto.address }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>주문자 연락처</td>
				<td>
					<input type="text" id="userPhone" class="textInput"
						value="${memberDto.phone }" readonly="readonly">
				</td>
			</tr>
		</table>
			<span>
				<input type="button" class="btn"
					value="주문자와 동일" onclick="sameOrder();">
			</span>
		<form id="orderForm">
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 500px">
				</colgroup>
				<tr>
					<td>수령인</td>
					<td>
						<input type="text" id="pickName" name="pickName" class="textInput"
							maxlength="10">
					</td>
				</tr>
				<tr>
					<td>수령인 주소</td>
					<td>
						<input type="text" id="pickAddress" name="pickAddress" class="textInput"
							maxlength="66">
					</td>
				</tr>
				<tr>
					<td>수령인 연락처</td>
					<td>
						<input type="text" id="pickPhone" name="pickPhone" class="textInput"
							maxlength="15">
					</td>
				</tr>
			</table>
			<input type="hidden" name="orderList" value="${orderType }">
			<input type="hidden" name="userNo" value="${sessionScope.memberLogin.userNo}">
			<input type="hidden" name="sum" value="${allSum}">
			<c:choose>
				<c:when test='${orderType eq "solo" }'>
					<input type="hidden" name="productNo" value="${productMap.PRODUCT_NO}">
					<input type="hidden" name="quantity" value="${productMap.QUANTITY}">
				</c:when>
				
				<c:when test='${orderType eq "list" }'>
					<input type="hidden" name="basketList" value="${basketList }">
				</c:when>
			</c:choose>
		</form>
	</div>
	<hr>
	<div class='center'>
		<span>
			<c:if test="${(memberDto.cash - allSum) >= 0}">
				<input type="button" value="결제하기" id="finalButton"
					class="btn" onclick="finalPurchaseFnc();">
			</c:if>
		</span>
	</div>
</div>
<form id='tempForm'></form>
<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
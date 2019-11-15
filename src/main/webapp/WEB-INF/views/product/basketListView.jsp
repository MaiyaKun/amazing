<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#container').css({'width':'1000px', 'margin':'auto'});
		
		$('#container').find('table').css({'width':'1000px', 'border-collapse':'collapse'});
		
		$('#container').find('td').css({'border': 'solid 1px #aaaaaa', 'text-align': 'center', 'height':'40px'});
		
		$('.btn').css({'border':'none','background-color': '#24afff', 'cursor': 'pointer',
			'font-size': '20px', 'font-weight': 'bolder', 'color': 'white', 'margin':'10px'});
		
		$('#tableHead').find('td').css({'height':'30px', 'background-color':'#dddddd'});
		
		$("input[class^='quantity']").css('width','60px');
	
		$(".quantityBtn").css('width','45px');
		
		$("#quantityBtn").parent().css('padding','0');
		
		$('h1').css('text-align', 'center');
		
		$('.titleImg').css({'height':'70px', 'width':'55px'});
		
		$('#btnDiv').css('text-align', 'right');
		
		selectBasket();
		
		$("input[id^='quantity']").on('keyup', function(e) {
			stringCheck($(this).val());
		});
		$("input[id^='quantity']").on('paste', function(e) {
			alert("붙여넣기는 사용할 수 없습니다.");
			location.href = "./productBasket.do";
		});
		
	// 	$("a[name^='choose']").on('click', function(e){
	// 		e.preventDefault();
	// 	});
		
	});

	function stringCheck(check) {
		if(isNaN(check) == true){
			alert("숫자만 입력해 주세요.");
			location.href = "./productBasket.do";
		} else if(check < 1){
			alert("1 이상의 숫자를 입력해 주세요.");
			location.href = "./productBasket.do";
		}
	}
	
	function basketDeleteFnc(basketNo) {
		var formObj = $('#basketForm');
		var actionStr = "./basketDelete.do";
		var htmlStr = "";
		
		htmlStr += '<input type="hidden" value="' + basketNo;
		htmlStr += '" name="basketNo">';
		
		formObj.attr('action', actionStr);
		formObj.html(htmlStr);
		formObj.submit();
	}
	
	function quantityChangeFnc(basketNo){
		var idStr = "#quantity" + basketNo;
		var formObj = $('#basketForm');
		var actionStr = "./basketQuantity.do";
		var htmlStr = "";
		
		htmlStr += '<input type="hidden" value="' + basketNo;
		htmlStr += '" name="basketNo">';
		htmlStr += '<input type="hidden" value="' + $(idStr).val();
		htmlStr += '" name="quantity">';
		
		formObj.attr('action', actionStr);
		formObj.html(htmlStr);
		
		formObj.submit();
	}
	
	function insertComma(num){
		var len, point, str; 
	
		num = num + ""; 
		point = num.length % 3 ;
		len = num.length; 
		
		str = num.substring(0, point); 
		while (point < len) { 
		    if (str != "") str += ","; 
		    str += num.substring(point, point + 3); 
		    point += 3; 
		}
		str = "\\ " + str;
		return str;
	}
	
	function selectBasket() {
		var allSum = 0;
		var sumId = "";
		var commaSum = "";
		var keyList = "";
	
		$("input[name^='chooseBasket']:checked").each(
			function(i, element) {
				if(keyList != ""){
					keyList += ",";
				}
				keyList += $(this).val();
				
				sumId = "#sum" + $(this).val();
				allSum += $(sumId).val() * 1;
		});
		
		$('#basketList').val(keyList);
		
		$('#allSum').val(allSum);
		
		commaSum = insertComma(allSum);
		
		$('#sumTd').text(commaSum);
	}
	
	function basketPurchase(){
		var sum = $('#allSum').val() * 1;
		if(sum <= 0){
			alert("장바구니에 상품이 없습니다.");
			return;
		}
		var formObj = $('#basketForm');
		
		formObj.attr("action", "./productPurchase.do");
		formObj.submit();
	}

</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="container">
		<h1>장바구니</h1>
		
		<table>
			<colgroup>
				<col style="width:30px;">
				<col style="width:55px;">
				<col style="width:325px;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:50px;">
			</colgroup>
			<tr id="tableHead">
				<td>선택</td>
				<td>포스터</td>
				<td>상품명</td>
				<td>단가</td>
				<td>구매 수량</td>
				<td>총 가격</td>
				<td>삭제</td>
			</tr>
			
			<c:forEach var="basketList" items="${basketList }">
				<tr>
					<td>
						<input type="checkbox" name="chooseBasket"
							onclick="selectBasket();"
							value="${basketList.BASKET_NO}" checked="checked">
					</td>
					<td>
						<img class="titleImg" 
							src='<c:url value="/resources/img/${basketList.TITLE_FILE}"/>'>
					</td>
					<td>${basketList.TITLE }</td>
					<td>
						<fmt:formatNumber value="${basketList.PRICE }"
							type="currency" currencyCode="KRW"/>
					</td>
					<td>
						<input type="text" class="quantity${basketList.BASKET_NO }" maxlength="5"
							id="quantity${basketList.BASKET_NO}" value="${basketList.QUANTITY }">
						<input type="button" class="quantityBtn" value="변경"
							onclick="quantityChangeFnc(${basketList.BASKET_NO });">
					</td>
					<td>
						<fmt:formatNumber value="${basketList.PRICE * basketList.QUANTITY }"
							type="currency" currencyCode="KRW"/>
						<input type="hidden" id="sum${basketList.BASKET_NO}"
							value="${basketList.PRICE * basketList.QUANTITY }">	
					</td>
					<td>
						<input type="button" class="btn" value="삭제"
							onclick="basketDeleteFnc(${basketList.BASKET_NO})">
					</td>
				</tr>
			</c:forEach>
			<tr>
				 <td></td>
				 <td colspan="4">총 결제 금액</td>
				 <td id="sumTd"></td>
				 <td>
				 	<input type="hidden" id="allSum">
				 </td>
			</tr>
		</table>
		<div id="btnDiv">
			<span>
				<input type="button" class="btn" value="결제 페이지로" onclick="basketPurchase();">
			</span>
		</div>
		
		<form id="basketForm" method="post">
			<input type="hidden" id="basketList" name="basketList" value="temp">
			<input type="hidden" id="originCheck" name="originCheck" value="cart">
		</form>
		
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
	
</body>
</html>
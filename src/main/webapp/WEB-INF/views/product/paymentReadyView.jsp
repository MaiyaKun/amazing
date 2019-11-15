<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productDto.title}</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$('#container').css({'width':'700px', 'margin':'auto'});
		
		$('#container').find('table').css({'width':'700px', 'border-collapse':'collapse', 'border':'2px solid #aaaaaa'});
		
		$('#imgBg').css('background-color', '#cccccc');
		
		$('#paymentTable').css({'font-size': '25px', 'font-weight': 'bolder'});
		
		$('#container').find('td').css({'text-align':'center', 'border':'1px solid #eeeeee'});
		
		$('.btn').css({'border':'none','background-color': '#24afff', 'cursor':'pointer',
			'font-size': '20px', 'font-weight': 'bolder', 'color': 'white', 'margin-left':'5px;'});
		
		$('.titleImg').css({'width':'300px', 'height':'400px'});
		
		$('#container').find('input').css('border', '3px solid #99ccff');
		
		$('#quantity').css({'width':'180px', 'height':'30px', 'font-size':'18px'});
		
		$('#stockError').css({ 'font-size':'15px', 'color':'red', 'backgrount-color':'#cccccc' });
		
		$('#sumPrice').html(insertComma( $('#hiddenPrice').val() ));
	});
	
	
	
	$(document).on('paste', '#quantity', function(e) {
		var temp = 1;
		alert("붙여넣기는 허용되지 않습니다.");
		
		$(this).val(temp);
	});
	$(document).on('keyup', '#quantity', function(e) {
		var resultNum = 0;
		
		if($(this).val() < 1){
			alert("1 이상의 수를 입력하세요");
			$(this).val(1);
		}
		
		resultNum = stockCheck();
		
		insertComma(resultNum);
	});
	$(document).on('change', '#quantity', function(e) {
		var resultNum = "";	
		
		if($(this).val() < 1){
			alert("1 이상의 수를 입력하세요");
			$(this).val(1);
		}
		
		resultNum = stockCheck();
		
		insertComma(resultNum);
	});
	function stockCheck() {
		var quantity = $('#quantity');
		var price = 0;
		
		if(isNaN(quantity.val()) == true){
			alert("숫자만 입력해 주십시오");
			quantity.val(1);
			price = $('#hiddenPrice').val() * 1;
			return (quantity.val() *  price);
		}
		
		var stock = 0
		stock = $('#hiddenStock').val() * 1;

		if(quantity.val() > stock) {
			$('#stockError').html("재고수량보다 주문수량이 많을 수 없습니다.");
			quantity.val( stock );
		} 
		else {
			$('#stockError').html("");
		}
		
		price = $('#hiddenPrice').val() * 1;
		
		return ( quantity.val() *  price);
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

		$('#sumPrice').html(str);
	}
	
	function moveBackFnc() {
		var pagingForm = $('#pagingForm');
		
		pagingForm.attr("action", "./detail.do");
		pagingForm.attr("method", "get");
		
		pagingForm.submit();
	}
	
	function goBasketFnc() {
		var formObj = $('#pagingForm');
		var stockStr = $('#quantity').val() * 1;
		
		var formStr = "";
		formStr += '<input type="hidden" name="quantity" value="';
		formStr += stockStr + '">';
		
// 		alert(formStr);
		formObj.html( formObj.html() + formStr );
		formObj.attr("action", "./confirmBasket.do");
		formObj.attr("method", "get");
		
		formObj.submit();
	}
	
	function goPaymentFnc() {
		var formObj = $('#pagingForm');
		var htmlStr = "";
		
		htmlStr += '<input type="hidden" name="quantity" value="' + $('#quantity').val();
		htmlStr += '">';
		
		formObj.html( formObj.html() + htmlStr);
		formObj.attr("action", "./productPurchaseOne.do");
		formObj.attr("method", "post");
		
		formObj.submit();
	}
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="container">
		<h1 style="text-align: center;">[${productDto.title }] 결제</h1>

		<table id="paymentTable">
			<colgroup>
				<col style="width:350px;">
				<col style="width:130px;">
				<col style="width:220px;">
			</colgroup>
			<tr>
				<td id="imgBg" rowspan="7">
					<img id='titleFile' class="titleImg"
						src='<c:url value="/resources/img/${productDto.titleFile}"/>'/>
				</td>
				<td>제목</td>
				<td>${productDto.title}</td>
			</tr>
			<tr>
				<td>단가</td>
				<td>
					<fmt:formatNumber value="${productDto.price }"
						type="currency" currencyCode="KRW"/>
					<input id="hiddenPrice" type="hidden" value="${productDto.price }">
				</td>
			</tr>
			<tr>
				<td>재고 수량</td>
				<td>
					<span id="stock">${productDto.stock }</span>
					<input id="hiddenStock" type="hidden" value="${productDto.stock }">
				</td> 
			</tr>
			<tr>
				<td>구매 개수</td>
				<td><input id="quantity" type="text" value="1" maxlength="5"></td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="stockError"></span>
				</td>
			</tr>
			<tr>
				<td>합계</td>
				<td>\<span id="sumPrice"></span></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn" value="돌아가기" onclick="moveBackFnc();">
					<input type="button" class="btn" value="장바구니" onclick="goBasketFnc();">
					<input type="button" class="btn" value="바로구매" onclick="goPaymentFnc();">
				</td>
			</tr>
		</table>
		
		<form id="pagingForm">
			<input type="hidden" name="productNo" value="${productDto.productNo }">
			<input type="hidden" name="curPage" value="${curPage }">
			<input type="hidden" name="searchOption" value="${searchOption}">
			<input type="hidden" name="keyword" value="${keyword}">
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
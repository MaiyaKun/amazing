<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 [ ${orderUserMap.ORDER_IDX } ]</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
	
<script type="text/javascript">

	$(document).ready(function () {
		$('#container').css({'width':'1000px', 'margin':'auto'});
		
		$('#container').find('table').css({'width':'1000px',
			'border-collapse':'collapse', 'border':'2px solid #aaaaaa'});
		
		$('#container').find('td').css({'text-align':'center',
			'border':'1px solid #eeeeee', 'height':'25px'});
		
		$('.btn').css({'border':'none','background-color': '#24afff', 'cursor': 'pointer',
			'font-size': '20px', 'font-weight': 'bolder', 'color': 'white',
			'margin-left':'5px;', 'height':'40px'});
		
		$('.titleTd').css({'text-align':'left', 'padding-left':'15px', 'padding-right':'15px'});
		
		$('.numTd').css('text-align', 'right');
		
		$('#headTr').find('td').css({'background-color':'#dddddd', 'font-weight':'bold'});
		
		$('#container').find('h1').css('text-align', 'center');
		
		$('#container').find('h2').css('margin-left', '50px');
		
		$('.btnDiv').css({'padding':'20px', 'text-align':'right'});
		
		$('#container').find('a').css({'text-decoration':'none', 'color':'black', 'font-weight':'bold'});
		
		var optionObj = $('#sumTr')
		optionObj.css({'font-weight':'bold', 'font-size':'18px'});
		optionObj.find('td').css('border','2px solid #888888');
		
		optionObj = $('.userTable');
		optionObj.css({'width':'1000px', 'margin':'auto', 'margin-bottom':'50px'});
		optionObj.find('td').css({'text-align':'left', 'padding-left':'10px'});
		optionObj.find('.head').css({'background-color':'#dddddd', 'font-weight':'bold', 'text-align':'center'});
		
	});
	
	function goProductPage(no){
		var formObj = $('#pagingForm');
		var htmlStr = "";
		htmlStr += '<input type="hidden" name="productNo" value="' + no + '">';
		
		formObj.html(htmlStr);
		formObj.attr('action', './detail.do');
		formObj.submit();
	};
	
	function moveBackOrderList() {
		$('#pagingForm').submit();
	};
	
</script>
<style type="text/css">
a{
	font-weight: bolder;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div id="container">
	<h1>주문 상세</h1>
	<div>
<!-- orderList O.ORDER_IDX, P.TITLE, P.PRICE, O.QUANTITY, O.CRE_DATE -->
		<table>
			<colgroup>
				<col style="width: 200px">
				<col style="width: 300px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 200px">
			</colgroup>
			<tr id="headTr">
				<td>주문번호</td>
				<td>상 품 명 ( 클릭시 상품으로 이동 )</td>
				<td>단 가</td>
				<td>주문수량</td>
				<td>주문가격</td>
				<td>주문일자</td>
			</tr>
			<c:forEach var="orderList" items="${orderList }">
				<tr>
					<td>${orderList.ORDER_IDX }</td>
					<td class="titleTd">
						<a href="#" onclick="goProductPage(${orderList.PRODUCT_NO});">
							${orderList.TITLE }
						</a>
					</td>
					<td class="numTd">
						<fmt:formatNumber value="${orderList.PRICE }"
							type="currency" currencyCode="KRW" />
					</td>
					<td class="numTd">
						${orderList.QUANTITY }
					</td>
					<td class="numTd">
						<fmt:formatNumber value="${orderList.PRICE * orderList.QUANTITY }"
							type="currency" currencyCode="KRW" />
					</td>
					<td>
						<fmt:formatDate value="${orderList.CRE_DATE }" pattern="yyyy-MM-dd kk:mm:ss"/>					
					</td>
				</tr>
			</c:forEach>
			<tr id="sumTr">
				<td colspan="4">총 가격</td>
				<td colspan="2">
					<fmt:formatNumber value="${sum }" type="currency" currencyCode="KRW"/>
				</td>
			</tr>
		</table>
		
	</div>
	<div>
<!-- orderUserMap O.ORDER_IDX, M.USERNAME, M.ADDRESS, M.PHONE, O.PICK_NAME, O.PICK_ADDR, O.PICK_PHONE -->
		<h2>주문자 정보</h2>
		<hr>
		<table class="userTable">
			<colgroup>
				<col style="width: 100px">
				<col style="width: 300px">
				<col style="width: 100px">
				<col style="width: 300px">
			</colgroup>
			<tr>
				<td class="head">주문자명</td>
				<td>${orderUserMap.USERNAME }</td>
				<td class="head">전화번호</td>
				<td>${orderUserMap.PHONE }</td>
			</tr>
			<tr>
				<td class="head">주소</td>
				<td colspan="3">${orderUserMap.ADDRESS }</td>
			</tr>
		</table>
		<h2>수령자 정보</h2>
		<hr>
		<table class="userTable">
			<colgroup>
				<col style="width: 100px">
				<col style="width: 300px">
				<col style="width: 100px">
				<col style="width: 300px">
			</colgroup>
			<tr>
				<td class="head">주문자명</td>
				<td>${orderUserMap.PICK_NAME }</td>
				<td class="head">전화번호</td>
				<td>${orderUserMap.PICK_PHONE }</td>
			</tr>
			<tr>
				<td class="head">주소</td>
				<td colspan="3">${orderUserMap.PICK_ADDR }</td>
			</tr>
		</table>
	</div>
	<div class="btnDiv">
		<span>
			<input type="button" class="btn" value="목록으로 돌아가기" onclick="moveBackOrderList();">
		</span>
	</div>
	<form id="pagingForm" action="./orderList.do" method="get">
		<input type="hidden" id="pagingInput" name="curPage" value="${curPage }">
	</form>
</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
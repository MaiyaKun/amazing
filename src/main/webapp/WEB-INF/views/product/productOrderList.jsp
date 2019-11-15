<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	$('#container').css({'width':'1000px', 'margin':'auto'});
	
	$('#container').find('table').css({'width':'1000px', 'border-collapse':'collapse'});
	
	$('#container').find('td').css({'text-align':'center'});
	
	$('.listTable').css('border','2px solid #aaaaaa');
	
	$('.listTable').find('td').css('border','1px solid #eeeeee');
	
	$('#container').find('h1').css('text-align','center');
	$('#container').find('h2').css('text-align','right');
	
	$('.titleTd').css('text-align', 'left');
	
	$('.numTd').css('text-align', 'right');
	
	$('.btn').css({'border':'none','background-color': '#24afff','cursor': 'pointer',
		'font-size': '20px', 'font-weight': 'bolder',
		'color': 'white', 'margin-left':'5px;'});
	
	$('.textInput').css({'border':'3px solid #99ccff', 'width':'500px', 'height':'30px',
						'font-size':'20px', 'border-radius':'10px', 'padding':'5px'});
	
	$('#headTr').find('td').css({'background-color':'#dddddd', 'font-weight':'bold'});
	
	$('#tableContainer').css('height', '500px');
	
	$('#container').find('a').css({'text-decoration':'none', 'color':'black', 'font-weight':'bold'});
});

function orderDetailFnc(orderIdx) {
	var curPage = $('#tempCurPage').val();
	var htmlStr = "";
	
	htmlStr += '<input type="hidden" name="orderIdx"';
	htmlStr += ' value="' + orderIdx + '">';
	
	htmlStr += '<input type="hidden" name="curPage"';
	htmlStr += 'value="' + curPage + '">';
	
	var formObj = $('#pagingForm');
	formObj.html(htmlStr);
	formObj.attr("action", "./orderDetail.do");
	formObj.attr("method", "get");
	formObj.submit();
}

function orderDeleteFnc(ORDER_IDX) {
	
	if(confirm("삭제 시 복구할 수 없습니다. 정말로 삭제합니까?")){
	
		var curPage = $('#tempCurPage').val();
		var htmlStr = "";
		
		htmlStr += '<input type="hidden" name="orderIdx"';
		htmlStr += ' value="' + ORDER_IDX + '">';
		
		htmlStr += '<input type="hidden" name="curPage"';
		htmlStr += 'value="' + curPage + '">';
		
		var formObj = $('#pagingForm');
		formObj.html(htmlStr);
		formObj.attr("action", "./orderDelete.do");
		formObj.submit();
		
	}
}

</script>
<style type="text/css"></style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div id="container">
	<h1>주문 목록</h1>
	<div id="tableContainer">
		<table class="listTable">
			<colgroup>
				<col style="width:180px">
				<col style="width:300px">
				<col style="width:120px">
				<col style="width:100px">
				<col style="width:100px">
				<col style="width:150px">
				<col style="width:50px">
			</colgroup>
			<tr id="headTr">
				<td>주문번호</td>
				<td>상품명</td>
				<td>총 가격</td>
				<td>주문자</td>
				<td>수령인</td>
				<td>주문일자</td>
				<td></td>
			</tr>
			<c:forEach var="orderList" items="${orderList }">
				<tr>
					<td>
						<a href="#" onclick="orderDetailFnc('${orderList.ORDER_IDX}');">
							${orderList.ORDER_IDX }
						</a>
					</td>
					<td class="titleTd">
						<a href="#" onclick="orderDetailFnc('${orderList.ORDER_IDX}');">
							${orderList.TITLE }
							<c:if test="${orderList.COUNT > 1 }">등 ${orderList.COUNT }개</c:if>
						</a>
					</td>
					<td>
						<fmt:formatNumber value="${orderList.SUM}" type="currency" currencyCode="KRW"/>
					</td>
					<td>${orderList.USERNAME}</td>
					<td>${orderList.PICK_NAME }</td>
					<td>
						<fmt:formatDate value="${orderList.CRE_DATE }" pattern="yyyy-MM-dd kk:mm:ss"/>
					</td>
					<c:choose>
						<c:when test='${sessionScope.memberLogin.admin eq "T"}'>
							<td>
								<input type="button" class="btn" value="삭제" onclick="orderDeleteFnc('${orderList.ORDER_IDX}');">
							</td>
						</c:when>
						<c:when test='${sessionScope.memberLogin.admin eq "F"}'>
							<td>
							</td>
						</c:when>
					</c:choose>
					
				</tr>
			</c:forEach>
			
		</table>
	</div>
	<hr>
	<div>
		<input type="hidden" id='tempCurPage' name='tempCurPage' 
			value="${pagingMap.memberPaging.curPage}">
		<jsp:include page="/WEB-INF/views/common/Paging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
	</div>
	<div>
		<form id="pagingForm" action="./orderList.do" method="post">
			
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
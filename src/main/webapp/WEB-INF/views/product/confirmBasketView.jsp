<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 진행</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('#container').find('div').css({'vertical-align':'middle', 'text-align':'center'});
		
		$('#container').find('span').css('margin-top', '80px');
		
		$('#container').find('h2').css('margin', '15px');
		$('#container').find('h3').css('margin', '15px');
		
		$('input').css('margin', '15px');
		
		$('#container').css({'width':'700px', 'margin':'auto'});
		
		$('.btn').css({'border':'none','background-color': '#24afff', 'cursor': 'pointer',
			'font-size': '20px', 'font-weight': 'bolder', 'color': 'white', 'margin-left':'5px;'});
		
		$('#basket').css({'width':'550px', 'height':'200px', 'border':'20px solid #ff9900'
			, 'border-radius':'15px', 'margin':'30px', 'padding-top':'50px'});
	});
	
	function goBasket() {
		location.href = "./productBasket.do";
	}
	
	function movePageBack() {
		$('#pagingForm').submit();
	}
	
</script>

<style type="text/css">
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="container">
		<div id="basket">
			<c:choose>
				<c:when test='${basketCheck eq "T" }'>
					<h2>장바구니에 저장이 완료되었습니다.</h2>
					<h3>장바구니로 이동하시겠습니까?</h3>
				</c:when>
				<c:when test='${basketCheck eq "F" }'>
					<h2>장바구니는 최대 10개까지 등록 가능합니다.</h2>
					<h3>장바구니로 이동하시겠습니까?</h3>			
				</c:when>
			</c:choose>
			
			
			<span>
				<input type="button" class="btn" value="장바구니로 이동" onclick="goBasket();">
				<input type="button" class="btn" value="쇼핑 계속하기" onclick="movePageBack();">
			</span>
		</div>
		
		<form id="pagingForm" action="./list.do" method="get">
			<input type="hidden" name="curPage" value="${curPage}">
			<input type="hidden" name="searchOption" value="${searchOption}">
			<input type="hidden" name="keyword" value="${keyword}">
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DVD 상품 조회</title>
<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$('.btn').css({'border':'none','background-color': '#24afff',
			'font-size': '20px', 'font-weight': 'bolder', 'color': 'white'});
		
		
// 		페이지당 게시물이 10개일 때 스크롤을 위하여 작성하였으나 페이지당 5개로 줄이며 필요성이 없어짐
// 		$( '.top' ).click( function() {
// 			$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
// 			return false;
// 		} );

		$('#listDiv').css('height','530px');
		
	});
	
	function pageMoveAddFnc(){
		location.href = './add.do';
	}
	
	function moveErrorFnc() {
		location.href = './error.do';
	}
	
</script>

<style type="text/css">
	#container{
		width: 1000px;
		margin: auto;
	}
	
	.searchValue{
		height: 40px;
		padding: 0px;
		margin: 0px;
		vertical-align: top;
	}
	#container input, #container select {
		border: none;
	}
	#searchContainer{
		width: 507px;
		height: 40px;
		padding: 0px;
		border: 2px solid #aaaaaa;
 		border-right: none;
		border-radius: 10px;
		overflow: hidden;
		float: left;
	}
	
	#container table{
		width: 1000px;
		border-collapse: collapse;
	}
	#container td{
		border-top: 1px solid black; 
 		border-bottom: 1px solid black; 
		text-align: center;
		height: 30px;
	}
	.right{
		text-align: right;
	}
	#container img{
		height: 90px;
		width: 70px;
	}
	#container a{
		text-decoration: none;
		color: black;
	}
	#tableHead td {
		height: 40px;
		background-color: #dddddd;
	}
	
	#noneProductList{
		heigth: 100px;
		vertical-align: middle;
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		color: #bbbbbb;
	}
	
	.textTd{
		text-align: center;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="container" class="container">
		<div style="margin-bottom: 5px;">
			<div id="searchContainer">
				<form id="pagingForm" action="./list.do" method="post">
					<img class="searchValue" src='<c:url value="/resources/img/search.png"/>' 
						style="width: 40px; height:40px;">
					<select name="searchOption" class="searchValue" style="width: 100px;">
						<c:choose>
							<c:when test="${ searchMap.searchOption == 'all'}">
								<option value="all" selected="selected">제목+감독</option>
								<option value="title">제목</option>
								<option value="PD_NAME">감독</option>
							</c:when>
							<c:when test="${ searchMap.searchOption == 'title'}">
								<option value="all">제목+감독</option>
								<option value="title" selected="selected">제목</option>
								<option value="PD_NAME">감독</option>
							</c:when>
							<c:when test="${ searchMap.searchOption == 'PD_NAME'}">
								<option value="all">제목+감독</option>
								<option value="title">제목</option>
								<option value="PD_NAME" selected="selected">감독</option>
							</c:when>
						</c:choose>
					</select>
					<input type="text" name="keyword" id="keyword" class="searchValue"
						value="${searchMap.keyword}" style="width: 250px;" placeholder="영화제목 or 감독명 검색">
					<input type="submit" value="검색" class="searchValue" 
						style="width: 100px; background-color: #24afff;
						font-size: 20px; font-weight: bolder; color: white;">
				</form>
			</div>
			
			<div style="width: 200px; float: right;">
				<c:if test="${sessionScope.memberLogin.admin eq 'T'}">
					<span><input type="button" class="btn" value='상품 등록' onclick="pageMoveAddFnc();"></span>
				</c:if>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div id="listDiv">
			<table>
				<colgroup>
					<col style="width: 50px;">
					<col style="width: 100px;">
					<col style="width: 330px;">
					<col style="width: 120px;">
					<col style="width: 80px;">
					<col style="width: 120px;">
					<col style="width: 200px;">
				</colgroup>				
				<tr id="tableHead">
					<td>번호</td>
					<td>섬네일</td>
					<td>제목</td>
					<td>감독</td>
					<td>평점</td>
					<td>가격</td>
					<td>게시 날짜</td>
				</tr>
				
				<c:if test="${empty productList }">
					<tr>
						<td id="noneProductList" colspan="7">데이터가 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="productList" items="${productList}">
					<tr>
						<td>${productList.productNo }</td>
						<td>
							<a href="./detail.do?
							productNo=${productList.productNo}
							&curPage=${pagingMap.memberPaging.curPage}
							&searchOption=${searchMap.searchOption}
							&keyword=${searchMap.keyword}">
								<img art="image not found"
									src='<c:url value="/resources/img/${productList.titleFile}"/>'>
							</a>
						</td>
						<td class="textTd">
							<a href="./detail.do?
							productNo=${productList.productNo}
							&curPage=${pagingMap.memberPaging.curPage}
							&searchOption=${searchMap.searchOption}
							&keyword=${searchMap.keyword}">${productList.title}</a>
						</td>
						<td>${productList.pdName }</td>
						<c:choose>
							<c:when test="${productList.adminScore > 5}">
								<td>평점<br>없음</td>
							</c:when>
							<c:otherwise>
								<td id="letter">
									<c:forEach var='i' begin="1" end="${productList.adminScore }">
										★
									</c:forEach>
									<c:forEach var='i' begin="1" end="${5 - productList.adminScore }">
										☆
									</c:forEach>
								</td>
							</c:otherwise>
						</c:choose>
						
						<td>
							<fmt:formatNumber value="${productList.price }"
								type="currency" currencyCode="KRW"/>
						</td>
						<td><fmt:formatDate value="${productList.creDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div>
			<input type="hidden" id='tempCurPage' name='tempCurPage' 
				value="${pagingMap.memberPaging.curPage}">
			<jsp:include page="/WEB-INF/views/common/Paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
		</div>
		
<!-- 		페이지당 게시글이 10개일 때 작성하였으나 5개로 줄이면서 필요성이 사라져 주석처리함 -->
<!-- 		<div style="text-align: right;"> -->
<!-- 			<input type="button" class="top" value="맨 위로 ▲"  -->
<!-- 				style="width: 100px; background-color: #24afff; -->
<!-- 				font-size: 20px; font-weight: bolder; color: white;"> -->
<!-- 		</div> -->
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
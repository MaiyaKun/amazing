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

	$(document).ready(function() {
		
		$( '#goTop' ).find('input').click( function() {
			$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
			return false;
		} );
		
		$('#titleFile').css({'width':'350px', 'height':'500px', 'border':'1px solid #aaaaaa'});
		
		$('#container').css({'width':'700px', 'margin':'auto'});
		
		$('#container').find('table').css({'width':'700px', 'border-collapse':'collapse'});
		
		$('#container').find('td').css({'border': 'solid 1px #aaaaaa', 'text-align': 'center'});

		$('#headTable').find('td').css({'font-size': '25px', 'font-weight': 'bolder'});

		$('#infoTable').find('td').css({'height': '25px', 'font-size': '15px'});
		
		$('#adminComment').css({'border': '1px solid #aaaaaa'
							, 'border-radius': '10px', 'margin-top': '5px'
							, 'padding-left': '50px', 'padding-right': '50px'});
		
		$('#story').css({'border': '1px solid #aaaaaa', 'border-radius': '10px'
						, 'margin-top': '5px', 'padding': '15px'});
		
		$('#btnDiv').css({'text-align':'right', 'margin':'10px'});
		
		$('.btn').css({'border':'none','background-color': '#24afff', 'cursor': 'pointer',
			'font-size': '20px', 'font-weight': 'bolder', 'color': 'white'});
		
		$('#goTop').css('text-align', 'right');
		
		$('#nullComment').css({'height':'50px', 'text-align':'center', 'font-size':'20px'});
		
		$('#commentHead').children('td').css('background-color', '#cccccc');
		
		$('#replyInsert').find('textarea').css({'resize':'none', 'border':'none'});
		
		$('#replyInsertDiv').css('margin-top', '10px');
		
		$('#container').find('a').css({'font-size':'12px', 'text-decoration':'none'});

	});
	
	function moveBackPageFnc() {
		
		var formObj = $('#pagingForm');
		
		formObj.attr("action", "./list.do");
		formObj.submit();
	};
	
	function deleteProductFnc(productNo){
		if(confirm("삭제 후 되돌릴 수 없습니다. 삭제하시겠습니까?")){
			var htmlStr = "";
			htmlStr += "./delete.do?productNo=" + productNo;
			
			location.href = htmlStr;
		}
	};

	function insertReplyFnc() {
		var formObj = $('#pagingForm');
		
		var htmlStr = '';
		htmlStr += '<textarea id="hiddenReply" name="story" style="display: none;"></textarea>';
		
		var radioVal = $('input[name="score"]:checked').val();
		htmlStr += '<input type="hidden" name="score"';
		htmlStr += 'value="' + radioVal + '">';
		
		formObj.html(formObj.html() + htmlStr);
		
		$('#hiddenReply').val( $('#replyContent').val() );
		
		formObj.attr("action", "./reInsert.do");
		formObj.submit();
	}
	
	function productReplyDeleteOne(no, productNo) {
		var htmlStr = "";
		htmlStr += "./reDeleteCtr.do?no=" + no;
		htmlStr += "&productNo=" + productNo;
		
		location.href = htmlStr;
	}
	
	function productUpdateFnc(productNo) {
		var formObj = $('#pagingForm');
		
		var htmlStr = "./update.do";
		
		formObj.attr("action", htmlStr);
		formObj.attr("method", "get");
		formObj.submit();
		
	}
	
	function movePaymentFnc(productNo) {
		var formObj = $('#pagingForm');
		
		var htmlStr = "./paymentReady.do";
		
		formObj.attr("action", htmlStr);
		formObj.submit();		
	}
	
	
</script>

<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<div id="container">
		<h1 style="text-align: center;">[${productDto.title }] 상품 상세</h1>
		
		<table id="headTable">
			<colgroup>
				<col style="width: 350px;">
				<col style="width: 175px;">
				<col style="width: 175px;">
			</colgroup>
			<tr>
				<td rowspan="4" style="width: 350px;">
					<img id='titleFile' src='<c:url value="/resources/img/${productDto.titleFile}"/>'/>
				</td>
				<td style="height: 75px;">관리자 평점</td>
				<td>
					<c:choose>
						<c:when test="${productDto.adminScore eq 10 }">
							없음
						</c:when>
						<c:otherwise>
							<c:forEach var='i' begin="1" end="${productDto.adminScore }">
								★
							</c:forEach>
							<c:forEach var='i' begin="1" end="${5 - productDto.adminScore }">
								☆
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
				</td>
			</tr>
			
			<tr>
				<td style="height: 75px;">구매자 평점</td>
				<td>	
					<c:choose>
						<c:when test="${userScore > 5}">
							<span style="font-size: 20px; font-weight: nomal;">
								등록된<br>평점 없음
							</span>
						</c:when>
						<c:otherwise>
							${userScore }
						</c:otherwise>
					</c:choose>
					
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="height: 250px;">
					<img src='<c:url value="/resources/img/${productDto.pdFile}"/>'
						style="width: 300px; height: 250px;"/>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="height: 50px;">
					${productDto.pdName } 作
				</td>
			</tr>
		</table>
		<table id="infoTable">
			<colgroup>
				<col style="width: 150px; background-color: #dddddd;">
				<col style="width: 550px;">
			</colgroup>
			<tr>
				<td>상품명</td>
				<td>${productDto.title}</td>
			</tr>
			<tr>
				<td>장르</td>
				<td>${genreStr}</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<fmt:formatNumber value="${productDto.price }"
						type="currency" currencyCode="KRW"/>
				</td>
			</tr>
			<tr>
				<td>주연배우</td>
				<td>${productDto.actor}</td>
			</tr>
		</table>
		
		<div id="adminComment">
			<p>${productDto.adminCom }</p>
			<p style="text-align: right;">- 관리자 평론</p>
		</div>
		
		<div id="story">
			<h4 style="padding-left: 20px;">줄거리</h4>
			<p>${productDto.story }</p>
		</div>
		<div id="btnDiv">
			
			<span>
				<input class="btn" type="button" value="돌아가기"
					onclick="moveBackPageFnc();">
				<input class="btn" type="button" value="구매/장바구니"
					onclick="movePaymentFnc(${productDto.productNo});">
				<c:if test='${sessionScope.memberLogin.admin eq "T"}'>
					<input class="btn" type="button" value="수정하기" 
						onclick="productUpdateFnc(${productDto.productNo});">
					<input class="btn" type="button" value="상품 삭제"
						onclick="deleteProductFnc(${productDto.productNo});">					
				</c:if>
					
			</span>
			
		</div>
		<div id="replDiv">
<!-- 			pagingForm -->
			<table>
				<colgroup>
					<col style="width: 100px;">
					<col style="width: 400px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
				</colgroup>
				<tr id="commentHead">
					<td>작성자</td>
					<td>내용</td>
					<td>평점</td>
					<td>작성일</td>
				</tr>
				<c:choose>
					<c:when test="${empty productComList}">
						<tr>
							<td id="nullComment" colspan="4">등록된 구매자 평점이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="com" items="${productComList}">
							<tr>
								<td>${com.USERNAME }</td>
								<td>
									${com.STORY } <br>
									<c:if test='${sessionScope.memberLogin.userNo eq com.USER_NO
									or sessionScope.memberLogin.admin eq "T"}'>
										<a href='#' 
											onclick="productReplyDeleteOne(${com.PRO_COM_NO}, ${productDto.productNo});">
												[댓글 삭제]
										</a>
									</c:if>
								</td>
								<td>${com.SCORE }</td>
								<td>
									<fmt:formatDate value="${com.CRE_DATE }"
										pattern="yyyy.MM.dd hh:mm:ss"/> 
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

			<div>
				<form id="pagingForm" action="./detail.do#pagingForm" method="post">
					<input type="hidden" name="searchOption" value="${pageData.searchOption }">
					<input type="hidden" name="keyword" value="${pageData.keyword}">
					<input type="hidden" name="curPage" value="${pageData.curPage}">
					<input type="hidden" name="productNo" value="${productDto.productNo}">
				</form>
				
				<c:if test="${not empty productComList }">
					<input type="hidden" id='tempCurPage' name='tempCurPage' 
						value="${pagingMap.memberPaging.curPage}">
					<jsp:include page="/WEB-INF/views/common/comPaging.jsp">
						<jsp:param value="${pagingMap}" name="pagingMap"/>
					</jsp:include>
				</c:if>
			</div>
			
			<div id="replyInsertDiv">
				<table id="replyInsert">
					<tr>
						<td style="width: 630px;">
							<textarea id="replyContent" rows="3" cols="80"
								placeholder="댓글 내용 입력(최대 200자)" maxlength="200"></textarea>
						</td>
						<td style="width: 70px;">
							<input type="button" id="commentButton"
								style="width: 70px; height: 50px;"
								value="작성하기" onclick="insertReplyFnc();">
							<input type="hidden" id="comCheck" value="${commentCheck }">
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td style="background-color: #dddddd; border: 1px solid #aaaaaa;">
							평점<br>입력
						</td>                
						<td>                   
							<input type="radio" name="score" value="0">0<br>
						</td>                  
						<td>                   
							<input type="radio" name="score" value="1">1<br>
						</td>                  
						<td>                   
							<input type="radio" name="score" value="2">2<br>
						</td>                  
						<td>                   
							<input type="radio" name="score" value="3" checked="checked">3<br>
						</td>                  
						<td>                   
							<input type="radio" name="score" value="4">4<br>
						</td>                  
						<td>                   
							<input type="radio" name="score" value="5">5<br>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="goTop">
			<span>
				<input type="button" class='btn' value="맨 위로 ▲">
			</span>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
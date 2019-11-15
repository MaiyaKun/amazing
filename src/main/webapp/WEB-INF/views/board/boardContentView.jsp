<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 조회</title>
<style type="text/css">
#whole {
	width: 1000px;
	text-align: center; 
	margin: auto;
}

.btn{
	float: right;
	width: 100px;
	height: 53px;
	background-color: #24afff;
	margin-left: 1px;
	margin-right: 1px;
	border-style: none;
	border-radius: 7px;
	cursor: pointer;
	font-size: 17px; 
	color: white; 
	font-weight: bolder; 
}


.commBtn{
	float: right;
	background-color: #24afff;
	border-style: none;
	border-radius: 7px;
	width: 100px;
	height: 27px;
	cursor: pointer;
}

#whole table, #whole tr, #whole td {
	border: 1px solid black;
	border-collapse: collapse;
}

#whole h1 {
	text-align: center;
}

#boardContent {
	width: 1000px;
	margin: auto;
}

#board {
	width: 1000px;
	margin: auto;
}

.leftHeader, .date {
	width: 100px;
	background-color: #D8D8D8;
	font-weight: bold;
}

#story {
	width: 1000px;
	height: 450px;
	border-bottom: none;
	text-align: left;
	vertical-align: top;
	padding: 10px;
	word-break: break-all;
}

#storyTextarea{
	width: 970px;
	height: 440px;
}

textarea {
	resize: none;
	width: 589px;
	height: 70px;
	border: 0px;
}


#whole #commentary {
	width: 699px;
}

#whole #commInput {
	border-right: none;
}

#whole .commContainer{
	width: 1000px;
}

#whole .commUserName{
	width: 110px;
	border-bottom: none;
	border-right: none;
}

#whole .commCreDate{
	text-align: left;
	border-bottom: none;
	border-left: none;
	border-right: none;
}

#whole #commStory{
	width: 888px;
	border-top: none;
}

#whole #commTextStory{
	border-top: none;
}

#commRollbackBtn{
	float: right;
	background-color: #FF9090;
	border-style: none;
	border-radius: 7px;
	margin-left: 1px;
	margin-right: 1px;
	width: 100px;
	height: 27px;
	cursor: pointer;
}
		

#commUpdateCommitBtn{
	float: right;
	background-color: #FF9090;
	border-style: none;
	border-radius: 7px;
	margin-left: 1px;
	margin-right: 1px;
	width: 100px;
	height: 27px;
	cursor: pointer;
}

.commUserName, .commCreDate{
font-size: 11px;
}

</style>
<script type="text/javascript"
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/amazing/resources/js/textCounter.js"></script>
<script type="text/javascript">
	
	// 댓글 입력한 공백시 알림
	function alertFnc() {
	
		 if ($('#commStory').val() == ''){
			alert('댓글을 입력해주세요');
			$('#commStory').focus();
			return;
		}
		$('#commUploadBtn').submit();
	}
	
	// 맨위로 올리기
	$(document).ready(function() {
		$( '#goTop' ).find('input').click( function() {
			$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
			return false;
		} );
	});
	
	// 댓글 삭제 시 확인
	function commDelBtnFnc(strNo, LIST_COM_NO, curPage) {
		var deleteStr = '';
		
		deleteStr += './boardCommDeleteOneCtr.do?comNo=' + LIST_COM_NO;
		deleteStr += '&strNo=' + strNo;
		deleteStr += '&curPage=' + curPage;
		
		if (confirm('삭제한 댓글은 복구되지 않습니다.\n정말 삭제 하시겠습니까?') == true){
			$('#deleteBtn').submit();
		}else{
			return;
		}
		
		location.href = deleteStr;
	}
	
// 	댓글 수정하기를 눌렀을 시 댓글창의 변화 
	function commUpdateBtnFnc(listNo, strNow, curPage){
		
		var commTextareaStr = '';
		var tempId = "#commText";
		var tempListNo = listNo;
		
		tempId += tempListNo;
		
		$(tempId).removeAttr("readonly");
		$(tempId).focus();
		
		var btnTempId = '#commUpdateDetailBtn';
		btnTempId += listNo;
		
		var commUpdateStr = '';
		
		commUpdateStr += '<input type="hidden" name="strNo" value="' + strNow + '">';
		commUpdateStr += '<input type="hidden" name="curPage" value="' + curPage + '">';
		commUpdateStr += '<input id="commUpdateCommitBtn" type="button" ';
		commUpdateStr += 'onclick="commUpdateCtrFnc(' + listNo + ');" value="수정완료">';
		commUpdateStr += '<form action="./boardContent.do" method="get">';
		commUpdateStr += '<input type="hidden" name="strNo" value="' + strNow + '">';
		commUpdateStr += '<input type="hidden" name="curPage" value="' + curPage + '">';
		commUpdateStr += '<div>';
		commUpdateStr += '<input id="commRollbackBtn" type="submit" value="돌아가기">';
		commUpdateStr += '</div>';
		commUpdateStr += '</form>';
		
		$(btnTempId).html(commUpdateStr);
	 };
	 
	 
	 function commUpdateCtrFnc(listNo) {
		
		 var listId = "commUpdateCtrForm" + listNo;
		 
		 var commUpdateCtrForm = document.getElementById(listId);
		 
		var tempId = "#commText";
		var tempListNo = listNo;
		
		tempId += tempListNo;
		 
		 if ($(tempId).val() == ''){
			alert('수정할 댓글을 입력해주세요');
			$(tempId).focus();
			return;
		}
			
		 commUpdateCtrForm.submit();
	}
	 
	
	function moveToCommFnc() {
		var tempId = "#commStory";
		
		$(tempId).focus();
	}
	

</script>		
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="whole">
		<div>
			<h1>자유게시판 조회</h1>
		</div>
		<div>
			<input id="downBtn" class="commBtn" type="button" value="댓글쓰기" onclick="moveToCommFnc();">
		</div>
		<div id="boardContent">
			<table id="board">
				<tr>
					<td class="leftHeader">제목</td>
					<td colspan="3">${boardDto.title}</td>
				</tr>
				<tr>
					<td class="leftHeader">작성자</td>
					<td colspan="3">${boardDto.userName}</td>
				</tr>
				<tr>
					<td class="date">게시날짜</td>
					<td><fmt:formatDate value="${boardDto.creDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="date">수정날짜</td>
					<td><fmt:formatDate value="${boardDto.modDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
				<tr>
					<td colspan="4" id="story">
						<textarea id="storyTextarea" rows="40" cols="40" readonly="readonly">${boardDto.story}</textarea>
					</td>
				</tr>
			</table>

			<table style="width: 700px;" id="commentary">
				<c:forEach var="commListDto" items="${boardCommList}">
					<tr style="border-bottom: none;">
						<c:choose>
							<c:when
								test="${sessionScope.memberLogin.userNo eq commListDto.USER_NO}">
								<td class="commUserName">${commListDto.USERNAME}</td>
								<td class="commCreDate">
									<fmt:formatDate value="${commListDto.CRE_DATE}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td id="commUpdateDetailBtn${commListDto.LIST_COM_NO}" style="border-left: none;
									border-bottom: none;">
									<input id="commUpdateBtn" type="button" class="commBtn" style="margin-left: 1px;"
										onclick="commUpdateBtnFnc(${commListDto.LIST_COM_NO}, ${boardDto.strNo}, ${curPage});"
										value="수정하기"> 
									<input id="commDeleteBtn" type="button" class="commBtn" style="margin-right: 1px;"
										onclick="commDelBtnFnc(${boardDto.strNo}, ${commListDto.LIST_COM_NO}, ${curPage});"
										value="삭제하기">
								</td>
							</c:when>
							<c:when	test="${sessionScope.memberLogin.admin eq 'T'
								or sessionScope.memberLogin.userNo eq commListDto.USER_NO}">
								<td class="commUserName">${commListDto.USERNAME}</td>
								<td class="commCreDate">
									<fmt:formatDate value="${commListDto.CRE_DATE}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td style="border-left: none; border-bottom: none;">
									<input type="button" class="commBtn"
										onclick="commDelBtnFnc(${boardDto.strNo}, ${commListDto.LIST_COM_NO}, ${curPage});"
										value="삭제하기">
									</td>
							</c:when>
							<c:otherwise>								
								<td class="commUserName">${commListDto.USERNAME}</td>
								<td class="commCreDate" colspan="2">
									<fmt:formatDate value="${commListDto.CRE_DATE}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr style="border-top: none;">
						<td id="commTextStory" colspan="3">
							<form action="./boardCommUpdateCtr.do" 
								id="commUpdateCtrForm${commListDto.LIST_COM_NO}" method="POST">
								<input type="hidden" name="curPage" value="${curPage}">
								<textarea id="commText${commListDto.LIST_COM_NO}"
									style="width: 992px; height: 60px;"
									name="story" maxlength="200"
									readonly="readonly">${commListDto.STORY}</textarea>
								<input type="hidden" name="strNo" value="${boardDto.strNo}">
								<input type="hidden" name="comNo"
									id="justComm${commListDto.LIST_COM_NO}"
									value="${commListDto.LIST_COM_NO}">
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
			<form action="./boardCommAddCtr.do" id="commUploadBtn" method="post">
				<table class="commContainer">
					<tr class="commContainer">
						<td id="commInput" style="height: 80px; vertical-align: top;">
							<textarea id="commStory"
								name="story" rows="3" 
								placeholder="댓글을 입력해주세요. 200자 이내" maxlength="200"></textarea>
							<span id="commCount"></span>
						</td>
						<td style="border-left: none;">
							<input type="hidden" id='tempCurPage' name='tempCurPage'
								value="${curPage}"> <input type="hidden" name="userNo"
								value="${sessionScope.memberLogin.userNo}"> 
							<input type="hidden" name="strNo" value="${boardDto.strNo}"> 
							<input type="hidden" name="curPage" value="${curPage}">
							<input class="btn" type="button" onclick="alertFnc();" value="댓글달기">
						</td>
					</tr>
				</table>
			</form>
			<c:choose>
				<c:when
					test="${sessionScope.memberLogin.admin eq 'T' 
					or sessionScope.memberLogin.userNo eq boardDto.userNo}">
					<div>
						<input class="btn" type="button"
							onclick="location.href='./boardUpdate.do?strNo=${boardDto.strNo}&curPage=${curPage}'"
							value="수정하기">
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
					<form action="./boardList.do" method="get">
				<input type="hidden" name="curPage" value="${curPage}">
				<div>
					<input class="btn" type="submit" value="돌아가기">
				</div>
			</form>
			<div style="text-align: left;">
				<input id="topBtn" type="button" class="commBtn" style="float: left"
					value="맨 위로 ▲"  onclick="javascript:window.scrollTo(0,0)" >
			</div>
		</div>
	</div>
	<div style="height: 30px;">
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
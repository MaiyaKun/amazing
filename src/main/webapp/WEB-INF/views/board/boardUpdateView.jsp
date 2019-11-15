<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글수정</title>
<style type="text/css">
	#whole{
		width: 1000px;
		height: 630px;
		text-align: center;
		margin: auto;
	}
	
	#whole table, #whole tr, #whole td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.leftHeader{
		width: 100px;
		background-color: #D8D8D8;
		font-weight: bold;
	}
	
	#titleinput{
		width: 590px;
		text-align: center;
		border: 0px;
	}
	
	#whole h1 {
		text-align: center;
	}
	
	#boardUpload{
		width: 700px;
		height: 550px;
		margin: auto;
	}
	
	#board{
		width: 1000px;
		margin: auto;
	}
	
	textarea{
		resize: none;
		width: 989px;
		height: 421px;
		border: 0px;
	}
	
	.titleClass{
		width: 680px;
		height: 15px;
		vertical-align: bottom;
		float: left;
		text-align: center;
		margin-left: 100px;
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
	
	#updateTitle{
		text-align: left;
		width : 790px;
		margin : 0px;
	}
	
	#userName{
		width: 100px;
		text-align: center;
	}
	
</style>
<script type="text/javascript" src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/amazing/resources/js/textCounter.js"></script>
<script type="text/javascript">
	
	function alertFnc() {
		
		if ($('#updateTitle').val() == ''){
			alert('제목을 입력해주세요');
			$('#updateTitle').focus();
			return;
		} if ($('#userUpdateStory').val() == ''){
			alert('내용을 입력해주세요');
			$('#userUpdateStory').focus();
			return;
		}
		
		$('#updateBtn').submit();
	}
	
	function confirmFnc() {
		if (confirm('삭제한 글은 복구되지 않습니다.\n정말 삭제 하시겠습니까?') == true){
			$('#deleteBtn').submit();
		}else{
			return;
		}
	}



</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="whole">
		<div>
			<h1>글 수정하기</h1>
		</div>
		<div id="boardUpdate">
			<form action="./boardUpdateCtr.do" id="updateBtn" method="post">
				<table id="board">
					<tr>
						<td class="leftHeader">제목</td>
						<td>
							<c:choose>
								<c:when test="${sessionScope.memberLogin.userNo eq boardDto.userNo}">
									<span>
									<textarea id="updateTitle" name="title"  placeholder="제목을 입력해주세요."
										class="titleClass" maxlength="36">${boardDto.title}</textarea></span>
									<span id="updateTitleCount" style="float: right;"></span>
								</c:when>
								<c:when test="${sessionScope.memberLogin.admin eq 'T'}">
									<textarea id="managerTitle" name="title"  placeholder="제목을 입력해주세요." 
										class="titleClass" maxlength="37" disabled="disabled">${boardDto.title}</textarea> 
									<span id="managerTitleCount" style="float: right;"></span>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="leftHeader">작성자</td>
						<td>
						<input id="userName" name="userName" type="text" 
							value="${boardDto.userName}" disabled="disabled">
						</td>
					</tr>
					<tr>
						<td class="leftHeader">게시날짜</td>
						<td><fmt:formatDate value="${boardDto.creDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<c:choose>
								<c:when test="${sessionScope.memberLogin.userNo eq boardDto.userNo}">
										<textarea id="userUpdateStory" class="story" maxlength="1332"
											 placeholder="내용을 입력해주세요. 1,332자 이내"
											name="story">${boardDto.story}</textarea>
										<span id="userUpdateCount"></span>
								</c:when>
								<c:when test="${sessionScope.memberLogin.admin eq 'T'}">
										<textarea id="managerUpdateStory" class="story" maxlength="1332"
											placeholder="내용을 입력해주세요. 1,332자 이내"
											name="story" disabled="disabled">${boardDto.story}</textarea>
										<span id="managerUpdateCount"></span>
								</c:when>
							</c:choose>
						</td>
					</tr>
				</table>
				<div>
<%-- 				<input type="hidden" name="userNo" value="${sessionScope.boardDto.userNo}"> --%>
					<input type="hidden" name="strNo" value="${boardDto.strNo}">
					<input type="hidden" name="curPage" value="${curPage}">
					<input class="btn" type="button" onclick="alertFnc();" value="수정완료">
				</div>
			</form>
			
			<form action="./boardContent.do" method="get">
				<input type="hidden" name="strNo" value="${boardDto.strNo}">
				<input type="hidden" name="curPage" value="${curPage}">
				<div>
					<input class="btn" type="submit" value="돌아가기">
				</div>
			</form>
			
			<form action="./boardDeleteCtr.do" id="deleteBtn" method="get">
				<div>
					<input type="hidden" name="strNo" value="${boardDto.strNo}">
					<input class="btn" type="button" onclick="confirmFnc();" value="삭제하기">
				</div>
			</form>
		</div>		
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
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
	
	#title{
		height: 15px;
		vertical-align: bottom;
		float: left;
		text-align: left;
		width : 790px;
		margin : 0px;
	}
	
	#whole h1 {
		text-align: center;
	}
	
	#boardUpload{
		width: 1000px;
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
	
</style>
<script type="text/javascript" src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/amazing/resources/js/textCounter.js"></script>
<script type="text/javascript">
	function alertFnc() {
		
		if ($('#title').val() == ''){
			alert('제목을 입력해주세요');
			$('#title').focus();
			return;
		} if ($('#story').val() == ''){
			alert('내용을 입력해주세요');
			$('#story').focus();
			return;
		}
		$('#uploadBtn').submit();
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="whole">
		<div>
			<h1>자유게시판 글쓰기</h1>
		</div>
		<div id="boardUpload">
			<form action="./boardAddCtr.do" id="uploadBtn" method="post">
				<table id="board">
					<tr>
						<td class="leftHeader">제목</td>
						<td>
							<textarea id="title" name="title" placeholder="제목을 입력해주세요." 
								maxlength="36"></textarea>
							<span id="titleCount"></span>
						</td>
					</tr>
					<tr>
						<td class="leftHeader">작성자</td>
						<td>
							<span>
								${sessionScope.memberLogin.userName}
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea id="story" name="story" 
							placeholder="내용을 입력해주세요. 1,332자 이내" maxlength="1332"></textarea>
							<span id="storyCount"></span>
						</td>
					</tr>
				</table>
				<div>
				<!-- 세션스코프는 진상이형꺼 커밋되면 다시 수정 -->
					<input type="hidden" name="userNo" value="${sessionScope.memberLogin.userNo}">
					<input class="btn" type="button" onclick="alertFnc();" value="등록하기">
				</div>
			</form>
			<form action="./boardList.do" method="get">
				<div>
					<input class="btn" type="submit" value="돌아가기">
				</div>
			</form>
		</div>		
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>

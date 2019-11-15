<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프랑켄슈타인 자유게시판</title>
<style type="text/css">
	
	#whole {
		margin: auto;
		width: 1000px;
	}
	
	#boardList{
		margin: auto;
		width: 1000px;
	}

	#whole table, #whole tr, #whole th, #whole td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	h1{
		text-align: center;
	}
	
	#whole th{
		background-color: #D8D8D8;
	}
	
	#whole table {
		width: 1000px;
		margin: auto;
	}
	
	#whole td {
		text-align: center;
	}
	

	
	#title{
		cursor: pointer;
		
	}
	
	#title:hover{
		text-decoration: underline;
	}
	
	#uploadBtn{
		float: right;
		width: 100px;
		height: 53px;
		background-color: #24afff;
		border-style: none;
		border-radius: 7px;
		cursor: pointer;
		font-size: 17px; 
		color: white; 
		font-weight: bolder; 
	}
	
	#searchBar{
		width: 530px;
		height: 35px;
		padding: 0px;
		background-color: #eeeeee;
		border-style: none;
		border-radius: 10px;
		overflow: hidden;
		margin-left: 185px;
	}
	
	#searchBar #searchOption {
		width: 120px;
		height: 34px;
		vertical-align: top;
		float: left;
	}
	#searchBar #searchInput {
		width: 265px;
		height: 28px;
		vertical-align: top;

	}
	#searchBar #searchBtn{
		width: 100px;
		height: 34px;
		vertical-align: top;
		cursor: pointer;
		background-color: #24afff;
		border-style: none;
		border-radius: 7px;
		float: right;
	}
	#searchPic{
		width: 40px; 
		height:30px; 
 		vertical-align: top; 
		float: left;
	}
	
	#headNo{
		width: 64px;
	}
	
	#headTitle{
		width: 600px;
	}
	
	#headName{
		width: 140px;
	}
	
	#headCreDate{
		width: 195px;
	}
	
</style>
<script type="text/javascript" src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	function contentViewFnc(strNo, curPage) {
		location.href='./boardContent.do?strNo=' + strNo + '&curPage=' + curPage;
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="whole">
		<div>
			<h1>자유게시판</h1>
		</div>
		
		<div id="boardList">
			<div style="height: 489px;">
			<table>
				<tr>
					<th id="headNo">번호</th>
					<th id="headTitle">제목</th>
					<th id="headName">작성자</th>
					<th id="headCreDate">게시날짜</th>
				</tr>
				<c:forEach var="boardListDto" items="${boardList}">
					<tr>
						<td>${boardListDto.strNo}</td>
						<td id="title" style="text-align: left;" 
							onclick="contentViewFnc(${boardListDto.strNo}, ${pagingMap.memberPaging.curPage});">
							${boardListDto.title}
						</td>
						<td>${boardListDto.userName}</td>
						<td><fmt:formatDate value="${boardListDto.creDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
				</c:forEach>
			</table>
				<form action="./boardAdd.do">
					<input id="uploadBtn" type="submit" value="글쓰기">
				</form>
			</div>


			<div>
				<input type="hidden" id='tempCurPage' name='tempCurPage' 
					value="${pagingMap.memberPaging.curPage}">
				<jsp:include page="/WEB-INF/views/common/Paging.jsp">
					<jsp:param value="${pagingMap}" name="pagingMap"/>
				</jsp:include>
			</div>
			<div id="searchBar">
				<form id="pagingForm" action="./boardList.do" method="post">
					<img id="searchPic" src='<c:url value="/resources/img/search.png"/>'>
					<select id="searchOption" name="searchOption">
						<c:choose>
							<c:when test="${searchMap.searchOption == 'all'}">
								<option value="all" selected="selected">작성자+제목</option>
								<option value="userName">작성자</option>
								<option value="title">제목</option>
							</c:when>
							<c:when test="${searchMap.searchOption == 'userName'}">
								<option value="all">작성자+제목</option>
								<option value="userName" selected="selected">이름</option>
								<option value="title">제목</option>
							</c:when>
							<c:when test="${searchMap.searchOption == 'title'}">
								<option value="all">작성자+제목</option>
								<option value="userName">작성자</option>
								<option value="title" selected="selected">제목</option>
							</c:when>
						</c:choose>
					</select>
					<input id="searchInput" type="text" name="keyword" value="${searchMap.keyword}" 
						placeholder="작성자 or 제목 검색" >
					<input id="searchBtn" type="submit" value="검색">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
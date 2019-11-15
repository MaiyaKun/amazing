<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 수정 페이지</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	
	var stackStock = 0;
	var stackPrice = 0;
	
	$(document).ready(function() {
		stackStock = $('#stock').val() * 1;
		stackPrice = $('#price').val() * 1;
		
		$("a[id^='delete']").on('click', function(e){
			e.preventDefault();
		});
		
		$("#price").on('keyup', function(e) {
			var check = stringCheck($(this).val());
			if(check == "error"){
				$(this).val(stackPrice * 1);
			}
			else{
				stackPrice = $(this).val() * 1;
			}
		});
		
		$("#stock").on('keyup', function(e) {
			var check = stringCheck($(this).val());
			if(check == "error"){
				$(this).val(stackStock * 1);
			}
			else{
				stackStock = $(this).val() * 1;
			}
		});
	});
	
	function stringCheck(string) {		
		if(isNaN(string) == true){
			alert("숫자만 입력해 주세요.");
			return "error";
		}
		return "pass";
	}
	
	
	function addFileFnc(target) {
		var obj;
		var htmlStr = "";
		
		if (target == 1) {
			obj = $('#titleContent');

			htmlStr += '<input type="file" id="title_File" name="title_File"> ';
			htmlStr += '<a href="#this" id="deleteTitle"';
			htmlStr += 'onclick="addFileCancleFnc(1);">[취소]</a>';
			
			obj.html(htmlStr);
			
		} else {
			obj = $('#pdContent');
			
			htmlStr += '<input type="file" id="pd_File" name="pd_File"> ';
			htmlStr += '<a href="#this" id="deletePd"';
			htmlStr += 'onclick="addFileCancleFnc(2);">[취소]</a>';
			
			obj.html(htmlStr);
		}
		
		$("a[id^='delete']").on("click", function(e){
			e.preventDefault();
		});
	}
	
	function addFileCancleFnc(target) {
		var obj;
		var htmlStr = "";
		
		if (target == 1) {
			obj = $('#titleContent');

			htmlStr += '<input type="button" value="이미지 변경" onclick="addFileFnc(1);">';
			htmlStr += '<input type="hidden" id="titleChange" name="titleChange" value="1">';
			
			obj.html(htmlStr);
			
		} else {
			obj = $('#pdContent');
			
			htmlStr += '<input type="button" value="이미지 변경" onclick="addFileFnc(2);">';
			htmlStr += '<input type="hidden" id="pdChange" name="pdChange" value="1">';
			
			obj.html(htmlStr);
		}
		
		$("a[id^='delete']").on("click", function(e){
			e.preventDefault();
		});
	}

	function pageMoveListFnc(){
		$('#productUpdateForm').attr("action", "./detail.do");
		
		$('#productUpdateForm').submit();
	}
	
	
	function updateSubmitFnc(){
		
		if($('#title').val() == ""){
			alert("제목이 비어있습니다.");
			$('#title').focus();
			return;
		}
		if($('#title_File').val() == ""){
			alert("포스터 사진이 비어있습니다.");
			$('#title_File').focus();
			return;
		}
		if($('#pdName').val() == ""){
			alert("감독 이름이 비어있습니다.");
			$('#pdName').focus();
			return;
		}
		if($('#pd_File').val() == ""){
			alert("감독 사진이 비어있습니다.");
			$('#pd_File').focus();
			return;
		}
		if($('#price').val() == ""){
			alert("제품 판매가가 비어있습니다.");
			$('#price').focus();
			return;
		}
		if($('#actor').val() == ""){
			alert("주연배우란이 비어있습니다.");
			$('#actor').focus();
			return;
		}
		if($('#stock').val() == ""){
			alert("재고수량이 비어있습니다.");
			$('#stock').focus();
			return;
		}
		
		$('#productUpdateForm').submit();
	}
	
</script>

<style type="text/css">
	#container{
		width: 700px;
		margin: auto;
	}

	#container table, #container tr, #container td{
		border: 1px solid #aaaaaa;
		border-collapse: collapse;
		text-align: center;
	}
	
	#container table{
		width: 700px;
	}
	
	#container td{
		height: 30px;
		padding: 0px;
	}
	
	#score{
		border: 1px solid #aaaaaa;
	}
	
	#score tr td{
		width: 88px;
		height: 30px;
		border: none;
	}
	
	#container input, #container textarea {
		border: 3px solid #99ccff;
		heigth: 30px;
	}
	
	.inputBtn{
		width: 100px;
		height: 30px;
		border: 2px solid #bbbbbb;
		border-radius: 5px;
		background-color: #24afff;
		color: white;
		font-size: 20px;
		cursor: pointer;
	}
	
	#container img {
		width: 200px;
	}	
	
	#container a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="container" style="text-align: right;">
	
		<h1 style="text-align: center;">상품 수정</h1>
		<form id="productUpdateForm" action="./updateCtr.do" method="post" 
			enctype="multipart/form-data">
			<table>
				<colgroup>
					<col style="width: 200px; background-color: #dddddd;">
					<col style="width: 150px;">
					<col style="width: 200px; background-color: #dddddd;">
					<col style="width: 150px;">
				</colgroup>
				<tr>
					<td>상품명</td>
					<td><input type="text" id="title" name="title" placeholder="DVD 제목 / 40자 이내"
							style="width: 250px;" value="${productDto.title }" maxlength="40" ></td>
					<td>감 독</td>
					<td><input type="text" id="pdName" name="pdName" placeholder="감독명 / 30자 이내" 
						style="width: 250px;" value="${productDto.pdName }" maxlength="30"></td>
				</tr>
				<tr>
					<td>포스터</td>
					<td id="titleContent">
						<input type="button" value="이미지 변경" onclick="addFileFnc(1);">
						<input type="hidden" id="titleChange" name="titleChange" value="1">
					</td>
					<td>감독이미지</td>
					<td id="pdContent">
						<input type="button" value="이미지 변경" onclick="addFileFnc(2);">
						<input type="hidden" id="pdChange" name="pdChange" value="1">
					</td>
				</tr>
				<tr>
					<td colspan="4">기존 등록된 이미지</td>
				</tr>
				<tr id="sampleImg">
					<td colspan="2">
						<img src='<c:url value="/resources/img/${productDto.titleFile}"/>'/>
					</td>
					<td colspan="2">
						<img src='<c:url value="/resources/img/${productDto.pdFile}"/>'/>
					</td>
				</tr>
			</table>
			<br>
			<table>
				<colgroup>
					<col style="width: 100px; background-color: #dddddd;">
					<col style="width: 550px;">
				</colgroup>
				<tr>
					<td>장르</td>
					<td style="text-align: left;">
						<select id="genreNo" name="genreNo" style="height: 25px; width: 250px;">
							<c:forEach var="genreList" items="${genreList }">
								<c:choose>
									<c:when test="${genreList.GENRE_NO eq productDto.genreNo }">
										<option value="${genreList.GENRE_NO}" selected="selected">
											${genreList.GNAME}
										</option>
									</c:when>
									<c:otherwise>
										<option value="${genreList.GENRE_NO}">
											${genreList.GNAME}
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach> 							
						</select>
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input type="text" id="price" name="price" value="${productDto.price }"
							placeholder="판매가 입력" style="width: 550px; height: 25px;">
					</td>
				</tr>
				<tr>
					<td>주연배우</td>
					<td>
						<input type="text" id="actor" name="actor" value="${productDto.actor }"
							placeholder="주연배우 입력 / 60자 이내" style="width: 550px; height: 25px;"
							maxlength="60">
					</td>
				</tr>
				<tr>
					<td>재고량</td>
					<td>
						<input type="text" id="stock" name="stock" value="${productDto.stock }"
							placeholder="재고량 입력" style="width: 550px; height: 25px;"
							maxlength="10">
					</td>
				</tr>
				<tr>
					<td>관리자<br>감상평</td>
					<td>
						<textarea id="adminCom" name="adminCom" 
							placeholder="감상평 입력(미입력 가능) 최대 1,000자" rows="10" cols="80"
							style="resize: none;" maxlength="1000">${productDto.adminCom}</textarea>
					</td>
				</tr>
				<tr>
					<td>영화<br>줄거리</td>
					<td>
						<textarea id="story" name="story"
						placeholder="줄거리 입력(미입력 가능). 최대 1,000자" rows="20" cols="80"
							style="resize: none;" maxlength="1000">${productDto.story}</textarea>
					</td>
				</tr>
			</table>
			<table id="score">
				<tr>
					<td style="width: 84px; background-color: #dddddd; border: 1px solid #aaaaaa;">
						관리자<br>평점
					</td>
					<td>
					<c:choose>
						<c:when test="${productDto.adminScore eq 10 }">
							<input type="radio" name="adminScore" value="10" checked>선택안함<br>
						</c:when>
						<c:otherwise>
							<input type="radio" name="adminScore" value="10">선택안함<br>
						</c:otherwise>
					</c:choose>
					</td>
					<c:forEach var="i" begin="0" end="5">
						<c:choose>
							<c:when test="${productDto.adminScore eq i }">
								<td>                   
									<input type="radio" name="adminScore" value="${i }" checked>${i }<br>
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<input type="radio" name="adminScore" value="${i }">${i }<br>
								</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tr>
			</table>
			<input type="hidden" name="searchOption" value="${searchOption }">
			<input type="hidden" name="keyword" value="${keyword}">
			<input type="hidden" name="curPage" value="${curPage}">
			<input type="hidden" name="productNo" value="${productDto.productNo}">
			
			<span>
				<input class="inputBtn" type="button" value="돌아가기" onclick="pageMoveListFnc();">
				<input class="inputBtn" type="reset" value="초기화">
				<input class="inputBtn" type="button" value="등록하기" onclick="updateSubmitFnc();"> 
			</span>
		</form>
		<br>
		<div style="height: 200px; background-color: #eeeeee;"></div>
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
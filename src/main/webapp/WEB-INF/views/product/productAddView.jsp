<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 추가 페이지</title>

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
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
	function pageMoveListFnc(){
		location.href = './list.do';
	}
	
	function addSubmitFnc(){
		
		if($('#title').val() == ""){
			alert("제목이 비어있습니다.");
			$('#title').focus();
			return;
		}
		if($('#title_File').val() == ""){
			alert("포스터 이미지가 비어있습니다.");
			$('#title_File').focus();
			return;
		}
		if($('#pdName').val() == ""){
			alert("감독 이름이 비어있습니다.");
			$('#pdName').focus();
			return;
		}
		if($('#pd_File').val() == ""){
			alert("감독 이미지가 비어있습니다.");
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
		
		$('#productAddForm').submit();
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
		border: 1px solid #99ccff;
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="container" style="text-align: right;">
	
		<h1 style="text-align: center;">상품 등록</h1>
		<form id="productAddForm" action="./addCtr.do" method="post" 
			enctype="multipart/form-data">
			<table>
				<colgroup>
					<col style="width: 150px; background-color: #dddddd;">
					<col style="width: 270px;">
					<col style="width: 180px; background-color: #dddddd;">
					<col style="width: 100px;">
				</colgroup>
				<tr>
					<td>상품명</td>
					<td><input type="text" id="title" name="title" placeholder="DVD 제목(최대 50자)"
						style="width: 250px;" maxlength="50"></td>
					<td>포스터</td>
					<td><input type="file" id="title_File" name="title_File"></td>
				</tr>
				<tr>
					<td>감 독</td>
					<td><input type="text" id="pdName" name="pdName" placeholder="감독명(최대 33자)" 
						style="width: 250px;" maxlength="33"> </td>
					<td>감독이미지</td>
					<td><input type="file" id="pd_File" name="pd_File"> </td>
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
								<option value="${genreList.GENRE_NO}">${genreList.GNAME}</option>
							</c:forEach> 							
						</select>
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input type="text" id="price" name="price" maxlength="8"
							placeholder="판매가 입력" style="width: 550px; height: 25px;">
					</td>
				</tr>
				<tr>
					<td>주연배우</td>
					<td>
						<input type="text" id="actor" name="actor" maxlength="66"
							placeholder="주연배우 입력(최대 66자)" style="width: 550px; height: 25px;">
					</td>
				</tr>
				<tr>
					<td>재고량</td>
					<td>
						<input type="text" id="stock" name="stock" maxlength="6"
							placeholder="재고량 입력" style="width: 550px; height: 25px;">
					</td>
				</tr>
				<tr>
					<td>관리자<br>감상평</td>
					<td>
						<textarea id="adminCom" name="adminCom" maxlength="1000"
							placeholder="감상평 입력(미입력 가능) 최대 1,000자" rows="10" cols="80"
							style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td>영화<br>줄거리</td>
					<td>
						<textarea id="story" name="story" maxlength="1000"
							placeholder="줄거리 입력(미입력 가능). 최대 1,000자" rows="20" cols="80"
							style="resize: none;"></textarea>
					</td>
				</tr>
			</table>
			<table id="score">
				<tr>
					<td style="width: 84px; background-color: #dddddd; border: 1px solid #aaaaaa;">
						관리자<br>평점
					</td>
					<td>
						<input type="radio" name="adminScore" value="10" checked>선택안함<br>
					</td>                  
					<td>                   
						<input type="radio" name="adminScore" value="0">0<br>
					</td>                  
					<td>                   
						<input type="radio" name="adminScore" value="1">1<br>
					</td>                  
					<td>                   
						<input type="radio" name="adminScore" value="2">2<br>
					</td>                  
					<td>                   
						<input type="radio" name="adminScore" value="3">3<br>
					</td>                  
					<td>                   
						<input type="radio" name="adminScore" value="4">4<br>
					</td>                  
					<td>                   
						<input type="radio" name="adminScore" value="5">5<br>
					</td>
				</tr>
			</table>
			
			<br>
			
			<span>
				<input class="inputBtn" type="button" value="돌아가기" onclick="pageMoveListFnc();">
				<input class="inputBtn" type="reset" value="초기화">
				<input class="inputBtn" type="button" value="등록하기" onclick="addSubmitFnc();"> 
			</span>
		</form>
		<br>
	</div>
	<jsp:include page="/WEB-INF/views/tail.jsp"/>
</body>
</html>
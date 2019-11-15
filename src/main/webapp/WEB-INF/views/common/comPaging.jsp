<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
	nav > ul{
		list-style-type: none;
 		background-color: #eeeeee;
 		padding: 0px;
		display: table;
		overflow: hidden;
		margin-left: auto;
		margin-right: auto;
		border-radius: 10px;
	}

	nav > ul > li {
		float: left;
	}
	
	nav > ul > li > a{
		display: block;
		color: #333333;
		font-weight: bolder;
		text-align: center;
		padding: 16px;
		text-decoration: none;
	}
	
	nav > ul > li > a:hover {
		color: white;
		background-color: #33eeee;
		font-weight: bolder;
	}
	
	.active{
		color: white;
		background-color: #24afff;
		font-weight: bolder; 
	}
</style>

<script type="text/javascript">

	function goPage(pageNumber){
		var curPageObj = $('#tempCurPage');
		
		curPageObj.val(pageNumber);
		
		var htmlStr = '';
		htmlStr += '<input type="hidden" name="comCurPage"';
		htmlStr += 'value="' + curPageObj.val() + '">';

		$("#pagingForm").html($("#pagingForm").html() + htmlStr);
		
		$("#pagingForm").submit();
	}
	
	$(document).ready(function(){
// 		블록의 현재 위치
		var curPageDoc = $('#tempCurPage');

		
		
		var index = curPageDoc.val();
// 		1~10   1~10    11~20   1~10  21~30 1~10
		index = ((index-1)%10)+1;
		
		$('#pageNation').find('li').eq(index).addClass('active');
		
	});
	
	
</script>


	<nav id='pageNation'>
		<ul>
			<li>
				<a href="#" onclick="goPage(${pagingMap.memberPaging.prevPage});">
					<span>≪</span>
				</a>
			</li>
			
			<c:forEach var="num" begin="${pagingMap.memberPaging.blockBegin}" 
				end="${pagingMap.memberPaging.blockEnd}">
				
<%-- 				<li id="pageButton${num}"> --%>
				<li>
					<a href="#" onclick="goPage(${num});">
						<c:out value="${num}"/>
					</a>
				</li>
			
			</c:forEach>
			
			<li>
				<a href="#" onclick="goPage(${pagingMap.memberPaging.nextPage});">
					<span>≫</span>
				</a>
			</li>
		</ul>
	</nav>



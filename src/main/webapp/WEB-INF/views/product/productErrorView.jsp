<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접근 에러</title>
<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		var container = $('#container');
		
		container.css({'width':'600px', 'height':'400px', 'border':'20px solid #00cccc'
			, 'border-radius':'20px', 'margin':'auto', 'margin-top':'50px'
			, 'padding':'30px', 'text-align':'center'});
		
		container.find('h1').css({'margin':'20px'});
		container.find('h2').css({'margin':'20px'});
		
		container.find('#errorImg').css({'width':'200px', 'height':'250px'});
	})

	var count = 4;
	
	 var countdown = setInterval(function(){
         //해당 태그에 아래 내용을 출력
         $('#countdown').html(count + "초 후 상품 목록으로 이동 합니다.");
             //0초면 초기화 후 이동되는 사이트
             if (count == 0) {
                 clearInterval(countdown);
                 location.href = './list.do';
             }
             count--;//카운트 감소
         }, 1000);
</script>	
<style type="text/css">
a{
	 
}
</style>
</head>
<body>

	<div id="container">	
		<span>
			<img id="errorImg"
				src='<c:url value="/resources/img/Error.png"/>'>
		</span>
		<h1>잘못된 접근입니다.</h1>
		<h2 id="countdown">5초 후 상품 목록으로 이동합니다.</h2>
	</div>

</body>
</html>
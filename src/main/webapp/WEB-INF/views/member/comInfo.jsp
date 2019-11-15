<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
</style>

<script type="text/javascript">
	function goMainFnc() {
		location.href = "/amazing/index.jsp";
	}


</script>
</head>
<body>

<p style="font-family: arial; font-size: 70px; font-weight: bold; 
	text-align: center; margin: 40px 0px 20px 0px; cursor: pointer;"
	onclick="goMainFnc()">으 메 이 징</p>
<hr style="width: 350px; border: solid 2px;"><br><br><br>
<div style="padding:30px; width: 1000px; margin: auto;">
<p style="font-size: 28px; font-weight: bold;">회사소개</p></div>

<div style="width: 1000px; background-color: lightgrey; margin: auto; padding: 25px; font-size: 20px;">
<p style="line-height: 160%;">
으메이징은 세계 최대 검색포털 구글 뿐만 아니라, 전 세계 70억 명이 사용하고 있는 모바일 메신저 '으메', 
동영상 카메라 '이징', 디지털 만화 서비스 '으메이징 웹툰' 등을 서비스하고 있는 아주 으메이징한 기업입니다. 
으메이징은 인공지능, 로보틱스, 모빌리티 등 미래 기술에 대한 지속적인 연구개발을 통해 기술 플랫폼의 변화와 
혁신을 추구하며 세계 각국의 수많은 이용자와 다양한 파트너들이 함께 성장할 수 있도록 노력하고 있습니다.</p><br>
<hr style="border: solid 1px black;"><br><br>

<table class="table">
	<tr>
		<td style="width: 200px;">설립연도</td>
		<td>2019년 11월</td>
	</tr>
	<tr style="height: 20px;"></tr>
	<tr>
		<td>본사 위치</td>
		<td>안드로메다</td>
	</tr>
	<tr style="height: 20px;"></tr>
	<tr>
		<td>주요서비스</td>
		<td>DVD 판매</td>
	</tr>
	<tr style="height: 20px;"></tr>
	<tr>
		<td>주요사업</td>
		<td>온라인 광고 및 콘텐츠 사업</td>
	</tr>
	<tr style="height: 20px;"></tr>
	<tr>
		<td>해외법인</td>
		<td>태양계, 프로토스 행성</td>
	</tr>
	<tr style="height: 20px;"></tr>
	<tr>
		<td>매출액</td>
		<td>297경 7532조 안드로</td>
	</tr>
	<tr style="height: 20px;"></tr>
	<tr>
		<td>전체인력</td>
		<td>3명</td>
	</tr>

</table>
	
</div>
<div style="width: 1000px; margin: auto; padding: 50px;">
<input style="height: 50px; width: 200px; font-size: 22px; margin: 0px; 
	float: right; cursor: pointer; background-color: #00d63d; 
	color: white; font-weight: bold; border-radius: 7px; padding: 0px;"
	type="button" id="goMainBtn" onclick="goMainFnc()" value="메인화면으로">
</div>
<div style="height: 100px;"></div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>
		
</body>
</html>
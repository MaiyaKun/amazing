<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시 충전</title>

<style type="text/css">
.cashChargeCss1{
	font-family: arial;
	font-size: 22px;
	font-weight: bold;
	height: 60px;
	padding: 2px;
	
}

.cashChargeCss2{
	padding: 5px 10px;
	height: 35px;
	width: 330px;
	font-size: 20px;
	font-family: arial;
	padding: 4px 10px;
}

#whole {
	height: 520px;
}

</style>

<script type="text/javascript">
	function moveMainFnc() {
		location.href = "/amazing/index.jsp";
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">캐시 충전이 완료되었습니다!</p>
	<div id="whole">
		<form id="cashCharge" action="./cashChargeCtr.do" method="post">
			<div style="margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
				<table style="margin: auto;">
					<tr>
						<td class="cashChargeCss1" style="width: 180px;">보유했던 캐시</td>
						<td class="cashChargeCss1" style="width: 300px;">
							<input class="cashChargeCss2" type="text" name="lastCash" readonly="readonly" value="${lastCash}">
						</td>
					</tr>
					<tr>
						<td class="cashChargeCss1">충전한 캐시</td>
						<td class="cashChargeCss1">
							<input class="cashChargeCss2" type="text" name="lastCash" readonly="readonly" value="${inputCash}">
						</td>
					</tr>
					<tr>
						<td class="cashChargeCss1">현재 캐시</td>
						<td class="cashChargeCss1">
							<input class="cashChargeCss2" type="text" name="lastCash" readonly="readonly" value="${cash}">
						</td>
					</tr>
				</table>
			</div>
			<div style="margin: auto; width: 700px;">
				<input style="height: 50px; width: 200px; font-size: 22px; float: right; cursor: pointer;
					background-color: #24afff; color: white; font-weight: bold; border-radius: 7px;"
					type="button" id="mainBtn" value="확 인" onclick="moveMainFnc();">
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
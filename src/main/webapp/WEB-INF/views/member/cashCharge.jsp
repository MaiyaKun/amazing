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

<script type="text/javascript" 
	src="/amazing/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".cashChargeCss2").focus();
		
		$(".cashChargeCss2").on('keyup', function(e) {
			stringCheck($(this).val());
		});
		$(".cashChargeCss2").on('paste', function(e) {
			alert("붙여넣기는 사용할 수 없습니다.");
			location.href = "./productBasket.do";
		});
		
	});
	
	function stringCheck(check) {
		if(isNaN(check) == true){
			alert("숫자만 입력해 주세요.");
			location.href = "./cashCharge.do";
		} else if(check < 1){
			alert("1 이상의 숫자를 입력해 주세요.");
			location.href = "./cashCharge.do";
		}
	}
	
	function moveMainFnc() {
		location.href = "/amazing/index.jsp";
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<p style="font-family: arial; font-size: 40px; font-weight: bold; 
	text-align: center;">캐시 충전</p>
	<div id="whole">
		<form id="cashCharge" action="./member/cashChargeCtr.do" method="post">
			<div style="margin: auto; width: 600px; background-color: lightgrey; padding: 50px;">
				<table style="margin: auto;">
					<tr>
						<td class="cashChargeCss1" style="width: 180px;">보유 캐시</td>
						<td class="cashChargeCss1" style="width: 300px;">
							<input class="cashChargeCss2" type="text" name="lastCash" 
								readonly="readonly" value="${cash}">
						</td>
					</tr>
					<tr>
						<td class="cashChargeCss1">충전 캐시</td>
						<td class="cashChargeCss1">
							<input class="cashChargeCss2" type="text" name="cash" 
								 maxlength="10" placeholder="충전할 금액 입력">
						</td>
					</tr>
				</table>
			</div>
			<div style="margin: auto; width: 700px;">
				<input style="height: 50px; width: 200px; font-size: 22px; float: left; cursor: pointer; 
					background-color: #24afff; color: white; font-weight: bold; border-radius: 7px;"
					type="button" id="mainBtn" value="메인으로" onclick="moveMainFnc();">
				<input style="height: 50px; width: 200px; font-size: 22px; float: right; cursor: pointer; 
					background-color: #24afff; color: white; font-weight: bold; border-radius: 7px;"
					type="submit" id="cashChargeBtn" value="충전하기">
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp"/>

</body>
</html>
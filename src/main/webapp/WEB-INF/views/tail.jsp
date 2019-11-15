<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tail</title>

<style type="text/css">

.tailCss1 {
	font-family: arial;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
	padding: 15px;
}

.tailCss2 {
	font-family: arial;
	font-size: 15px;
	text-align: left;
	padding: 15px;
	line-height: 150%;
}

</style>

<script type="text/javascript">

	function moveComInfoFnc() {
		location.href="/amazing/comInfo.do";
	}
	function moveTermsFnc() {
		location.href="/amazing/terms.do";
	}
	function movePrivateTermsFnc() {
		location.href="/amazing/privateTerms.do";
	}
	function moveCancelRefundFnc() {
		location.href="/amazing/cancelRefund.do";
	}

</script>
</head>
<body>

<div style="width: 100%; height: 52px; background-color: lightgrey; border-bottom: 1px solid grey; margin-top:30px;">
<div style="width: 1000px; margin: auto;">
	<table>
		<tr>
			<td class="tailCss1" style="cursor: pointer;" onclick="moveComInfoFnc()">회사소개</td>
			<td style="color: grey;">&nbsp;|&nbsp;</td>
			<td class="tailCss1" style="cursor: pointer;" onclick="moveTermsFnc()">이용약관</td>
			<td style="color: grey;">&nbsp;|&nbsp;</td>
			<td class="tailCss1" style="cursor: pointer;" onclick="movePrivateTermsFnc()">개인정보 취급방침</td>
			<td style="color: grey;">&nbsp;|&nbsp;</td>
			<td class="tailCss1" style="cursor: pointer;" onclick="moveCancelRefundFnc()">취소/환불약관</td>
		</tr>
	</table>
</div>
</div>

<div style="width: 100%; height: 170px; background-color: lightgrey;">
<div style="width: 1000px; margin: auto;">
	<table>
		<tr>
			<td class="tailCss2">주식회사 으메이징<span style="color: grey;">&nbsp;|&nbsp;</span>
			대표 : 이민우<span style="color: grey;">&nbsp;|&nbsp;</span>사업자번호 : 123-56-78910<br>
			주소 : 안드로메다 홍제동 아마존대로 567, 749층(트럼프타워)<br>
			통신판매업 신고번호 : 제 2019-킬리만자로-083호<br>
			대표전화 : 070-1234-5678<span style="color: grey;">&nbsp;|&nbsp;</span>E-mail : amazing@amazing.com<br><br>
			Copyright ⓒ 2019 으메이징 All rights reserved.</td>
			<td class="tailCss2">본 사이트는 DVD를 판매하고 있습니다.<br>
			온라인을 통한 결제 이후 환불 및 민원에 대한 처리는 안하고 있으며,<br>
			문의사항이 있는 경우 고객센터(0507-0465-4735)로 연락바랍니다.<br><br>
			고객센터 운영시간 새벽 03:00 ~ 03:05 (연중무휴)<br>
			※ 상담 중 운영시간이 지나면 바로 전화 끊습니다.</td>
		</tr>
	</table>
</div>
</div>


</body>
</html>
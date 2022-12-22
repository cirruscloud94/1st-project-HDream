<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-head.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/reservList.css"/>
<html>
<head>
	<script type="text/javascript">
		$(document).ready(function(){
			var parent_val = opener.$(".on #r_idx").val(); 

			// 자식창(팝업창)에서 id가 child_val인 요소(태그)의 값에 부모창에서 가져온 값 넣기
			$("#child_val").val(parent_val);
		});	
	
		function checkForm(form) {
			var msg = form.r_msg.value; //빈칸체크
			if (msg == "" || msg == null) {
				alert("내용을 입력해주세요.");
				return false;
			} return true;
		};			
	</script>
<title>Refund Page</title>
</head>
<body class="txt_center">
	<br>
	<h3>환불사유</h3>
	<br>
	<form action="/user/reserv/submitRefundForm" method="post" onsubmit="return checkForm(this);">
		<textarea style="height: 150px;" cols="38" name="r_msg" id="r_msg" maxlength="65"
		placeholder="환불사유를 65자 이내로 작성해주세요:)"></textarea>
		<br><br>
		<input type="hidden" value="" id="child_val" name="r_idx">
		<input type="submit" class="btn submit" value="제출하기">
	</form>
</body>
</html>
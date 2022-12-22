<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-head.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/reservList.css"/>
<html>
<head>
	<script type="text/javascript">
		function checkForm(form) {
			var msg = form.r_msg.value; //빈칸체크
			if (msg == "" || msg == null) {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
		};			
	</script>
<title>Refund Page</title>
</head>
<body class="txt_center">
	<br>
	<h3>환불사유</h3>
	<br><br>
		<span class="bgColor txt_big">&nbsp;환불요청이 정상적으로 접수되었습니다:)&nbsp;</span><br>
	<br><br><br>
		<input type="button" class="btn submit" value="닫 기" onclick="window.opener.location.reload(); window.close();">
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/css/cafeReservList.css"/>

<main class="layoutCenter">
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
	
	<script type="text/javascript">
		function checkUser(form) {
			var inputPW = form.M_PW.value; //입력한 비밀번호
			var realPW = form.realPW.value; //찐비밀번호
			
			if (inputPW == "" || inputPW == null) {
				alert("비밀번호를 입력해주세요.");
				return false;
			}

			if (realPW != inputPW) {
				alert("비밀번호가 틀렸습니다. 다시 입력해주세요 :(");
				return false;
			}
		};			
	</script>
	
	<h1>회원탈퇴</h1><br>
	
		<div class="txt_center">
			
			<c:if test="${userInfo.M_TYPE==1}">
				<span class="bgColor">&nbsp;사장님! 폐업신고는 하셨나요? 하실거라면 잊지 말고 해주세요 :)&nbsp;</span>
			</c:if>
			
			<form action="/user/mypage/info/userOption" method="post" >
				<p class="color">회원정보수정 및 회원탈퇴를 위해서는 해당 작업이 필요합니다.</p><br>			
				<input type="password" name="M_PW" placeholder="비밀번호를 입력해주세요 :)">
				<input type="hidden" name="realPW" value="${userInfo.M_PW}" >
				<input type="hidden" id="M_ID" name="M_ID" value="${userInfo.M_ID}">
				<input class="btn submit" type="submit" value="확인" onClick="return checkUser(this.form);">
			</form>
		</div>
		<br><br>
	</div><!-- //컨텐츠 종료 -->
	</body>
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
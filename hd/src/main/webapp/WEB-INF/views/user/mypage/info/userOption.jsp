<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/css/reservList.css"/>

<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">

		<script type="text/javascript">
		
			function recheck() {
				var check1 = confirm("정말 탈퇴하시겠어요? \n 확인을 누르시면 탈퇴가 완료됩니다.")
				var check2 = confirm("사장님! 탈퇴 전에 리뷰나 문의사항 등은 자동삭제 되지 않습니다. \n 이 점 참고해주세요 :)")
				return (check1 && check2)
				
				;
				
			};		
		</script>

		<h1>나의 정보관리</h1>

		<c:if test="${userInfo != null}">

			<span class="color">${m_name}님의 마이페이지입니다 :)</span>
			<br><br><br><br>
			<div class="txt_center flex">
				<c:if test="${!empty reservList}">
					<div class="border_right">
						<table><form>
							<span class="color txt_big">&nbsp;회원탈퇴를 하고 싶으신가요?&nbsp;</span><br>
							<span class="bgColor">&nbsp;버튼을 누르면 바로 탈퇴됩니다.&nbsp;</span><br><br>
							<a class="btn disable" >회원탈퇴</a>
							<br><br>
							<c:if test="${userInfo.M_TYPE==1}">
								<span class="bgSubColor">
									&nbsp;※ 사장님의 카페에 유효한 예약내역이 남아있습니다.&nbsp;<br>
									&nbsp;해당 내역을 모두 예약취소하셔야만 탈퇴가 가능합니다.&nbsp;
								</span>
							</c:if>
						</form></table>
					</div>
				</c:if>
				<c:if test="${empty reservList}">
					<div class="border_right">
						<table><form action="/user/mypage/info/deleteUser" method="post">
							<span class="color txt_big">&nbsp;회원탈퇴를 하고 싶으신가요?&nbsp;</span><br>
							<span class="bgColor">&nbsp;버튼을 누르면 바로 탈퇴됩니다.&nbsp;</span><br><br>
							<input type="submit" class="btn submit" value="회원탈퇴"onClick="return recheck();">
							<input type="hidden" id="M_ID" name="M_ID" value="${userInfo.M_ID}">
							<input type="hidden" id="M_TYPE" name="M_TYPE" value="${userInfo.M_TYPE}">
							<br><br>
							<c:if test="${userInfo.M_TYPE==1}">
								<span class="bgColor">
									&nbsp;사장님! 폐업신고는 하셨나요?&nbsp;<br>
									&nbsp;하실거라면 잊지 말고 해주세요 :)&nbsp;
								</span>
							</c:if>
						</form></table>
					</div>
				</c:if>
				<div>
					<table><form action="/user/mypage/info/openUserUpdate" method="post">
						<span class="color txt_big">&nbsp;개인정보수정을 하고 싶으신가요?&nbsp;</span><br>
						<span class="bgColor">&nbsp;버튼을 누르면 수정창으로 이동합니다.&nbsp;</span><br><br>
						<input type="hidden" id="M_ID" name="M_ID" value="${userInfo.M_ID}"> 
						<input class="btn submit" type="submit" value="회원정보수정" >
						<br><br>
						<%-- <div class="subColor">
							ID : ${fn:substring(userInfo.M_ID,0,2)}
							<c:forEach begin="3" end="${fn:length(userInfo.M_ID)}" step="1">
								*
							</c:forEach><br>
							PW : ${fn:substring(userInfo.M_PW,0,2)}
							<c:forEach begin="3" end="${fn:length(userInfo.M_PW)}" step="1">
								*
							</c:forEach>
						</div> --%>
					</form></table>
				</div>
			</div>
			<br><br><br><br>

		</c:if>

	</div>

</main>
<!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
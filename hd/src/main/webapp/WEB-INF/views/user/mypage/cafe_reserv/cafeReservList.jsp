<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/css/cafeReservList.css"/>

<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>

	<div class="main_wrap">
			<script>
			function checkIt(){ alert("성공적으로 수정되었습니다"); }
			</script>
	<h1>나의 가게 예약관리</h1>
	<c:if test="${!empty list}">
			
				<table>
					<thead><tr>
						<th>예약번호</th>
						<th>예약정보</th>
						<th>예약상태</th>
						<th>고객정보</th>
						<th></th>
					</tr></thead>
					<c:forEach items="${list}" var="r">
						<form method="POST" action="/owner/mypage/cafe_reserv/updateStatus" onsubmit="checkIt()">
					<tr  class="txt_center">
						<td>
							<span class="color"><strong>No. ${r.R_IDX}</strong></span><br>
							<span class="subColor">#${r.ROWNUM}</span>
						</td>
						<td>
							${r.R_ROOM_NAME} (${r.R_PEOPLE}명)<br>
							${fn:substring(r.R_DATE,0,2)}.${fn:substring(r.R_DATE,2,4)}.${fn:substring(r.R_DATE,4,6)}
							${fn:substring(r.R_POSSIBLETIME,0,2)}:${fn:substring(r.R_POSSIBLETIME,2,4)}<br>
							(${r.R_USETIME}분)
						</td>
						<td class="txt_small">
							<label> <input type="radio" name="R_STATUS" value=0
								<c:if test="${r.R_STATUS == 0}">checked</c:if> />예약취소
							</label> <br>
							<label> <input type="radio" name="R_STATUS" value=1
								<c:if test="${r.R_STATUS == 1}">checked</c:if> />입금대기
							</label> <br>
							<label> <input type="radio" name="R_STATUS" value=2
								<c:if test="${r.R_STATUS == 2}">checked</c:if> />결제완료
							</label> <br>
							<label> <input type="radio" name="R_STATUS" value=3
								<c:if test="${r.R_STATUS == 3}">checked</c:if> />예약확정
							</label> <br>
							<label> <input type="radio" name="R_STATUS" value=4
								<c:if test="${r.R_STATUS == 4}">checked</c:if> />사용완료
							</label>
						</td>
						<td>
							<span class="bold">${r.R_NAME}</span><br>
							<input type="hidden" name="R_PAYMETHOD" value="${r.R_PAYMETHOD}">
							<c:if test="${r.R_PAYMETHOD == 0 }">
								무통장
							</c:if>
							<c:if test="${r.R_PAYMETHOD == 1 }">
								일반결제
							</c:if>
							<c:if test="${r.R_PAYMETHOD == 2 }">
								카카오페이
							</c:if>
							<br>
							${fn:substring(r.R_CELLPHONE,0,3)}-
							${fn:substring(r.R_CELLPHONE,3,7)}-
							${fn:substring(r.R_CELLPHONE,7,11)}
							<br>
							<span class="color">
							<fmt:formatNumber value="${r.R_PRICE}" type="currency"/>
							</span>
						</td>
						<td >
							<input type="hidden" name="R_IDX" value="${r.R_IDX}">
							<input type="submit" class="btn submit" value="정보수정">
						</td>
					</tr>
							</form>
					</c:forEach>
				</table>

	</c:if>
	<c:if test="${empty list}">
		<br><br><br><br><br><br>
		<center class="color">확인되는 예약내역이 존재하지 않습니다.</center>	
	</c:if>
	<br>
	</div>
	<!-- //컨텐츠 종료 -->
</main>
<!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
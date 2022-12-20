<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/css/reservList.css"/>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<!-- 마이페이지에 해당하는 페이지라면 nav 삽입이 필요합니다. -->
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
		
	<script type="text/javascript">
		function checkCancel() {
			var output = confirm("정말 삭제하시겠습니까?");
			return output;
		}
	</script>
	
	<h1>나의 예약현황</h1>
	<span class="color"><%=session.getAttribute("m_name") %>님의 예약현황입니다 :)</span> <br><br>
	<c:if test="${!empty list}">
		<table class="card_table" ><tbody>
		<c:forEach items="${list}" var="r">
			<tr>
				<td>
					<div style="float:left;" class="txt_big">${r.R_CAFE_NAME}</div>
					<div style="float:right;" class="color">
						<c:if test="${r.R_STATUS==0}">예약취소</c:if>
						<c:if test="${r.R_STATUS==1}">입금대기</c:if>
						<c:if test="${r.R_STATUS==2}">결제완료</c:if>
						<c:if test="${r.R_STATUS==3}">예약확정</c:if>
						<c:if test="${r.R_STATUS==4}">사용완료</c:if>
					</div>
					<br>
				</td>
				<td>&nbsp;${r.R_ROOM_NAME} (${r.R_PEOPLE}명)</td>
				<td>&nbsp;${r.R_CAFE_LOCATION}</td>
				<td>&nbsp;${fn:substring(r.R_DATE,0,2)}.${fn:substring(r.R_DATE,2,4)}.${fn:substring(r.R_DATE,4,6)}
					${fn:substring(r.R_POSSIBLETIME,0,2)}:${fn:substring(r.R_POSSIBLETIME,2,4)} (${r.R_USETIME}분)
				</td>
				<td align="right">
					<div class="flex">
						<a class="btn submit" href="/com/detail/selectGoodsInfo/${r.C_IDX}">상세정보</a>&nbsp;
						<c:if test="${r.R_STATUS==4}">
							<a class="btn submit" href="#">리뷰작성</a>
						</c:if>
						<c:if test="${r.R_STATUS==1||r.R_STATUS==2||r.R_STATUS==3}">
							<form action="/user/mypage/reserv/cancelReserv" method="POST">
								<a class="btn disable" href="">리뷰작성</a>
								<input type="hidden" name="R_IDX" value="${r.R_IDX}">
								<input type="submit" value="예약취소" class="btn submit"  onclick="return checkCancel();" >
							</form>
						</c:if>
						<c:if test="${r.R_STATUS==0}">
							<a class="btn disable" href="#">리뷰작성</a>
						</c:if>
					</div>
				</td>
			</tr>
	</c:forEach>
	</tbody></table>
	</c:if>
	
	<c:if test="${empty list}">
		<br><br>
		<div class="txt_center color">
		<h1>😲</h1>
		저희 서비스를 이용하신 적이 없으시네요<br>
		그렇다면 예약하러 가볼까요?	
		</div>
	</c:if>
		<br><br><br><br><br><br>
	</div><!-- div 종료 -->
</main><!-- main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
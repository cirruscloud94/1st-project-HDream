<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/css/reservList.css" />
<style>
	.bigheart{ font-size: 23px; }
</style>
<main class="layoutCenter">

	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">

		<h1>나의 찜한 카페</h1>
		<span class="color"><%=session.getAttribute("m_name")%>님의 찜카페 목록입니다 :)</span> <br><br>

		<c:if test="${!empty list}">
			<table class="card_table">
				<tbody>
					<c:forEach items="${list}" var="r">
						<tr>
							<td><div class="txt_big">${r.CAFE_NAME}</div></td>
							<td>${r.CAFE_LOCATION}</td>
							<td>${fn:substring(r.CAFE_TEL,0,3)}-
								${fn:substring(r.CAFE_TEL,3,7)}-
								${fn:substring(r.CAFE_TEL,7,11)}</td>
							<td align="right">
								<div class="txt_right">
									<a class="btn submit" href="/com/detail/selectGoodsInfo/${r.CAFE_IDX}">상세정보</a>&nbsp;
									<!-- 이미 찜한 아이라면 -->
									<a class="use_move" href="/user/mypage/deleteZzim/${r.CAFE_IDX}" 
									onclick="move(this, 'in', 'cafe_idx'); alert('카페 찜이 삭제되었어요!');" >
										<input type="hidden" name="cafe_idx" value="${r.CAFE_IDX}">
										<button type="submit" class="btn bigheart"><i class="fa-solid fa-heart"></i></button>
									</a>
									
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

		<c:if test="${empty list}">
			<br>
			<br>
			<div class="txt_center color">
				<h1>😲</h1>
				찜한 카페가 없어요!
			</div>
		</c:if>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<!-- div 종료 -->
</main>
<!-- main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
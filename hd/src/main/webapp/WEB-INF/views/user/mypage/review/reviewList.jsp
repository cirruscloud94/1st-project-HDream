<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<!-- 마이페이지에 해당하는 페이지라면 nav 삽입이 필요합니다. -->
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">


		<h1>나의 리뷰현황</h1>
		<span class="color"><%=session.getAttribute("m_name") %>님의
			리뷰현황입니다 :)</span> <br>
		<br>
		<form action="./updateReview" method="post" class="txt_center">
			<table class="card_table">
				<c:choose>
					<c:when test="${list[0].TOTAL_COUNT != 0}">
						<c:forEach items="${list}" var="i" varStatus="status">
							<tr>
								<td><div style="float: left;" class="txt_big">${i.R_CAFE_NAME}</div>
									<div style="float: right;">${i.R_ROOM_NAME}</div></td>

								<td>리뷰 : ${i.V_CONTENTS}</td>
								<td><c:forEach begin="1" end="${i.V_STAR}">⭐</c:forEach></td>
								<td>${i.R_ID} ${i.V_REG_DATE}</td>


								<td><a class="btn submit"
									href="/com/detail/selectGoodsInfo/${i.V_C_IDX}"
									onclick="move(this, 'in', 'v_c_idx')">상세정보</a>&nbsp; <input
									type="hidden" name="cafe_idx" value="${i.V_C_IDX}"> <a
									href="/user/mypage/review/updateForm" class="btn use_move"
									onclick="move(this, 'in', 'v_idx', 'v_contents', 'v_star')">
										수정 <input type="hidden" name="v_idx" value="${i.V_IDX}">
										<input type="hidden" name="v_contents" value="${i.V_CONTENTS}">
										<input type="hidden" name="v_star" value="${i.V_STAR}">
								</a> <a href="/user/mypage/review/deleteReview" class="btn use_move"
									id="del" onclick="if(delete_re()) move(this, 'in', 'v_idx'); ">
										리뷰삭제 <input type="hidden" name="v_idx" value="${i.V_IDX}">
								</a></td>
								<td></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<c:if test="${!empty paginationInfo}">
				<tfoot>
					<tr>
						<td class="paging" colspan="4"><ui:pagination
								paginationInfo="${paginationInfo}" type="text"
								jsFunction="paging" /></td>
					</tr>
				</tfoot>
			</c:if>
		</form>
		<br><br>
		<script type="text/javascript">
			function delete_re() {
				var result = confirm("리뷰를 삭제하시겠습니까 ? \n삭제시 재작성이 불가합니다");

				if (result) {
					return true;
				} else {
					return false;
				}
			}
		</script>
	</div>


	<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
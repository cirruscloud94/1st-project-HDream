<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/board_list.css"/>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<!-- 고객센터에 해당하는 페이지라면 nav 삽입과 -->
	<%@ include file="/WEB-INF/include/nav_cs.jspf" %>
	<!-- 컨텐츠 묶음용 div 삽입이 필요합니다. -->
	<div class="main_wrap">
		<article>
			<div class="title flexBetween"><h2>공지사항</h2><a class="more" href="/cs/noticeList">더보기 ></a></div>
			<table>
				<colgroup>
					<col width="auto"/>
					<col width="50px"/>
					<col width="200px"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${notice[0].TOTAL_COUNT == 0}">
							<tr>
								<td colspan="3" align="center">조회된 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${notice}" var="i">
								<tr onclick="move(this,'in','B_INFO_IDX');" data-href="/cs/noticeDetail">
									<td class="title">
										${i.B_INFO_TITLE}
										<input type="hidden" name="B_INFO_IDX" value="${i.B_INFO_IDX}">
									</td>
									<td class="read_count">${i.B_INFO_READ_HIT}</td>
									<td class="reg_date">${i.B_INFO_REG_DATE}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</article>
		<article>
			<div class="title flexBetween"><h2>자주 묻는 질문</h2><a class="more" href="/cs/faqList">더보기 ></a></div>
			<table>
				<colgroup>
					<col width="auto"/>
					<col width="50px"/>
					<col width="200px"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${faq[0].TOTAL_COUNT == 0}">
							<tr>
								<td colspan="3" align="center">조회된 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${faq}" var="i">
								<tr onclick="move(this,'in','B_FAQ_IDX');" data-href="/cs/faqDetail">
									<td class="title">
										${i.B_FAQ_TITLE}
										<input type="hidden" name="B_FAQ_IDX" value="${i.B_FAQ_IDX}">
									</td>
									<td class="read_count">${i.B_FAQ_READ_HIT}</td>
									<td class="reg_date">${i.B_FAQ_REG_DATE}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</article>
	<c:if test="${!empty m_id}">
		<article>
			<div class="title flexBetween"><h2>1:1 문의</h2><a class="more" href="/cs/qnaList">더보기 ></a></div>
			<table>
				<colgroup>
					<col width="auto"/>
					<col width="50px"/>
					<col width="200px"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>	
				<tbody>
					<c:choose>
						<c:when test="${qna[0].TOTAL_COUNT == 0}">
							<tr>
								<td colspan="3" align="center">조회된 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${qna}" var="i">
								<tr onclick="move(this,'in','B_QNA_IDX');" data-href="/cs/qnaDetail">
									<td class="title">
										${i.B_QNA_TITLE}
										<input type="hidden" name="B_QNA_IDX" value="${i.B_QNA_IDX}">
									</td>
									<td class="read_count">${i.B_QNA_READ_HIT}</td>
									<td class="reg_date">${i.B_QNA_REG_DATE}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</article>
	</c:if>
	</div>
	<!-- //컨텐츠 종료 -->
</main>
<!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
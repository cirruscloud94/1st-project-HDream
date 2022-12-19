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
			<div class="title flexBetween"><h2>공지사항</h2><a class="more" href="/board/notice">더보기 ></a></div>
			<table>
				<colgroup>
					<col width="auto"/>
					<col width="50px"/>
					<col width="150px"/>
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
						<c:when test="${!empty notice}">
							<c:forEach items="${notice}" var="i">
								<tr onclick="move(this,'in','b_info_idx');" data-href="/board/notice/detail/${i.b_info_idx}">
									<td class="title">
										${i.b_info_title}
										<input type="hidden" name="b_info_idx" value="${i.b_info_idx}">
									</td>
									<td class="read_count">${i.b_info_read_hit}</td>
									<td class="reg_date">${i.b_info_reg_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="empty"><td colspan="3">조회된 결과가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</article>
		<article>
			<div class="title flexBetween"><h2>자주 묻는 질문</h2><a class="more" href="/board/faq">더보기 ></a></div>
			<table>
				<colgroup>
					<col width="auto"/>
					<col width="50px"/>
					<col width="150px"/>
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
						<c:when test="${!empty faq}">
							<c:forEach items="${faq}" var="i">
								<tr onclick="move(this,'in','b_info_idx');" data-href="/board/faq/detail/${i.b_faq_idx}">
									<td class="title">
										${i.b_info_title}
										<input type="hidden" name="b_info_idx" value="${i.b_info_idx}">
									</td>
									<td class="read_count">${i.b_info_read_hit}</td>
									<td class="reg_date">${i.b_info_reg_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="empty"><td colspan="3">조회된 결과가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</article>
		<article>
			<div class="title flexBetween"><h2>1:1 문의</h2><a class="more" href="/board/qna">더보기 ></a></div>
			<table>
				<colgroup>
					<col width="auto"/>
					<col width="50px"/>
					<col width="150px"/>
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
						<c:when test="${!empty qna}">
							<c:forEach items="${qna}" var="i">
								<tr onclick="move(this,'in','b_qna_idx');" data-href="/board/qna/detail/${i.b_qna_idx}">
									<td class="title">
										${i.b_qna_title}
										<input type="hidden" name="b_qna_idx" value="${i.b_qna_idx}">
									</td>
									<td class="read_count">${i.b_qna_read_hit}</td>
									<td class="reg_date">${i.b_qna_reg_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="empty"><td colspan="3">조회된 결과가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</article>
	</div>
	<!-- //컨텐츠 종료 -->
</main>
<!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">

					<tbody>
					<c:choose>
						<c:when test="${!empty list}">
							<c:forEach items="${list}" var="i" varStatus="status">
								<tr>
										
									<td>${i.V_C_IDX}</td>
									<td>${i.V_CONTENTS}</td>
									<td>${i.V_STAR}</td>
									<td>${i.V_WRITER}</td>
									<td>${i.V_REG_DATE}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td>조회된 결과가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
					

<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
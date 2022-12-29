<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">	
<div align="center"><h1>문의사항 답글 작성</h1></div>
<form action="/admin/qnaAnswer" method="post">
<table>
	<c:forEach var="map" items="${list}">
		<c:if test="${!(map.B_QNA_REPLY_IDX > 0)}">
			<tbody>
				<tr>
					<th>제목</th>
					<td><strong>${map.B_QNA_TITLE}</strong></td>
					<th>회원ID</th>
					<td>${map.B_QNA_M_ID}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${map.B_QNA_REG_DATE}</td>
					<th>조회수</th>
					<td>${map.B_QNA_READ_HIT}</td>
				</tr>
				<tr>
					<td colspan="4" style="white-space:pre; height:300px;">${map.B_QNA_CONTENTS}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="4">
						<input type="hidden" name="B_QNA_TITLE" value="답변: ${map.B_QNA_TITLE}">
						<input type="hidden" name="B_QNA_M_ID" value="${m_id}">
						<input type="hidden" name="B_QNA_REPLY_IDX" value="${map.B_QNA_IDX}">
						<textarea rows="20" cols="100" id="B_QNA_CONTENTS" name="B_QNA_CONTENTS" style="height:100px"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						<a href="/admin/qnaList" class="btn normal">목록으로</a>
						<input class="btn submit" type="submit" value="저장하기">
					</td>
				</tr>
			</tfoot>
		</c:if>
	</c:forEach>
</table>
</form>
</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
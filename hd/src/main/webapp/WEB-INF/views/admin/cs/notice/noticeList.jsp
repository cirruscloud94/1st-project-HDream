<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">
<div align="center"><h1>공지사항</h1></div>
<div class="row" align="right">
	<form action="/admin/noticeList" method="POST">
		<select name="searchType">
				<option value="A">전체</option>
				<option value="T">제목</option>
				<option value="C">내용</option>				
			</select>
			<input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100">
			<input class="btn submit" type="submit" value="검색">
	</form>
</div>

<table>
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach var="row" items="${list }">
					<tr align="center" class="use_move" data-href="/admin/noticeDetail" onclick="move(this, 'in', 'B_INFO_IDX')">
						<td>${row.B_INFO_IDX }</td>
						<td>
							${row.B_INFO_TITLE }
							<input type="hidden" id="B_INFO_IDX" name="B_INFO_IDX" value="${row.B_INFO_IDX }">
						</td>
						<td>${row.B_INFO_READ_HIT}</td>
						<td>${row.B_INFO_REG_DATE }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4" align="center">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<%-- <c:if test="${!empty paginationInfo}">
	<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="fn_search" />
</c:if> --%>
<br/>
<div align="center"><a href="/admin/noticeWriteForm" class="btn submit">글쓰기</a></div>
</main>
<script>
function fn_search(pageNo){
	console.log(pageNo);
}
</script>

<%@ include file="/WEB-INF/include/admin-footer.jspf" %>
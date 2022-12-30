<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">
<h1 class="txt_center">문의사항</h1>
<div class="flexBetween">
	<form action="/admin/qnaList" method="POST">
		<select name="searchType">
				<option value="A">전체</option>
				<option value="T">제목</option>
				<option value="C">내용</option>
			</select>
			<input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100">
			<input class="btn submit" type="submit" value="검색">
	</form>
</div>
<br>
<table>
	<colgroup>
		<col width="5%"/>
		<col width="*"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>회원ID</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${list[0].TOTAL_COUNT == 0}">
				<tr>
					<td colspan="5" align="center">조회된 결과가 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${list[0].TOTALCOUNT != 0}">
				<c:forEach items="${list }" var="row">
					<tr align="center" class="use_move" data-href="/admin/qnaDetail" onclick="move(this, 'in', 'B_QNA_IDX')">
						<td>${row.B_QNA_IDX }</td>
						<td>
							${row.B_QNA_TITLE }
							<input type="hidden" id="B_QNA_IDX" name="B_QNA_IDX" value="${row.B_QNA_IDX }">
						<td>${row.B_QNA_M_ID }</td>
						<td>${row.B_QNA_READ_HIT}</td>
						<td>${row.B_QNA_REG_DATE }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
	<c:if test="${!empty paginationInfo}">
		<tfoot>
			<tr>
				<td class="paging" colspan="5">
					<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
				</td>
			</tr>
		</tfoot>
	</c:if>
</table>
</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
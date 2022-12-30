<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<main class="layoutCenter">
<div>
	<div align="center">
		<h1>리뷰관리</h1>
	</div>
	<div class="row" align="left">
	<form action="/admin/reviewList" method="POST">
		<select name="searchType">
				<option value="A">전체</option>
				<option value="I">아이디</option>
				<option value="C">카페번호</option>
			</select>
			<input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100">
			<input class="btn submit" type="submit" value="검색">
	</form>
	</div>
	<br>
	<table>
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>카페번호</th>
				<th>아이디</th>	
				<th>별점</th>
				<th>작성날짜</th>
				<th>수정날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${list[0].TOTAL_COUNT == 0}" >
					<tr><td colspan="6" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:when test="${list[0].TOTAL_COUNT != 0}">
					<c:forEach var="i" items="${list}">
						<tr align="center" class="use_move" data-href="/admin/reviewDetail" onclick="move(this, 'in', 'v_idx')">
							<td>${i.V_IDX}<input type="hidden" name="v_idx" value="${i.V_IDX}"></td>
							<td>${i.V_C_IDX}</td>
							<td>${i.V_WRITER}</td>
							<td>${i.V_STAR}</td>
							<td>${i.V_REG_DATE }</td>
							<td>${i.V_MOD_DATE }</td>							
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
		<c:if test="${!empty paginationInfo}">
			<tfoot>
				<tr>
					<td class="paging" colspan="6">
						<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
					</td>
				</tr>
			</tfoot>
		</c:if>
	</table>
</div>
</main>

<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
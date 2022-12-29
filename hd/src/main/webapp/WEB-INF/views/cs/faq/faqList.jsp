<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>

<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_cs.jspf" %>	
<div align="center" class="main_wrap"><h1>FAQ</h1></div>
<div class="row" align="right">
	<form action="/cs/faqList" method="POST">
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
<div class="main_wrap">
<table>
	<colgroup>
		<col width="10%"/> 
		<col width="auto"/>
		<col width="10%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">글 번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${list[0].TOTAL_COUNT == 0}">
				<tr>
					<td colspan="4" align="center">조회된 결과가 없습니다.</td>
				</tr>
			</c:when> 
			<c:when test="${list[0].TOTALCOUNT != 0}">
				<c:forEach var="row" items="${list }">
					<tr align="center" class="use_move" data-href="/cs/faqDetail" onclick="move(this, 'in', 'B_FAQ_IDX')">
						<td>${row.B_FAQ_IDX }</td>
						<td>
							${row.B_FAQ_TITLE }
							<input type="hidden" id="B_FAQ_IDX" name="B_FAQ_IDX" value="${row.B_FAQ_IDX }">
						</td>
						<td>${row.B_FAQ_READ_HIT}</td>
						<td>${row.B_FAQ_REG_DATE }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
	<c:if test="${!empty paginationInfo}">
		<tfoot>
			<tr>
				<td class="paging" colspan="4">
					<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
				</td>
			</tr>
		</tfoot>
	</c:if>
</table>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">

<div>
<div align="center"><h1>문의사항 목록</h1></div>
<div class="row" align="right">
	<form id="qnaSearch" action="/admin/qnaList" method="POST">
		<select name="searchType">
				<option value="A">전체</option>
				<option value="T">제목</option>
				<option value="C">내용</option>
			</select>
			<input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100">
			<input class="btn submit" type="submit" value="검색">
	</form>
</div>
<div class="row">
<table>
	<colgroup>
		<col width="5%"/>
		<col width="*"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="20%"/>
		<col width="10%"/>
	</colgroup>
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>회원ID</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>답변여부</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr align="center">
						<td>${row.B_QNA_IDX }</td>
						<td>${row.B_QNA_TITLE }</td>
						<td>${row.B_QNA_M_ID }</td>
						<td>${row.B_QNA_READ_HIT}</td>
						<td>${row.B_QNA_REG_DATE }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6" align="center">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
</div>
</div>
	
<script type="text/javascript">
	
</script>

</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">
<div align="center"><h1>문의사항 답글 수정</h1></div>
<form action="/admin/qnaAnswerUpdate" method="post">
<table>
	<c:forEach var="map" items="${list}">
		<tr>
			<th>답변 작성일</th>
			<td colspan="2">${map.B_QNA_REG_DATE}</td>
		</tr>
		<tr>
			<th>답변 내용</th> 
			<td colspan="2">
				<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX}">
				<textarea rows="20" cols="100" id="B_QNA_CONTENTS" name="B_QNA_CONTENTS" style="height:100px">${map.B_QNA_CONTENTS}</textarea>
			</td>	
		</tr>
		<tr> 
			<td colspan="4" align="center">	
				<input class="btn submit" type="submit" value="수정하기">					
			</td>	
		</tr>
	</c:forEach>
</table>
</form>
</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
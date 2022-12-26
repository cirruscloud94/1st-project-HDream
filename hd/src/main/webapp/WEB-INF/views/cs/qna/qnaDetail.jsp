<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>

<main class="layoutCenter">

<div align="center"><h1>문의사항</h1></div>
<table>
	<colgroup>
		<col width="15%"/>
		<col width="5%"/>
		<col width="15%"/>
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">제목</th>
			<td colspan="3">
				<strong>${map.B_QNA_TITLE }</strong>
			</td>
			<th scope="row">회원ID</th>
			<td>${map.B_QNA_M_ID }</td>
		</tr>
		<tr>
			<th scope="row">작성일</th>
			<td colspan="3">${map.B_QNA_REG_DATE }</td>
			<th scope="row">조회수</th>
			<td>${map.B_QNA_READ_HIT }</td>
		</tr>
		<tr>
			<td colspan="6" style="white-space:pre; height:300px;">${map.B_QNA_CONTENTS }</td>
		</tr>
	</tbody>
</table>
<table>
	<tr>
		<th>답변 작성일</th>
		<td colspan="4">${ map.B_QNA_REPLY_REG_DATE }</td>
	</tr>
	<tr>
		<th>답변 내용</th>
		
	</tr>
</table>

<div align="right">	
<a href="/cs/qnaList" class="btn normal">목록으로</a>
<c:if test="${map.B_QNA_M_ID == m_id }">
<a class="use_move btn warn" href="/cs/qnaDelete" onclick="move(this, 'in', 'B_QNA_IDX')" >
	삭제하기
	<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX }">
</a>
</c:if>
</div>

</main>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>
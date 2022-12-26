<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">	
<div align="center"><h1>문의사항 답글</h1></div>
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
		<td align="center" colspan="4">
			<textarea rows="20" cols="100" id="B_QNA_REPLY_CONTENTS" name="B_QNA_REPLY_CONTENTS" style="height:100px">${map.B_QNA_REPLY_CONTENTS}</textarea>
		</td>
	</tr>
</table>
	<div align="center">
		<a href="/admin/qnaList" class="btn normal">목록으로</a>
		<a class="use_move btn submit" href="/admin/qnaAnswer" onclick="move(this, 'in', 'B_QNA_IDX')">
			저장하기
			<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX }">
		</a>
		<a class="use_move btn warn" href="/admin/qnaAnswerDelete" onclick="move(this, 'in', 'B_QNA_IDX')" >
			삭제하기
			<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX }">
	</a>
</div>


</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">
<div align="center"><h1>리뷰관리</h1></div>
<table>
	<colgroup>	
		<col width="15%"/>
		<col width="5%"/>
		<col width="15%"/>
	</colgroup>
	<tbody>
		<tr>
			<th>카페번호</th>
			<td>
				<strong>${map.V_C_IDX}</strong>
			</td>
			<th>옵션번호</th>
			<td>
				<strong>${map.V_O_IDX}</strong>
			</td>
			<th>리뷰번호</th>
			<td>
				<strong>${map.V_IDX}</strong>
			</td>
			<th>회원ID</th>
			<td>${map.V_WRITER }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td colspan="7">${map.V_REG_DATE }</td>
		</tr>
		<tr>
			<td colspan="8" style="white-space:pre; height:300px;">${map.V_CONTENTS }</td>
		</tr>
	</tbody>
</table>


<div align="center">	
<a href="/admin/reviewList" class="btn normal">목록으로</a>
<a class="use_move btn warn" href="/admin/deleteReview" onclick="move(this, 'in', 'v_idx')" >
	삭제하기
	<input type="hidden" name="v_idx" value="${map.V_IDX }">
</a>
</div>

</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
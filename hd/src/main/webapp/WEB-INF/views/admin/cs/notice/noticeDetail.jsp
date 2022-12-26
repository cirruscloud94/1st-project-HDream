<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">

<div align="center"><h1>공지사항</h1></div>
<br />
<table>
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
	</colgroup>
	<tbody>
		<tr>
		
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td colspan="3">
				<strong>${map.B_INFO_TITLE }</strong>
			</td>
		</tr>
		<tr>
			<th scope="row">작성일</th>
			<td>${map.B_INFO_REG_DATE }</td>
			<th scope="row">조회수</th>
			<td>${map.B_INFO_READ_HIT }</td>
		</tr>
		<tr>
			<td colspan="4" style="white-space:pre; height:500px;">${map.B_INFO_CONTENTS }</td>
		</tr>
	</tbody>
</table>

<div align="center">
<a href="/admin/noticeList" class="btn normal">목록으로</a>
<a class="use_move btn submit" href="/admin/noticeUpdateForm" onclick="move(this, 'in', 'B_INFO_IDX')">
	수정하기
	<input type="hidden" name="B_INFO_IDX" value="${map.B_INFO_IDX }">
</a>
<a class="use_move btn warn" href="/admin/noticeDelete" onclick="move(this, 'in', 'B_INFO_IDX')" >
	삭제하기
	<input type="hidden" name="B_INFO_IDX" value="${map.B_INFO_IDX }">
</a>
</div>

</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">

<div align="center"><h1>공지사항 수정</h1></div>
<form action="/admin/noticeUpdate" method="post">
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td colspan="3">
					${map.B_INFO_IDX }
					<input type="hidden" id="B_INFO_IDX" name="B_INFO_IDX" value="${map.B_INFO_IDX }">
				</td>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">
					<input type="text" id="B_INFO_TITLE" name="B_INFO_TITLE" value="${map.B_INFO_TITLE }" style="width:600px"/>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="4">
					<textarea rows="20" cols="100" id="B_INFO_CONTENTS" name="B_INFO_CONTENTS" style="height:500px">${map.B_INFO_CONTENTS}</textarea>
				</td>
			</tr>
		</tbody>
	</table>
	<div align="center">
		<a href="/admin/noticeList" class="btn normal">목록으로</a>
		<input class="btn submit" type="submit" value="수정하기">
	</div>
</form>
	
</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
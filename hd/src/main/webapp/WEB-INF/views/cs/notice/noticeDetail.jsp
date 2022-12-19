<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">

<table>
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
	</colgroup>
	<tbody>
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
<a href="#this" class="btn submit" id="update">수정하기</a>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("#update").on("click", function(e){ //수정하기 버튼
			e.preventDefault();
			fn_noticeUpdate();
		});
	});
				
	function fn_noticeUpdate(){
		var idx = "${map.B_INFO_IDX}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/noticeUpdate' />");
		comSubmit.addParam("B_INFO_IDX", idx);
		comSubmit.submit();
	}
</script>

</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
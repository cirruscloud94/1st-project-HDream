<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">

<form id="frm">
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>
					${map.B_INFO_IDX }
					<input type="hidden" id="B_INFO_IDX" name="B_INFO_IDX" value="${map.B_INFO_IDX }">
				</td>
				<th scope="row">조회수</th>
				<td>${map.B_INFO_REAG_HIT }</td>
			</tr>
			<tr>
				<th scope="row">작성시간</th>
				<td>${map.B_INFO_REG_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">
					<input type="text" id="B_INFO_TITLE" name="B_INFO_TITLE" class="wdp_90" value="${map.B_INFO_TITLE }"/>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="view_text">
					<textarea rows="20" cols="100" title="내용" id="B_INFO_CONTENTS" name="B_INFO_CONTENTS" style="height:500px">
					${map.B_INFO_CONTENTS }</textarea>
				</td>
			</tr>
		</tbody>
	</table>
</form>
	
<a href="/admin/noticeList" class="btn normal">목록으로</a>
<a href="#this" class="btn" id="update">저장하기</a>
<a href="#this" class="btn" id="delete">삭제하기</a>
	
<script type="text/javascript">
	$(document).ready(function(){
		$("#update").on("click", function(e){ //저장하기 버튼
			e.preventDefault();
			fn_noticeUpdate();
		});
		
		$("#delete").on("click", function(e){ //삭제하기 버튼
			e.preventDefault();
			fn_noticeDelete();
		});
	});
		
	function fn_noticeUpdate(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/noticeUpdate' />");
		comSubmit.submit();
	}
		
	function fn_noticeDelete(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/noticeDelete' />");
		comSubmit.addParam("B_INFO_IDX", $("#B_INFO_IDX").val());
		comSubmit.submit();		
	}
</script>

</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
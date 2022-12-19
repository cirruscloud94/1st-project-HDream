<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">
<div align="center"><h1>공지사항 작성</h1></div>
	<form id="frm" action="/admin/noticeWrite" method="post">
		<table>
			<tbody>
				<tr>
					<td align="center"><strong>제목</strong></td>
				</tr>
				<tr>
					<td align="center">
					<input type="text" name="B_INFO_TITLE" placeholder="제목을 입력하세요"  style="width:600px" />
					</td>
				</tr>
				<tr>
					<td align="center"><strong>내용</strong></td>
				</tr>
				<tr>
					<td align="center">
						<textarea rows="20" cols="100" name="B_INFO_CONTENTS" style="height:500px"></textarea>
					</td>
				</tr>
			</tbody>
		</table> 
		<div align="center">
			<a href="/admin/noticeList" class="btn normal">목록으로</a>
			<input class="btn submit" type="submit" value="작성하기">
		</div>
	</form>
	
<script type="text/javascript">
	$(document).ready(function(){
		$("#write").on("click", function(e) { //작성하기
			e.preventDefault();
			fn_noticeWrite();
		});		
	});
	
	function fn_noticeWrite() { //작성하기
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/cs/notice/noticeWrite' />");
		comSubmit.submit();
	}
</script>

</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
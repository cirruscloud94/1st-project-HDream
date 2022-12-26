<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">	

<div align="center"><h1>FAQ 작성</h1></div>
	<form id="frm" action="/admin/faqWrite" method="post">
		<table>
			<tbody>
				<tr>
					<td align="center"><strong>제목</strong></td>
				</tr>
				<tr>
					<td align="center">
					<input type="text" name="B_FAQ_TITLE" placeholder="제목을 입력하세요"  style="width:600px" />
					</td>
				</tr>
				<tr>
					<td align="center"><strong>내용</strong></td>
				</tr>
				<tr>
					<td align="center">
						<textarea rows="20" cols="100" name="B_FAQ_CONTENTS" style="height:300px"></textarea>
					</td>
				</tr>
			</tbody>
		</table>  
		<div align="center">
			<a href="/admin/faqList" class="btn normal">목록으로</a>
			<input class="btn submit" type="submit" value="작성하기">
		</div>
	</form> 

</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
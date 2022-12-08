<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf" %>


<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
<style>
th, td {
  text-align: center;
}
</style>

<div class="main_wrap">


<h2>업체정보</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="40%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">카페번호</th>
			<th scope="col">카페이름</th>
			<th scope="col">등록날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td>${row.CAFE_IDX }</td>
						<td>${row.CAFE_NAME }</td>
						<td>${row.CAFE_REG_DATE}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</tbody>
</table>

<div id="b_div">
<a href="#this" class="btn" id="caferegbtn">카페등록</a>
</div>
		
</div>
</main>
<script type="text/javascript">

$(function(){
	var aaa = ${fn:length(list) > 0};
	if(aaa){
		document.getElementById("b_div").style.display = "none";
	}else{//조건 1이 아닐떄
        document.getElementById("b_div").style.display = "";
	}
})


$(document).ready(function(){
	$("#caferegbtn").on("click", function(e){	
		e.preventDefault();
		fn_gotoCaferegPage();
	});
	
});


function fn_gotoCaferegPage(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/owner/openCafeWrite'/>");
	comSubmit.submit();
}

	
</script>
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf" %>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
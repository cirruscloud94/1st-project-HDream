<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf" %>

<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>

<div class="main_wrap">



<h2>업체옵션목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="100%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" align="center">옵션번호</th>
			<th scope="col" align="center">옵션명</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td align="center">${row.GOODSREG_IDX }</td>
						<td align="center">${row.GOODSREG_OPTIONNAME }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2" align="center">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</tbody>
</table>

<a href="#this" class="btn" id="goodsregbtn">옵션등록</a>

</div>
</main>
<script type="text/javascript">

$(document).ready(function(){
	$("#goodsregbtn").on("click", function(e){	
		e.preventDefault();
		fn_gotoGoodsregPage();
	});
	
});


function fn_gotoGoodsregPage(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/owner/openGoodsWrite'/>");
	comSubmit.submit();
}

	
</script>
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf" %>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
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
		<c:when test="${list[0].TOTAL_COUNT > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td align="center">${row.GOODSREG_IDX }</td>
						<td align="center" class="goodsreg_optionname"><a href="#this" name="goodsreg_optionname">${row.GOODSREG_OPTIONNAME }</a>
						<input type="hidden" id="GOODSREG_IDX" value="${row.GOODSREG_IDX }">
						</td>
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
<a href="#this" class="btn right margin" id="goodsregbtn" >옵션등록</a>


<c:if test="${!empty paginationInfo}">
						<div class="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
						</div>
					</c:if>


</div>
</main>
<script type="text/javascript">

$(document).ready(function(){
	$("#goodsregbtn").on("click", function(e){	
		e.preventDefault();
		fn_gotoGoodsregPage();
	});
	
	$("a[name='goodsreg_optionname']").on("click", function(e) {
		e.preventDefault();
		fn_openGoodsDetail($(this));
	});
	
});


function fn_gotoGoodsregPage(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/owner/openGoodsWrite'/>");
	comSubmit.submit();
}

function fn_openGoodsDetail(obj){

	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/owner/openGoodsDetail'/>");
	comSubmit.addParam("GOODSREG_IDX", obj.parent().find("#GOODSREG_IDX").val());  //<a>태그의 부모 노드 내에서 GOODSREG_IDX라는 값을 가진 태그를 찾아서 가져와라
	comSubmit.submit();
}

	
</script>
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf" %>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
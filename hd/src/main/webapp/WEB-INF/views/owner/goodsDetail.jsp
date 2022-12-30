<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf" %>
 
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>


<div class="main_wrap">

	<table class="board_view">
		<tbody>
			<tr>
				<th scope="row" style="width: 90px;">옵션 번호</th>
				<td style="width: 250px;">${map.GOODSREG_IDX }</td>	
			</tr>
			<tr>
				<th scope="row">옵션이름</th>
				<td colspan="3">${map.GOODSREG_OPTIONNAME }</td>
			</tr>
			<tr>
				<th scope="row">사용기간</th>
				<td colspan="3">${map.usetime2 }</td>
			</tr>
			<tr>
				<th scope="row">가격</th>
				<td colspan="3">${map.price2 }</td>
			</tr>
			<tr>
				<th scope="row">사용가능인원</th>
				<td colspan="3">${map.people2 }</td>
			</tr>
			<tr>
				<th scope="row" style="vertical-align: middle;">첨부파일</th>
				<td colspan="3">
					<c:forEach var="row" items="${list }">
					<div style="white-space: pre-line;" >
						<input type="hidden" id="CP_IDX" value="${row.CP_IDX }">
						<a href="#this" name="file">${row.CP_ORIGINAL_FILE_NAME }</a>					
							(${row.CP_FILE_SIZE }kb)<br>
					</div>
					</c:forEach>
				
				</td>
			</tr>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>

</div>
</main>	
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf" %>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){  //수정하기
				e.preventDefault();
				fn_openBoardUpdate();
			});
			
			$("a[name='file']").on("click", function(e){  //파일 이름
				e.preventDefault();
				fn_downloadFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/owner/openGoodsList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var goods_idx = "${map.GOODSREG_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/owner/openGoodsUpdate' />");
			comSubmit.addParam("GOODSREG_IDX", goods_idx);
			comSubmit.submit();
		}
		
		function fn_downloadFile(obj){
			var cp_idx = obj.parent().find("#CP_IDX").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/owner/downloadFileFromGoodsreg' />");
			comSubmit.addParam("CP_IDX", cp_idx);
			comSubmit.submit();
		}
		
		
	</script>


<%@ include file="/WEB-INF/include/common-footer.jspf" %>
	
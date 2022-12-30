<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf" %>
 
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>


<div class="main_wrap">
  <form id="frm" name="frm" enctype="multipart/form-data">
	<table class="board_view">
		<tbody>
			<tr>
				<th scope="row" style="width: 90px;">옵션 번호</th>
				<td style="width: 250px;">
				${map.GOODSREG_IDX }
				<input type="hidden" id="GOODSREG_IDX" name="GOODSREG_IDX" value="${map.GOODSREG_IDX }">
				</td>	
			</tr>
			<tr>
				<th scope="row">옵션이름</th>
				<td colspan="3">
				<input type="text" id="GOODSREG_OPTIONNAME" name="GOODSREG_OPTIONNAME" value="${map.GOODSREG_OPTIONNAME }" maxlength="50"/>
				</td>
			</tr>
			<tr>
				<th scope="row">사용기간</th>
				<td>
				<select name="GOODSREG_USETIME">
				<option value="30" ${map.GOODSREG_USETIME == "30" ? "selected" : ""}>30</option>
				<option value="60" ${map.GOODSREG_USETIME == "60" ? "selected" : ""}>60</option>
				<option value="90" ${map.GOODSREG_USETIME == "90" ? "selected" : ""}>90</option>
				<option value="120" ${map.GOODSREG_USETIME == "120" ? "selected" : ""}>120</option>
				<option value="150" ${map.GOODSREG_USETIME == "150" ? "selected" : ""}>150</option>
				<option value="180" ${map.GOODSREG_USETIME == "180" ? "selected" : ""}>180</option>
				</select>
				</td>
				</tr>
			<tr>
				<th scope="row">가격</th>
				<td>
				<input type="text" id="GOODSREG_PRICE" name="GOODSREG_PRICE" style="width: 400px;" value="${map.GOODSREG_PRICE }" placeholder="숫자로 입력해 주세요. ex)10000"></input></td>
				</tr>
				<tr>
					<th scope="row">인원</th>
						<td>
						<select name="GOODSREG_PEOPLE">
						<option value="1" ${map.GOODSREG_PEOPLE == "1" ? "selected" : ""}>1</option>
						<option value="2" ${map.GOODSREG_PEOPLE == "2" ? "selected" : ""}>2</option>
						<option value="3" ${map.GOODSREG_PEOPLE == "3" ? "selected" : ""}>3</option>
						<option value="4" ${map.GOODSREG_PEOPLE == "4" ? "selected" : ""}>4</option>
						<option value="5" ${map.GOODSREG_PEOPLE == "5" ? "selected" : ""}>5</option>
						<option value="6" ${map.GOODSREG_PEOPLE == "6" ? "selected" : ""}>6</option>
						<option value="7" ${map.GOODSREG_PEOPLE == "7" ? "selected" : ""}>7</option>
						<option value="8" ${map.GOODSREG_PEOPLE == "8" ? "selected" : ""}>8</option>
						<option value="9" ${map.GOODSREG_PEOPLE == "9" ? "selected" : ""}>9</option>
						<option value="10" ${map.GOODSREG_PEOPLE == "10" ? "selected" : ""}>10</option>
						</select>
					</td>
					</tr>
<tr>
					<th scope="row" style="vertical-align: middle;">첨부파일</th>
					<td colspan="3">
						<div id="fileDiv" style="white-space: pre-line;">				
							<c:forEach var="row" items="${list }" varStatus="var">
								<p>
									<input type="hidden" id="CP_IDX" name="CP_IDX_${var.index }" value="${row.CP_IDX }">
									<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.CP_ORIGINAL_FILE_NAME }</a>
									<input type="file" id="file_${var.index }" name="file_${var.index }"> 
									(${row.CP_FILE_SIZE }kb)
									<a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a>
								</p>
							</c:forEach>
						</div>
					</td>
				</tr>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>	
</form>
</div>
</main>	
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf" %>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#update").on("click", function(e){  //저장하기 버튼
				e.preventDefault();
				fn_updateGoods();
			});
			
			$("#delete").on("click", function(e){  //삭제하기
				e.preventDefault();
				fn_deleteGoods();
			});
			
			$("a[name^='delete']").on("click", function(e){  //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/owner/openGoodsList' />");
			comSubmit.submit();
		}
		
		function fn_updateGoods(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/owner/updateGoods' />");
			comSubmit.submit();
		}
		
		function fn_deleteGoods(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/owner/deleteGoods' />");
			comSubmit.addParam("GOODSREG_IDX", $("#GOODSREG_IDX").val());
			comSubmit.submit();
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		}
		
		
	</script>


<%@ include file="/WEB-INF/include/common-footer.jspf" %>
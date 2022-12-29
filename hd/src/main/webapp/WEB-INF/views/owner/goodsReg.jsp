<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf"%>

<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
		<form id="frm" name="frm" enctype="multipart/form-data">
			<table class="board_view">
				<colgroup>
					<col width="25%">
					<col width="*" />
				</colgroup>
				<caption>옵션등록</caption>
				<tbody>
					<tr>
						<th scope="row">옵션이름</th>
						<td><input type="text" id="GOODSREG_OPTIONNAME"
							name="GOODSREG_OPTIONNAME" style="width: 400px;" maxlength="50"></input></td>
					</tr>
					<tr>
						<th scope="row">사용기간</th>
						<td><select name="GOODSREG_USETIME">
								<option value="30" selected>30</option>
								<option value="60">60</option>
								<option value="90">90</option>
								<option value="120">120</option>
								<option value="150">150</option>
								<option value="180">180</option>
						</select>
						</td>
					</tr>
					<tr>
						<th scope="row">가격</th>
						<td><input type="text" id="GOODSREG_PRICE"
							name="GOODSREG_PRICE" style="width: 400px;"
							placeholder="숫자로 입력해 주세요. ex)10000"></input></td>
					</tr>
					<tr>
						<th scope="row">인원</th>
						<td><select name="GOODSREG_PEOPLE">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								
						</select></td>
					</tr>
				</tbody>
			</table>
			<input type="file" name="file"> <br />
			<br /> <a href="#this" class="btn" id="write">작성하기</a> <a
				href="#this" class="btn" id="list">목록으로</a>
		</form>
	</div>
</main>
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").on("click", function(e) { //목록으로 버튼
			e.preventDefault();
			fn_openGoodsList();
		});

		$("#write").on("click", function(e) { //작성하기 버튼
			e.preventDefault();
			fn_insertOwnerGoodsRegTable();
		});

	});

	function fn_openGoodsList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/owner/openGoodsList' />");
		comSubmit.submit();
	}

	function fn_insertOwnerGoodsRegTable() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/owner/insertOwnerGoodsRegTable' />");
		comSubmit.submit();
	}
</script>
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf"%>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>
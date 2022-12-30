<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf"%>

<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
		<form id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" id="CAFE_IDX" name="CAFE_IDX"
				value="${map.CAFE_IDX }">
			<table class="board_view">
				<colgroup>
					<col width="200">
					<col width="600" />
				</colgroup>
				<caption>카페정보수정</caption>
				<tbody>
					<tr>
						<th scope="row">카페이름</th>
						<td><input type="text" id="CAFE_NAME" name="CAFE_NAME" value="${map.CAFE_NAME }" style="width: 400px;"  maxlength="70"></input></td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td><input type="text" id="CAFE_TEL" name="CAFE_TEL" value="${map.CAFE_TEL }" style="width: 400px;" placeholder="숫자만 입력해주세요. ex)01012345678"></input></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td><input type="text" id="CAFE_LOCATION" name="CAFE_LOCATION" value="${map.CAFE_LOCATION }" style="width: 400px;"></input></td>
					</tr>
					<tr>
						<th scope="row">이용시작시간</th>
						<td>
						<select name="CAFE_OPENHOUR" id="CAFE_OPENHOUR">
								<option value="0900" ${map.CAFE_OPENHOUR == "0900" ? "selected" : ""}>09:00</option>
								<option value="0930" ${map.CAFE_OPENHOUR == "0930" ? "selected" : ""}>09:30</option>
								<option value="1000" ${map.CAFE_OPENHOUR == "1000" ? "selected" : ""}>10:00</option>
								<option value="1030" ${map.CAFE_OPENHOUR == "1030" ? "selected" : ""}>10:30</option>
								<option value="1100" ${map.CAFE_OPENHOUR == "1100" ? "selected" : ""}>11:00</option>
								<option value="1130" ${map.CAFE_OPENHOUR == "1130" ? "selected" : ""}>11:30</option>
								<option value="1200" ${map.CAFE_OPENHOUR == "1200" ? "selected" : ""}>12:00</option>
								<option value="1230" ${map.CAFE_OPENHOUR == "1230" ? "selected" : ""}>12:30</option>
								<option value="1300" ${map.CAFE_OPENHOUR == "1300" ? "selected" : ""}>13:00</option>
								<option value="1330" ${map.CAFE_OPENHOUR == "1330" ? "selected" : ""}>13:30</option>
								<option value="1400" ${map.CAFE_OPENHOUR == "1400" ? "selected" : ""}>14:00</option>
								<option value="1430" ${map.CAFE_OPENHOUR == "1430" ? "selected" : ""}>14:30</option>
								<option value="1500" ${map.CAFE_OPENHOUR == "1500" ? "selected" : ""}>15:00</option>
								<option value="1530" ${map.CAFE_OPENHOUR == "1530" ? "selected" : ""}>15:30</option> 
								<option value="1600" ${map.CAFE_OPENHOUR == "1600" ? "selected" : ""}>16:00</option>
								<option value="1630" ${map.CAFE_OPENHOUR == "1630" ? "selected" : ""}>16:30</option>
								<option value="1700" ${map.CAFE_OPENHOUR == "1700" ? "selected" : ""}>17:00</option>
								<option value="1730" ${map.CAFE_OPENHOUR == "1730" ? "selected" : ""}>17:30</option>
								<option value="1800" ${map.CAFE_OPENHOUR == "1800" ? "selected" : ""}>18:00</option>
								<option value="1830" ${map.CAFE_OPENHOUR == "1830" ? "selected" : ""}>18:30</option>
								<option value="1900" ${map.CAFE_OPENHOUR == "1900" ? "selected" : ""}>19:00</option>
								<option value="1930" ${map.CAFE_OPENHOUR == "1930" ? "selected" : ""}>19:30</option>
								<option value="2000" ${map.CAFE_OPENHOUR == "2000" ? "selected" : ""}>20:00</option>
						</select>
						</td>
					</tr>
					<tr>
						<th scope="row">이용마감시간</th>
						<td>
						<select name="CAFE_CLOSEHOUR" id="CAFE_CLOSEHOUR">
								<option value="0900" ${map.CAFE_CLOSEHOUR == "0900" ? "selected" : ""}>09:00</option>
								<option value="0930" ${map.CAFE_CLOSEHOUR == "0930" ? "selected" : ""}>09:30</option>
								<option value="1000" ${map.CAFE_CLOSEHOUR == "1000" ? "selected" : ""}>10:00</option>
								<option value="1030" ${map.CAFE_CLOSEHOUR == "1030" ? "selected" : ""}>10:30</option>
								<option value="1100" ${map.CAFE_CLOSEHOUR == "1100" ? "selected" : ""}>11:00</option>
								<option value="1130" ${map.CAFE_CLOSEHOUR == "1130" ? "selected" : ""}>11:30</option>
								<option value="1200" ${map.CAFE_CLOSEHOUR == "1200" ? "selected" : ""}>12:00</option>
								<option value="1230" ${map.CAFE_CLOSEHOUR == "1230" ? "selected" : ""}>12:30</option>
								<option value="1300" ${map.CAFE_CLOSEHOUR == "1300" ? "selected" : ""}>13:00</option>
								<option value="1330" ${map.CAFE_CLOSEHOUR == "1330" ? "selected" : ""}>13:30</option>
								<option value="1400" ${map.CAFE_CLOSEHOUR == "1400" ? "selected" : ""}>14:00</option>
								<option value="1430" ${map.CAFE_CLOSEHOUR == "1430" ? "selected" : ""}>14:30</option>
								<option value="1500" ${map.CAFE_CLOSEHOUR == "1500" ? "selected" : ""}>15:00</option>
								<option value="1530" ${map.CAFE_CLOSEHOUR == "1530" ? "selected" : ""}>15:30</option>
								<option value="1600" ${map.CAFE_CLOSEHOUR == "1600" ? "selected" : ""}>16:00</option>
								<option value="1630" ${map.CAFE_CLOSEHOUR == "1630" ? "selected" : ""}>16:30</option>
								<option value="1700" ${map.CAFE_CLOSEHOUR == "1700" ? "selected" : ""}>17:00</option>
								<option value="1730" ${map.CAFE_CLOSEHOUR == "1730" ? "selected" : ""}>17:30</option>
								<option value="1800" ${map.CAFE_CLOSEHOUR == "1800" ? "selected" : ""}>18:00</option>
								<option value="1830" ${map.CAFE_CLOSEHOUR == "1830" ? "selected" : ""}>18:30</option>
								<option value="1900" ${map.CAFE_CLOSEHOUR == "1900" ? "selected" : ""}>19:00</option>
								<option value="1930" ${map.CAFE_CLOSEHOUR == "1930" ? "selected" : ""}>19:30</option>
								<option value="2000" ${map.CAFE_CLOSEHOUR == "2000" ? "selected" : ""}>20:00</option>
								<option value="2030" ${map.CAFE_CLOSEHOUR == "2030" ? "selected" : ""}>20:30</option>
						</select>
						</td>
					<tr>
						<th scope="row">휴무요일</th>
						<td>
						<select name="CAFE_OFFDAY" id="CAFE_OFFDAY">
								<option value="9" ${map.CAFE_OFFDAY == "9" ? "selected" : ""}>없음</option>
								<option value="0" ${map.CAFE_OFFDAY == "0" ? "selected" : ""}>일</option>
								<option value="1" ${map.CAFE_OFFDAY == "1" ? "selected" : ""}>월</option>
								<option value="2" ${map.CAFE_OFFDAY == "2" ? "selected" : ""}>화</option>
								<option value="3" ${map.CAFE_OFFDAY == "3" ? "selected" : ""}>수</option>
								<option value="4" ${map.CAFE_OFFDAY == "4" ? "selected" : ""}>목</option>
								<option value="5" ${map.CAFE_OFFDAY == "5" ? "selected" : ""}>금</option>
								<option value="6" ${map.CAFE_OFFDAY == "6" ? "selected" : ""}>토</option>
						</select>
						</td>
					</tr>
					<tr>
						<th scope="row">주차여부</th>
						<td>
						<select name="CAFE_PARKING" id="CAFE_PARKING">
								<option value="N" ${map.CAFE_PARKING == "N" ? "selected" : ""}>N</option>
								<option value="Y" ${map.CAFE_PARKING == "Y" ? "selected" : ""}>Y</option>
						</select>
						</td>
					</tr>
					<tr>
						<th scope="row">업주계좌정보</th>
						<td>
						<select name="selectbank">
								<option value="우리" ${map.bankname == "우리" ? "selected" : ""}>우리</option>
								<option value="신한" ${map.bankname == "신한" ? "selected" : ""}>신한</option>
								<option value="농협" ${map.bankname == "농협" ? "selected" : ""}>농협</option>
								<option value="기업" ${map.bankname == "기업" ? "selected" : ""}>기업</option>
								<option value="국민" ${map.bankname == "국민" ? "selected" : ""}>국민</option>
								<option value="우체국" ${map.bankname == "우체국" ? "selected" : ""}>우체국</option>
								<option value="한국시티" ${map.bankname == "한국시티" ? "selected" : ""}>한국시티</option>
								<option value="수헙" ${map.bankname == "수협" ? "selected" : ""}>수협</option>
								<option value="부산" ${map.bankname == "부산" ? "selected" : ""}>부산</option>
								<option value="KEB하나" ${map.bankname == "KEB하나" ? "selected" : ""}>KEB하나</option>
								<option value="KDB산업" ${map.bankname == "KDB산업" ? "selected" : ""}>KDB산업</option>
								<option value="경남" ${map.bankname == "경남" ? "selected" : ""}>경남</option>
						</select> 
						<input type="text" id="bankaccount" name="bankaccount" value="${map.accountnumber }" placeholder="-없이 입력해주세요." style="width: 300px"></input>
						</td>
					</tr>
					<tr>
						<th scope="row">상세정보</th>
						<td class="view_text">
						<textarea rows="5" style="width: 80%; height: auto;" title="내용" id="CAFE_CONTENTS" name="CAFE_CONTENTS">${map.CAFE_CONTENTS }</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">이용/취소안내</th>
						<td class="view_text"><textarea rows="5" style="width: 80%; height: auto;" title="내용" id="CAFE_NOTICE" name="CAFE_NOTICE">${map.CAFE_NOTICE }</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="3">
							<div id="fileDiv" style="white-space: pre-line;">
								<c:forEach var="row" items="${list }" varStatus="var">
									<p>
										<input type="hidden" id="CP_IDX" name="CP_IDX_${var.index }" value="${row.CP_IDX }"> 
										<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.CP_ORIGINAL_FILE_NAME }</a>
										<input type="file" id="file_${var.index }" name="file_${var.index }"> (${row.CP_FILE_SIZE }kb) 
										<a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a>
									</p>
								</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
			</table>


			 <a href="#this" class="btn" id="addFile">파일 추가</a> 
			 <a href="#this" class="btn" id="list">목록으로</a>
			 <a Href="#this" class="btn" id="update">저장하기</a> 
			 <a href="#this" class="btn" id="deleteCafeinfo">삭제하기</a> 


		</form>
	</div>
</main>



<script type="text/javascript">
	var gfv_count = '${fn:length(list)+1}';

	$(document).ready(function() {
		$("#list").on("click", function(e) { //목록으로 버튼
			e.preventDefault();
			fn_openCafeList();
		});

		$("#update").on("click", function(e) { //저장하기 버튼
			e.preventDefault();
			fn_updateCafeinfo();
		});

		$("#deleteCafeinfo").on("click", function(e) { //삭제하기 버튼
			e.preventDefault();
			fn_deleteCafeinfo();
		});

		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e) { //파일추가 삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_openCafeList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/owner/openCafeList' />");
		comSubmit.submit();
	}

	function fn_updateCafeinfo() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/owner/updateCafeinfo' />");
		comSubmit.submit();
	}

	function fn_deleteCafeinfo() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/owner/deleteCafeinfo' />");
		comSubmit.addParam("CAFE_IDX", $("#CAFE_IDX").val());
		comSubmit.submit();
	}

	function fn_addFile(){
		var str = "<p>" +
				"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
				"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
			"</p>";
		$("#fileDiv").append(str);
		$("#delete_"+(gfv_count++)).on("click", function(e){ 
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf"%>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>





















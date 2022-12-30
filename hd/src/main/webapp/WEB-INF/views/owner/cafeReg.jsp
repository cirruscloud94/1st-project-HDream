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
					<col width="200">
					<col width="600" />
				</colgroup>
				<caption>카페등록</caption>
				<tbody>
					<tr>
						<th scope="row">카페이름</th>
						<td><input type="text" id="CAFE_NAME" name="CAFE_NAME" style="width: 400px;" maxlength="70"></input></td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td><input type="text" id="CAFE_TEL" name="CAFE_TEL" style="width: 400px;" placeholder="숫자만 입력해주세요. ex)01012345678"></input></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td><input type="text" id="CAFE_LOCATION" name="CAFE_LOCATION" style="width: 400px;"></input></td>
					</tr>
					<tr>
						<th scope="row">이용시작시간</th>
						<td>
							<select name="CAFE_OPENHOUR" id="CAFE_OPENHOUR">
								<option value="0900" selected>09:00</option>
								<option value="0930">09:30</option>
								<option value="1000">10:00</option>
								<option value="1030">10:30</option>
								<option value="1100">11:00</option>
								<option value="1130">11:30</option>
								<option value="1200">12:00</option>
								<option value="1230">12:30</option>
								<option value="1300">13:00</option>
								<option value="1330">13:30</option>
								<option value="1400">14:00</option>
								<option value="1430">14:30</option>
								<option value="1500">15:00</option>
								<option value="1530">15:30</option>
								<option value="1600">16:00</option>
								<option value="1630">16:30</option>
								<option value="1700">17:00</option>
								<option value="1730">17:30</option>
								<option value="1800">18:00</option>
								<option value="1830">18:30</option>
								<option value="1900">19:00</option>
								<option value="1930">19:30</option>
								<option value="2000">20:00</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">이용마감시간</th>
						<td>
							<select name="CAFE_CLOSEHOUR">
								<option value="0900"  selected>09:00</option>
								<option value="0930">09:30</option>
								<option value="1000">10:00</option>
								<option value="1030">10:30</option>
								<option value="1100">11:00</option>
								<option value="1130">11:30</option>
								<option value="1200">12:00</option>
								<option value="1230">12:30</option>
								<option value="1300">13:00</option>
								<option value="1330">13:30</option>
								<option value="1400">14:00</option>
								<option value="1430">14:30</option>
								<option value="1500">15:00</option>
								<option value="1530">15:30</option>
								<option value="1600">16:00</option>
								<option value="1630">16:30</option>
								<option value="1700">17:00</option>
								<option value="1730">17:30</option>
								<option value="1800">18:00</option>
								<option value="1830">18:30</option>
								<option value="1900">19:00</option>
								<option value="1930">19:30</option>
								<option value="2000">20:00</option>
								<option value="2030">20:30</option>
							</select>
						</td>
						<tr>
						<th scope="row">휴무요일</th>
						<td><select name="CAFE_OFFDAY">
								<option value="9" selected>없음</option>
								<option value="0">일</option>
								<option value="1">월</option>
								<option value="2">화</option>
								<option value="3">수</option>
								<option value="4">목</option>
								<option value="5">금</option>
								<option value="6">토</option>
						</select></td>
					</tr>
					<tr>
						<th scope="row">주차여부</th>
						<td>
							<select name="CAFE_PARKING">
								<option value="N">N</option>
								<option value="Y">Y</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">업주계좌정보</th>
						<td>
							<select name="selectbank">
								<option value="우리" selected>우리</option>
								<option value="신한">신한</option>
								<option value="농협">농협</option>
								<option value="기업">기업</option>
								<option value="국민">국민</option>
								<option value="우체국">우체국</option>
								<option value="한국시티">한국시티</option>
								<option value="수헙">수협</option>
								<option value="부산">부산</option>
								<option value="KEB하나">KEB하나</option>
								<option value="KDB산업">KDB산업</option>
								<option value="경남">경남</option>
							</select> 
							<input type="text" id="bankaccount" name="bankaccount" placeholder="-없이 입력해주세요." style="width: 300px"></input>
						</td>
					</tr>
					<tr>
						<th scope="row">상세정보</th>
						<td class="view_text"><textarea rows="5" style="width: 80%; height: auto;" title="내용" id="CAFE_CONTENTS" name="CAFE_CONTENTS"></textarea></td>
					</tr>
					<tr>
						<th scope="row">이용/취소안내</th>
						<td class="view_text"><textarea rows="5" style="width: 80%; height: auto;" title="내용" id="CAFE_NOTICE" name="CAFE_NOTICE"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div id="fileDiv">
				<p>
					<input type="file" id="file" name="file_0"> <a href="#this" class="btn" id="delete" name="delete">삭제</a>
				</p>
			</div>

			<br />
			<br />
			<a href="#this" class="btn" id="addFile">파일 추가</a>
			<a href="#this" class="btn" id="write">작성하기</a>
			<a href="#this" class="btn" id="list">목록으로</a>
		</form>
	</div>
</main>
<script type="text/javascript">
	var gfv_count = 1;

	$(document).ready(function() {
		$("#list").on("click", function(e) { //목록으로 버튼
			e.preventDefault();
			fn_openCafeList();
		});

		$("#write").on("click", function(e) { //작성하기 버튼
			e.preventDefault();
			fn_insertCafeinfoTable();
		});

		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});

	});

	function fn_openCafeList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/owner/openCafeList' />");
		comSubmit.submit();
	}

	function fn_insertCafeinfoTable() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/owner/insertCafeinfoTable' />");
		comSubmit.submit();
	}

	function fn_addFile() {
		var str = "<p><input type='file' name='file_" + (gfv_count++)
				+ "'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str);  //<<div id="fileDiv">에 변수 str의 값을 추가
		$("a[name='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove(); //this의 바로 위의 요소(<p>태그)를 삭제
	}
</script>
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf"%>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>
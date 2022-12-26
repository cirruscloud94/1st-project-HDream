<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<!-- 마이페이지에 해당하는 페이지라면 nav 삽입이 필요합니다. -->
	<div class="txt_center">
	<table>

		<thead>
			<tr>
				<th scope="col">카페번호</th>
				<th scope="col">카페이름</th>
				<th scope="col">카페주소</th>
				<th scope="col">오픈시간</th>
				<th scope="col">마감시간</th>
				<th scope="col">전화번호</th>
				<th scope="col">메인이미지</th>
				<th scope="col">사진번호</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty map }">
					<input type="hidden" id="CAFE_IDX" value="${map.CAFE_IDX}">
					<tr class="txt_center">
					<tr>
						<td>${map.CAFE_IDX}</td>
						<td>${map.CAFE_NAME }</td>
						<td>${map.CAFE_LOCATION}</td>
						<td>${map.CAFE_OPENHOUR}</td>
						<td>${map.CAFE_CLOSEHOUR}</td>
						<td>${map.CAFE_TEL}</td>
						<td>${map.CP_STORED_FILE_NAME}</td>
						<td>${map.CP_IDX}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="11">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>

			</c:choose>
		</tbody>


	</table>
	<fieldset class="tab_radio">
		<input type="radio" id="option" name="tab" value="option" checked>
		<label for="option">option</label> <input type="radio" id="contents"
			name="tab" value="contents" checked> <label for="contents">contents</label>
	</fieldset>

<div class="use_move" onclick="move(this,'in','GOODSREG_IDX');" href="/reserv/${ GOODSREG_IDX }">
	<table class="option">


		<thead>
			<tr>

				<th scope="col">카페번호</th>
				<th scope="col">옵션번호</th>
				<th scope="col">옵션이름</th>
				<th scope="col">가격</th>
				<th scope="col">사용시간</th>
				<th scope="col">인원</th>
				<th scope="col">이미지</th>

			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty list }">
					<c:forEach items="${list}" var="i">
						<input type="hidden" id="CAFE_IDX" value="${map.CAFE_IDX}">
						<tr class="txt_center">
						<tr>     
               
							<td>${i.GOODSREG_CAFE_IDX}</td>
							<td>${i.GOODSREG_IDX }</td>
							<td>${i.GOODSREG_OPTIONNAME}</td>
							<td>${i.GOODSREG_PRICE}</td>
							<td>${i.GOODSREG_USETIME}</td>
							<td>${i.GOODSREG_PEOPLE}</td>
							<td>${i.CP_STORED_FILE_NAME}</td>
						</tr>

					</c:forEach>
				</c:when>

			</c:choose>


		</tbody>

	</table>
	<input type="hidden" name="GOODSREG_IDX" value="${GOODSREG_IDX }">  
</div>
	<table class="contents">
		<tr>
			<th scope="col">카페번호</th>
			<th scope="col">카페이름</th>
			<th scope="col">상세정보</th>
			<th scope="col">전화번호</th>
			<th scope="col">주소</th>
			<th scope="col">이용시작시간</th>
			<th scope="col">이용마감시간</th>
			<th scope="col">주차여부</th>
			<th scope="col">이용/취소안내</th>
			<th scope="col">업주계좌정보</th>

		</tr>

		<c:choose>
			<c:when test="${!empty con }">
				<input type="hidden" id="CAFE_IDX" value="${map.CAFE_IDX}">
				<tr class="txt_center">
				
				<tr>
					<td>${con.CAFE_IDX}</td>
					<td>${con.CAFE_NAME }</td>
					<td>${con.CAFE_CONTENTS}</td>
					<td>${con.CAFE_TEL}</td>
					<td>${con.CAFE_LOCATION}</td>
					<td>${con.CAFE_OPENHOUR}</td>
					<td>${con.CAFE_CLOSEHOUR}</td>
					<td>${con.CAFE_PARKING}</td>
					<td>${con.CAFE_NOTICE}</td>
					<td>${con.CAFE_ACCOUNTINFO}</td>

				</tr>
			</c:when>



		</c:choose>



	</table></div>

<script type="text/javascript">
	$(document).ready(function() {
		// 라디오 클릭에 따라 상세보기 변경

		$(".tab_radio label").on("click", function() {
			if ($(this).text() == 'option') {
				$(".option").show();
				$(".contents").hide();
			}
			if ($(this).text() == 'contents') {
				$(".option").hide();
				$(".contents").show();
			}
		});
	});
</script>



							<!-- //컨텐츠 종료 -->

						</main>
<!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<style>
	main{ padding: 70px 0; }
	table tbody tr th{ background-color: var(--subGray_10); }
	table tbody tr th + td{ padding-left: 10px; }
	/* 카페 대표 정보 */
	.cafe_info_wrap{ margin-bottom: 70px; }
	.cafe_info_wrap .img_wrap{ width: 450px; height: 450px; margin-right: 50px; overflow: hidden; }
	.cafe_info_wrap .img_wrap img{ width: 100%; }
	.cafe_info_wrap table{ width: calc(100% - 500px); }
	.cafe_info_wrap table tr th,
	.cafe_info_wrap table tr td{ vertical-align: middle; }
	
	.content_wrap .option img{ width: 100%; }
</style>
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<div class="cafe_info_wrap flex">
		<c:choose>
			<c:when test="${!empty map}">
				<div class="img_wrap">
					<!-- 카페 이미지는 여러개 등록 가능 -->
					<c:choose>
						<c:when test="${!empty map.CP_STORED_FILE_NAME}">
							<c:forEach items="${map.CP_STORED_FILE_NAME}" var="imgfile">
								<img src="/resources/upload/${imgfile}" alt="카페 이미지">
							</c:forEach>
						</c:when>
						<c:otherwise><img src="/resources/image/placeholder_img.jpg" alt="이미지 준비중"></c:otherwise>
					</c:choose>
				</div>
				<table>
					<colgroup>
						<col width="120px">
					</colgroup>
					<tbody>
						<tr><th scope="col">카페명</th><td>${map.CAFE_NAME}<input type="hidden" id="CAFE_IDX" value="${map.CAFE_IDX}"></td></tr>
						<tr><th scope="col">카페주소</th><td>${map.CAFE_LOCATION}</td></tr>
						<tr><th scope="col">영업시간</th><td>${map.CAFE_OPENHOUR} ~ ${map.CAFE_CLOSEHOUR}</td></tr>
						<tr><th scope="col">전화번호</th><td><a href="tel:${map.CAFE_TEL}">${map.CAFE_TEL}</a></td></tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div class="img_wrap"><img src="/resources/image/placeholder_img.jpg" alt="이미지 준비중"></div>
				<table>
					<tbody>
						<tr class="txt_center">
							<td>조회된 결과가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- 선택 탭 -->
	<fieldset class="tab_radio content_select_radio">
		<input type="radio" id="option" name="tab" value="option" checked>
		<label for="option">가격/예약</label>
		<input type="radio" id="cafe_detail_info" name="tab" value="cafe_detail_info">
		<label for="cafe_detail_info">카페 정보</label>
		<input type="radio" id="review" name="tab" value="review">
		<label for="review">리뷰</label>
	</fieldset>

	<!-- 선택 탭에 따른 내용 출력 -->
	<div class="content_wrap">
		<!-- 옵션/가격 테이블 -->
		<table class="option">
			<thead>
				<tr>
					<th width="80px">옵션번호</th>
					<th width="150px">이미지</th>
					<th width="auto">옵션이름</th>
					<th width="150px">가격</th>
					<th width="120px">사용시간</th>
					<th width="120px">인원</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty list}">
						<c:forEach items="${list}" var="i">
							<tr class="txt_center" onclick="move(this,'in','GOODSREG_IDX');" data-href="/user/reserv">
								<td>${i.GOODSREG_IDX}<input type="hidden" name="GOODSREG_IDX" value="${i.GOODSREG_IDX}"></td>
								<td><img src="/resources/upload/${i.CP_STORED_FILE_NAME}" alt="카페 방 이미지"></td>
								<td>${i.GOODSREG_OPTIONNAME}</td>
								<td>${i.GOODSREG_PRICE}</td>
								<td>${i.GOODSREG_USETIME}</td>
								<td>${i.GOODSREG_PEOPLE}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="txt_center">
							<td colspan="6">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<!-- 카페 정보 테이블 -->
		<table class="cafe_detail_info">
			<colgroup>
				<col width="30%">
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${!empty con}">
						<tr scope="col"><th>카페이름</th><td>${con.CAFE_NAME}</td></tr>
						<tr scope="col"><th>상세정보</th><td>${con.CAFE_CONTENTS}</td></tr>
						<tr scope="col"><th>전화번호</th><td>${con.CAFE_TEL}</td></tr>
						<tr scope="col"><th>주소</th><td>${con.CAFE_LOCATION}</td></tr>
						<tr scope="col"><th>이용시작시간</th><td>${con.CAFE_OPENHOUR}</td></tr>
						<tr scope="col"><th>이용마감시간</th><td>${con.CAFE_CLOSEHOUR}</td></tr>
						<tr scope="col"><th>주차여부</th><td>${con.CAFE_PARKING}</td></tr>
						<tr scope="col"><th>이용/취소안내</th><td>${con.CAFE_NOTICE}</td></tr>
						<tr scope="col"><th>업주계좌정보</th><td>${con.CAFE_ACCOUNTINFO}</td></tr>
					</c:when>
					<c:otherwise>
						<tr class="txt_center">
							<td colspan="9">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<!-- 리뷰 테이블 -->
		<table class="review">
			<thead>
				<tr>
					<th width="80px">리뷰번호</th>
					<th width="150px">상품정보</th>
					<th width="auto">리뷰 내용</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty review}">
						<c:forEach items="${review}" var="r">
							<tr class="txt_center">
								<td>${r.V_IDX}</td>
								<td>
									<!-- 상품 사진과 이름 출력 -->
									<img src="/resources/upload/${r.CP_ORIGINAL_FILE_NAME}" alt="상품 이미지"><br>
									${r.GOODSREG_OPTIONNAME}
								</td>
								<td>
									<!-- 작성자명, 작성일자 출력 -->
									<p class="review_info">${r.V_WRITER}&nbsp;&nbsp;|&nbsp;&nbsp;${r.V_REG_DATE}</p>
									<!-- 평점 출력 -->
									<p class="review_star"><c:forEach begin="1" end="${r.V_STAR}">★</c:forEach></p>
									<!-- 리뷰내용 출력 -->
									<p class="review_txt">${r.V_CONTENTS}</p>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="txt_center">
							<td colspan="3">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function () {
			//처음 DOM 로딩 시 첫번째 상세보기 내용만 보이도록 처리
			contents.hide();//모든 내용 숨기기
			contents.filter(":first-child").show();//첫번째만 보이기
			
			show_contents();//라디오 클릭에 따른 보이기
		});
		//라디오 클릭에 따라 상세보기 변경 함수
		let contents = $(".content_wrap").children();//상세보기 내용들
		function show_contents(){
			if(contents.length <= 1) return false;//상세보기 내용이 없다면 함수 종료
			$(".tab_radio label").on("click", function () {//라디오의 라벨 클릭 시
				contents.hide();//모든 내용 숨기기
				//클릭한 라벨의 for 속성값과 동일한 클래스명의 상세보기 내용만 보이게 처리
				contents.filter("."+$(this).attr("for")).show();
			});
		}
	</script>
	<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
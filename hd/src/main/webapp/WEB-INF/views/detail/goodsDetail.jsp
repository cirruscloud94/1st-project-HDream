<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<style>
	main{ padding: 70px 0; }
	table tbody tr th{ background-color: var(--subGray_10); }
	table tbody tr th + td{ padding-left: 10px; }
	/* 카페 대표 정보 */
	.cafe_info_wrap{ margin-bottom: 50px; }
	.cafe_info_wrap .img_wrap{ width: 500px; height: 450px; margin-right: 50px; margin-left: 30px; overflow: hidden; position:relative; }
	.cafe_info_wrap .img_wrap .main_img { width: 1200px; height:450px; position:absolute; float:left; transition: left 0.5s;}
	.cafe_info_wrap > .img_wrap .main_img li:first-child{ margin-left :50px;}
	.cafe_info_wrap > .img_wrap .main_img li:not(:last-child){float:left; margin-right :50px; float:left;} 
	.cafe_info_wrap > .img_wrap .main_img li img{ width:450px; height:450px;}
	.cafe_info_wrap .control_button > a.prev {position: absolute; left:-50px; top:550px;}
	.cafe_info_wrap .control_button > a.next {position: absolute; right:-50px; top:550px;}
	.cafe_info_wrap .control_button{ margin-top: 550px; width:100px;height:30px; align:right;}
	.cafe_info_wrap .cafe_goodsinfo_wrap{margin-right:50px;}
	.cafe_info_wrap .cafe_goodsinfo_wrap table{ width:550px; heigth:450px; margin-left:30px; margin-right:15px; align:left;}
	.cafe_info_wrap table{ width: calc(100% - 500px); }
	.cafe_info_wrap table tr th,
	.cafe_info_wrap table tr td{ vertical-align: middle; }
	
	.content_wrap .option img{ width: 100%; }
</style>
<script>
	function zzim1() {
		alert("카페가 찜 되었어요!");
		return true;
	}
	
	function zzim2() {
		alert("카페 찜이 삭제되었어요!");
		return true;
	}
</script>
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->

	<div class="cafe_info_wrap flex">
				<div class="img_wrap">
					<!-- 카페 이미지는 여러개 등록 가능 -->
					<ul class="main_img">
					<c:choose>
						<c:when test="${!empty mimg}">
							<c:forEach items="${mimg}" var="imgfile" varStatus="status">
							 
								<li><span><img src="/resources/upload/${imgfile.CP_STORED_FILE_NAME}" alt="카페 이미지"
								id="${status.count}">
								</span></li>
							 
							</c:forEach>
						</c:when>
						<c:otherwise><img src="/resources/image/placeholder_img.jpg" alt="이미지 준비중"></c:otherwise>
					</c:choose>
					</ul>
				</div>
				
				<!-- 카페간략정보출력 -->
				
				<div class="cafe_goodsinfo_wrap flex">
				<c:choose>
				<c:when test="${!empty map}">
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
</div>


			
	<div class="flexBetween">
			<div class="control_button flex">
				<span class="prev">이전</span>
				<br/><br/>
				<span class="next">다음</span>
			  
			</div>
		
		<!-- 로그인을 했다면 찜표시 -->
		<% if (session.getAttribute("m_id") != null) {%>
            <c:if test="${!empty zzim}"><!-- 이미 찜한 아이라면 -->
                <form action="/com/detail/deleteZzim/${con.CAFE_IDX}" method="post" onClick="return zzim2();">
                        <input type="hidden" name="cafe_idx" value="${con.CAFE_IDX}">
                        <button type="submit" class="btn"><i class="fa-solid fa-heart"></i></button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;

                </form>
            </c:if>
            <c:if test="${empty zzim}"><!-- 안 찜한 아이라면 -->
                <form action="/com/detail/insertZzim/${con.CAFE_IDX}" method="post" onClick="return zzim1();">
                        <input type="hidden" name="cafe_idx" value="${con.CAFE_IDX}">
                        <button type="submit" class="btn"><i class="fa-regular fa-heart"></i></button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </form>
            </c:if>
        <%
        } 
        %>

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
	
<%-- <div class="zzim flex" id="zzim">

	<div class="zimbutton">
		<div class="heart">
			<c:set target="${m_id}" var="m_id" />
				<form class="heartzzim" action="/setZzim" method="post">
					<input type="hidden" id="zimgoodsreg" name="zim_goodsReg_Idx" value="${gzim.ZIM_GOODSREG_IDX}">
					<input type="hidden" id="zimmid" name="zim_m_id" value="${gzim.ZIM_M_ID}">
					<input type="hidden" id="zimidx" name="zim_idx"value="${gzim.ZIM_IDX}">
					<input type="hidden" id="zimregdate" name="zim_reg_date" value="${gzim.ZIM_REG_DATE}">
					
					<button id="heartbutton" onclick="zlogincheck()">
						<i class="fa-regular fa-heart">
						</i>
					</button>
				</form>
		</div>
		
		<div class="heartcancel">
			<form class="heartbreak" action="/delZzim" method="post" >
				<input type="hidden" id="zimgoodsreg" name="zim_goodsReg_Idx" value="${gzim.ZIM_GOODSREG_IDX}">
					<input type="hidden" id="zimmid" name="zim_m_id" value="${gzim.ZIM_M_ID}">
					<input type="hidden" id="zimidx" name="zim_idx"value="${gzim.ZIM_IDX}">
					<input type="hidden" id="zimregdate" name="zim_reg_date" value="${gzim.ZIM_REG_DATE}">
				
				<button id="heartcanbutton" onclick="zimcancel()">
					<i class="fa-solid fa-xmark">
					</i>
				</button>
			</form>		
		</div>
	</div>
</div> --%>
	
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
<script src="/resources/js/mainImg.js"></script>
<script src="/resources/js/zim_click.js"></script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
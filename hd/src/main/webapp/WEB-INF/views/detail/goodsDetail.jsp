<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<article>
	<section class="img_wrap">
		<div class="main_img">
		<!-- 카페 이미지는 여러개 등록 가능 -->
			<ul class="slides">
				<c:choose>
				<c:when test="${!empty mimg}">
				<c:forEach items="${mimg}" var="imgfile" varStatus="status">
				
				<li id="mainImage">
					<img src="/resources/upload/${imgfile.CP_STORED_FILE_NAME}" alt="카페 이미지"
					id="${status.count}">
				</li>
				</c:forEach>
				</c:when>
				<c:otherwise><img src="/resources/image/placeholder_img.jpg" alt="이미지 준비중"></c:otherwise>
				</c:choose>
			</ul>
			<input type="hidden" id="CAFE_IDX" value="${map.CAFE_IDX}">
		</div>
		<p class="controller">
	      <!-- &lang: 왼쪽 방향 화살표
	      &rang: 오른쪽 방향 화살표 -->
	      <span class="prev">&lang;</span>  
	      <span class="next">&rang;</span>
	    </p>
	</section>
	<section>
	<br/>
	<h2 class="txt_center">${map.CAFE_NAME}</h2>
		<!-- 로그인을 했다면 찜표시 -->
		<div class="txt_center">
			<span>
			<c:forEach begin="1" end="${((avgSP*10)-(avgSP*10%10))/10}">⭐</c:forEach>
			&nbsp;&nbsp;${starPoint}&nbsp;&nbsp;
			<c:if test="${! empty m_id}">
	        	<c:if test="${!empty zzim}"><!-- 이미 찜한 아이라면 -->
		            <form action="/com/detail/deleteZzim/${con.CAFE_IDX}" method="post">
		            	<input type="hidden" name="cafe_idx" value="${con.CAFE_IDX}">
		            	<input type="hidden" name="starPoint" value="${starPoint}">
		            	<input type="hidden" name="avgSP" value="${avgSP}">
		               	<button type="submit" id="zzim" class="fa-solid fa-heart" onClick="return zzim2();"></button>
		            </form>
		        </c:if>
		        
		        <c:if test="${empty zzim}"><!-- 안 찜한 아이라면 -->
		            <form action="/com/detail/insertZzim/${con.CAFE_IDX}" method="post">
	                   	<input type="hidden" name="cafe_idx" value="${con.CAFE_IDX}">
		            	<input type="hidden" name="starPoint" value="${starPoint}">
		            	<input type="hidden" name="avgSP" value="${avgSP}">
	                    <button type="submit" class="fa-regular fa-heart" onClick="return zzim1();"></button>
		            </form>
		        </c:if>
	        </c:if>
			</span>
        </div>
	</section>
	<br/>
	<!-- 카페간략정보출력 -->
	<section class="cafe_goodsinfo_wrap flex">
		<c:choose>
		<c:when test="${!empty map}">
		<table>
			<colgroup>
				<col width="30%">
			</colgroup>
			<tbody>
				<tr>
					<td>사업장주소</td>
					<td>${map.CAFE_LOCATION}</td>
				</tr>
				<tr>
					<td>영업시간</td>
					<td>
					${fn:substring(map.CAFE_OPENHOUR,0,2)}:${fn:substring(map.CAFE_OPENHOUR,2,4)}
					~ ${fn:substring(map.CAFE_CLOSEHOUR,0,2)}:${fn:substring(map.CAFE_CLOSEHOUR,2,4)}
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><a href="tel:${map.CAFE_TEL}">${map.CAFE_TEL}</a></td>
				</tr>
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
	</section>
	<br/>
	<section>
	<!-- 선택 탭 -->
	<fieldset class="tab_radio content_select_radio">
		<input type="radio" id="option" name="tab" value="option" checked>
		<label for="option">예약</label>
		<input type="radio" id="cafe_detail_info" name="tab" value="cafe_detail_info">
		<label for="cafe_detail_info">정보</label>
		<input type="radio" id="review" name="tab" value="review">
		<label for="review">리뷰</label>
	</fieldset>

	<!-- 선택 탭에 따른 내용 출력 -->
	<div class="content_wrap">
		<!-- 옵션/가격 테이블 -->
		<table class="option">
			<colgroup>
				<col width="200pt">
			</colgroup>
			<tbody id="reservation">
				<c:choose>
					<c:when test="${!empty list}">
						<c:forEach items="${list}" var="i">
							<tr class="txt_center" onclick="move(this,'in','GOODSREG_IDX', 'GOODSREG_USETIME');" data-href="/user/reserv">
								
								<td id="sumnail"><img src="/resources/upload/${i.CP_STORED_FILE_NAME}" alt="카페 방 이미지"></td>
								<td>${i.GOODSREG_OPTIONNAME}<br/>${i.GOODSREG_PRICE}원
								<!-- 옵션번호  -->
								<input type="hidden" name="GOODSREG_IDX" value="${i.GOODSREG_IDX}">
								<input type="hidden" name="GOODSREG_USETIME" value="${i.GOODSREG_USETIME}">
								</td>
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
				<col width="200pt">
			</colgroup>
			<tbody>
				<c:choose>
				<c:when test="${!empty con}">
					<tr>
						<th>상호명</th>
						<td>${con.CAFE_NAME}</td>
					</tr>
					<tr>
						<th>상세정보</th>
						<td class="feed-longContents">
							<span class="longContents">
							${con.CAFE_CONTENTS}
							</span>
							<a href="javascript:void(0);" class="btn-more"><i class="fa-solid fa-angle-down"></i></a>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${con.CAFE_TEL}</td>
					</tr>
					<tr>
						<th>사업장주소</th>
						<td>${con.CAFE_LOCATION}</td>
					</tr>
					<tr>
						<th>오픈시간</th>
						<td>${fn:substring(map.CAFE_OPENHOUR,0,2)}:${fn:substring(map.CAFE_OPENHOUR,2,4)}</td>
					</tr>
					<tr>
						<th>마감시간</th>
						<td>${fn:substring(map.CAFE_CLOSEHOUR,0,2)}:${fn:substring(map.CAFE_CLOSEHOUR,2,4)}</td>
					</tr>
					<tr>
						<th>주차여부</th>
						<td>${con.CAFE_PARKING}</td>
					</tr>
					<tr>
						<th>취소안내</th>
						<td>${con.CAFE_NOTICE}</td>
					</tr>
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
			<tbody>
				<c:choose>
				<c:when test="${review[0].TOTAL_COUNT != 0}">
				<c:forEach items="${review}" var="r">
					<tr class="txt_left">
						<td class="rvSum">
							<!-- 작성자명 -->
							<p class="txt_big">${r.V_WRITER}</p>
							<!-- 평점, 작성일 -->
							<span>
							<c:forEach begin="1" end="${r.V_STAR}">⭐</c:forEach>
							<span class="SP"></span>
							<input type="hidden" class="v_reg_date" value="${r.V_REG_DATE}">
							<input type="hidden" class="RV" value="${rvCount.RVC}">
							</span>
							<!-- 상품 사진 -->
							<img src="/resources/upload/${r.CP_STORED_FILE_NAME}" alt="상품 이미지">
							<br/>
							<!-- 리뷰내용 -->
							<p class="review_txt">${r.V_CONTENTS}</p>
							<br/>
							<!-- 옵션명 -->
							<span class="txt_center bgSubColor">${r.GOODSREG_OPTIONNAME}</span>
						</td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr class="txt_center empty">
						<td>조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>
			</tbody>
			<c:if test="${!empty review_paginationInfo}">
				<tfoot>
					<tr>
						<td class="paging">
							<ui:pagination paginationInfo="${review_paginationInfo}" type="text" jsFunction="paging" />
						</td>
					</tr>
				</tfoot>
			</c:if>
		</table>
	</div>
	</section>
</article>
</main>

<script src="/resources/js/goodsDetail.js"></script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
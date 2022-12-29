<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css"/>
<script src="/resources/js/main.js"></script>
<section class="main_banner flexCenter">
	<article>
		<h1>GRAND OPEN</h1>
		<p class="date">${date}</p>
		<p>언제나 고객님들이 숙면하실 수 있도록 편안한 공간을 제공하겠습니다.</p>
	</article>
</section>
<c:if test="${fn:length(notice_list) > 0}">
	<section class="notice_oneline">
		<div class="layoutCenter flexBetween">
			<span class="notice bgColor">공지사항</span>
			<div class="notice_list">
				<ul>
					<c:forEach var="notice" items="${notice_list}">
						<li>
							<a class="use_move" href="/cs/noticeDetail" onclick="move(this, 'in', 'B_INFO_IDX')">
								${notice.B_INFO_TITLE}
								<input type="hidden" id="B_INFO_IDX" name="B_INFO_IDX" value="${notice.B_INFO_IDX}">
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
</c:if>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<div class="title_wrap flexBetween flexWrap">
		<h2 class="title">${(!empty search_keyword)? "[ "+=search_keyword+=" ] 검색 결과" :"추천 카페"}</h2>
		<div class="order ${!empty order?order:'recommend'}">
			<label class="rec"><input type="hidden" name="order" value="recommend">추천순</label>
			<label class="name"><input type="hidden" name="order" value="name">이름순</label>
			<label class="rev"><input type="hidden" name="order" value="review">평점순</label>
			<label class="pri"><input type="hidden" name="order" value="price">가격순</label>
		</div>
	</div>
	<c:choose>
		<c:when test="${prd_list[0].TOTAL_COUNT == 0}">
			<div class="empty">조회된 결과가 없습니다.</div>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${print == 'map'}"><!-- 지도검색 시 -->
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						<div id="menu_wrap" class="bg_white">
							<div class="option"></div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7562ba3644969cf74e34b4f8503b08a7&libraries=services"></script>
				</c:when>
				<c:otherwise><!-- 일반검색 시 -->
					<table class="prd_list card_table">
						<c:forEach items="${prd_list}" var="prd">
							<tr id="prd_${prd.CAFE_IDX}"
								class="use_move" onclick="move(this,'in','cafe_idx','starPoint', 'avgSP');" data-href="/com/detail/selectGoodsInfo/${prd.CAFE_IDX}"
								data-offday="${prd.OFF}" data-open="${prd.OPEN}" data-close="${prd.CLOSE}">
								<td class="img_wrap">
									<!-- 카페 이미지, 리뷰 수, 평균 평점 -->
									<img width="auto" height="265" src="/resources/upload/${prd.FILENAME}" alt="카페 이미지">
									<span class="review">${(prd.R_STAR>0)?prd.R_STAR:0} (${(prd.R_COUNT>0)?prd.R_COUNT:0})</span>
								</td>
								<td class="cafe_name">
									${prd.CAFE_NAME}
									<input type="hidden" id="cafe_idx" name="cafe_idx" value="${prd.CAFE_IDX}">
									<input type="hidden" name="starPoint" value="${(prd.R_STAR>0)?prd.R_STAR:0}(${(prd.R_COUNT>0)?prd.R_COUNT:0})">
									<input type="hidden" name="avgSP" value="${(prd.R_STAR>0)?prd.R_STAR:0}">
								</td>
								<td class="loc">${prd.LOC}</td>
								<td class="option">
									<p class="flexBetween">
										<span>${prd.OP_NAME}</span>
										<span class="price color"><fmt:formatNumber value="${prd.OP_PRICE}" pattern="#,###"/>원</span>
									</p>
								</td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${!empty paginationInfo}">
						<div class="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
			<ul class="print_type_btn">
				<li>
					<a class="use_move ${(print == 'map')?'':'on'}" href="/main" onclick="move(this,'in','print');">
						<span>목록</span> <i class="fa-solid fa-list"></i>
						<input type="hidden" name="print" value="list"/>
					</a>
				</li>
				<li>
					<a class="use_move ${(print == 'map')?'on':''}" href="/main" onclick="move(this,'in','print');">
						<span>지도</span> <i class="fa-${(print == 'map')?'solid':'regular'} fa-map"></i>
						<input type="hidden" name="print" value="map"/>
					</a>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
	<!-- //컨텐츠 종료 -->
	
</main>
<!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
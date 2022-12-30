<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>

<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
		<h1>내 가게 정산내역</h1>
		<span class="color">${m_name}님 가게의 이번달 정산내역입니다 :)</span>
		<br><br>
		<c:if test="${!empty profit }">
		<h4><span class="bgColor">&nbsp;개요&nbsp;</span></h4>
		<table class="card_table">
			<tbody>
				<tr>
					<td>
						<h4 class="color">결제수익</h4>
						<span class="color">&nbsp;=결제금액-환불금액&nbsp;</span><br>
						<span class="bgSubColor">&nbsp;※카페의 이번달 결제 수익&nbsp;</span><br>
						<div class="txt_big bold txt_right">
							<fmt:formatNumber value="${profit.TOTAL*1}" type="currency"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<h4 class="color">결제수수료</h4>
						<span class="color">&nbsp;=결제수익*0.3&nbsp;</span><br>
						<span class="bgSubColor">&nbsp;※카페의 이번달 결제 수수료&nbsp;</span><br>
						<div class="txt_big bold txt_right">
							<fmt:formatNumber value="${profit.TOTAL*0.3}" type="currency"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<h4 class="color">정산금액</h4>
						<span class="color">&nbsp;=결제수익-결제수수료&nbsp;</span><br>
						<span class="bgSubColor">&nbsp;※수수료를 제외한 카페의 이번달 정산수익&nbsp;</span><br>
						<div class="txt_big bold txt_right">
							<fmt:formatNumber value="${profit.TOTAL*0.7}" type="currency"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<h4 class="color">환불금액</h4>
						<span class="color">&nbsp;=취소 및 환불금액&nbsp;</span><br>
						<span class="bgSubColor">&nbsp;※이번달 환불금액&nbsp;</span><br>
						<div class="txt_big bold txt_right">
							<c:if test="${!empty refund.REFUND }">
								<fmt:formatNumber value="${refund.REFUND}" type="currency"/> 
							</c:if>
							<c:if test="${empty refund.REFUND }">
								₩0
							</c:if>
							
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<br><br>
		<h4><span class="bgColor">&nbsp;상세내역&nbsp;</span></h4>
		<table class="txt_center">
		<thead><!-- 테이블 테그의 제목 -->
			<tr>
				<th>예약번호</th>
				<th>결제날짜</th>
				<th>결제수단</th>
				<th>결제금액</th>
				<th>환불금액</th>
				<th>결제수수료</th>
				<th>정산금액</th>
			</tr>
		</thead>
		<tbody><!-- 테이블 태그의 내용 -->
			<c:forEach items="${detail}" var="i">
				<tr>
					<td>${i.R_IDX}</td>
					<td><fmt:formatDate value="${i.R_PAYDATE}" pattern="yy/MM/dd" /></td>
					<td>
						<c:if test="${i.R_PAYMETHOD == 0 }">
							무통장
						</c:if>
						<c:if test="${i.R_PAYMETHOD == 1 }">
							일반결제
						</c:if>
						<c:if test="${i.R_PAYMETHOD == 2 }">
							카카오페이
						</c:if>
					</td>
					<c:choose>
						<c:when test="${(!empty i.R_PAYDATE) and (i.R_STATUS !=0)}">
							<td><fmt:formatNumber type="number" pattern="#,##0" value="${i.R_PRICE}"/>원</td>
							<td></td>
							<td><fmt:formatNumber type="number" pattern="#,##0" value="${i.R_PRICE*0.3}"/>원</td>
							<td><fmt:formatNumber type="number" pattern="#,##0" value="${i.R_PRICE*0.7}"/>원</td>
						</c:when>
						<c:otherwise>		
							<td>환불</td>
							<td><fmt:formatNumber type="number" pattern="#,##0" value="${i.R_PRICE}"/>원</td>
							<td>환불</td>
							<td>환불</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
	
	<c:if test="${empty profit }">
		<br>
		<div class="txt_center color">
		<h1>😲</h1>
			예약내역이 존재하지 않아요.	
		</div>
	</c:if>


	</div>
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
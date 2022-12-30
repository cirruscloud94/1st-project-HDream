<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/css/cafeReservList.css"/>

	<script type="text/javascript">
		function checkCancel() {
			var output = confirm("정말 삭제하시겠습니까?");
			return output;
		}
	</script>


<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>

	<div class="main_wrap">
	<script>
	$(document).ready(function() {
		let modal = $('#modal');
	    let btnOpenPopup = $('.btn-open-popup');

	      btnOpenPopup.on("click", function(){
	    	  modal.toggleClass("show");
	    	  let msg = btnOpenPopup.closest("tr").find(".msg").val();
	    	  let r_idx = btnOpenPopup.closest("tr").find("#r_idx").val();
	    	  let r_name = btnOpenPopup.closest("tr").find("#r_name").val();
	    	  let r_room = btnOpenPopup.closest("tr").find("#r_room").val();
	    	  modal.find(".modal_body").html('<span class="bgColor txt_big">&nbsp;예약번호&nbsp;</span> <span class="color txt_big">&nbsp;'+r_idx +'&nbsp;</span><br>' 
	    			  +'<span class="bgColor txt_big">&nbsp;옵션명&nbsp;</span> <span class="color txt_big">&nbsp; '+r_room +'&nbsp;</span><br>' 
	    			  +'<span class="bgColor txt_big">&nbsp;회원명&nbsp;</span> <span class="color txt_big">&nbsp; '+r_name +'&nbsp;</span><br>' 
	    			  +'<span class="bgColor txt_big">&nbsp;환불사유&nbsp;</span> <span class="color txt_big">&nbsp; '+msg +'&nbsp;</span>' );
	      });
	      modal.on("click", function(e){
	    	  modal.toggleClass("show");
	      });
	});
	</script>
			
			
	<h1>나의 가게 예약관리</h1>
	<div class="color">${m_name}님의 가게 예약관리 페이지입니다 :)</div><br><br>
	<c:if test="${list[0].TOTAL_COUNT != 0}">
				<table>
					<thead>
						<tr>
						<th>예약번호</th>
						<th>예약정보</th>
						<th>예약상태</th>
						<th>고객정보</th>
						<th></th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="r">
					<tr class="txt_center">
						<td>
							<span class="color"><strong>No. ${r.R_IDX}</strong></span>
						</td>
						<td>
							${r.R_ROOM_NAME}<br>(${r.R_PEOPLE}명)<br>
							${fn:substring(r.R_DATE,0,2)}.${fn:substring(r.R_DATE,2,4)}.${fn:substring(r.R_DATE,4,6)}
							${fn:substring(r.R_POSSIBLETIME,0,2)}:${fn:substring(r.R_POSSIBLETIME,2,4)}<br>
							(${r.R_USETIME}분)
							<input type="hidden" class="msg" name="R_MSG" value="${r.R_MSG}">
							<input type="hidden" id="r_idx" name="r_idx" value="${r.R_IDX}">
							<input type="hidden" id="r_name" name="r_name" value="${r.R_NAME}">
							<input type="hidden" id="r_room" name="r_room" value="${r.R_ROOM_NAME}">
						</td>
						<td class="color bold">
								<c:if test="${r.R_STATUS == 0}">&nbsp;예약취소&nbsp;</c:if> 
								<c:if test="${r.R_STATUS == 1}">&nbsp;입금대기&nbsp;</c:if> 
								<c:if test="${r.R_STATUS == 2}">&nbsp;결제완료&nbsp;</c:if> 
								<c:if test="${r.R_STATUS == 3}">&nbsp;예약확정&nbsp;</c:if> 
								<c:if test="${r.R_STATUS == 4}">&nbsp;사용완료&nbsp;</c:if> 
								<c:if test="${r.R_STATUS == 5}">&nbsp;환불요청&nbsp;</c:if> 
						</td>
						<td>
							<span class="bold">${r.R_NAME}</span><br>
							<input type="hidden" name="R_PAYMETHOD" value="${r.R_PAYMETHOD}">
							<c:if test="${r.R_PAYMETHOD == 0 }">
								무통장
							</c:if>
							<c:if test="${r.R_PAYMETHOD == 1 }">
								일반결제
							</c:if>
							<c:if test="${r.R_PAYMETHOD == 2 }">
								카카오페이
							</c:if>
							<br>
							${fn:substring(r.R_CELLPHONE,0,3)}-${fn:substring(r.R_CELLPHONE,3,7)}-${fn:substring(r.R_CELLPHONE,7,11)}
							<br>
							<span class="color">
							<fmt:formatNumber value="${r.R_PRICE}" type="currency"/>
							</span>
						</td>
						<td >
							
							<c:if test="${r.R_STATUS != 0 and r.R_STATUS != 4 and r.R_STATUS != 5}">
								<a class="use_move btn slim" 
								onclick="move(this, 'in', 'R_STATUS', 'R_IDX'); alert('예약취소가 완료되었습니다.\n예약취소는 돌이킬 수 없습니다.');"
								href="/owner/mypage/cafe_reserv/updateStatus">
									<input type="hidden" name="R_STATUS" value="0">
									<input type="hidden" name="R_IDX" value="${r.R_IDX}">
									예약취소
								</a><br>
								<c:if test="${r.R_STATUS != 3}">
									<a class="use_move btn slim" 
									onclick="move(this, 'in', 'R_STATUS', 'R_IDX'); alert('예약확정이 완료되었습니다.');"
									href="/owner/mypage/cafe_reserv/updateStatus">
										<input type="hidden" name="R_STATUS" value="3">
										<input type="hidden" name="R_IDX" value="${r.R_IDX}">
										예약확정
									</a><br>
								</c:if>
								<c:if test="${r.R_STATUS == 3}">
									<br>
								</c:if>
								<a class="use_move btn slim" 
								onclick="move(this, 'in', 'R_STATUS', 'R_IDX'); alert('사용완료 되었습니다.');"
								href="/owner/mypage/cafe_reserv/updateStatus">
									<input type="hidden" name="R_STATUS" value="4">
									<input type="hidden" name="R_IDX" value="${r.R_IDX}">
									사용완료
								</a>
							</c:if>
							<c:if test="${r.R_STATUS == 0}">
								<span class="color">&nbsp;취소된&nbsp;<br>
								&nbsp;예약건입니다.&nbsp;</span>
							</c:if>
							<c:if test="${r.R_STATUS == 4}">
								<span class="color">&nbsp;사용완료된&nbsp;<br>
								&nbsp;예약건입니다.&nbsp;</span>
							</c:if>
							
							<c:if test="${r.R_STATUS == 5}">
								<span class="color">&nbsp;회원님의&nbsp;<br>
								&nbsp;환불요청입니다.&nbsp;</span><br>
   								<button class="btn-open-popup btn slim">상세사유</button><br>
								<a class="use_move btn slim" 
								onclick="move(this, 'in', 'R_STATUS', 'R_IDX'); alert('환불거절로 인해 사용완료로 돌아갑니다.');"
								href="/owner/mypage/cafe_reserv/updateStatus">
									<input type="hidden" name="R_STATUS" value="4">
									<input type="hidden" name="R_IDX" value="${r.R_IDX}">
									환불거절
								</a><br>
								<a class="use_move btn slim" 
								onclick="move(this, 'in', 'R_STATUS', 'R_IDX'); alert('환불수락이 되었습니다.');"
								href="/owner/mypage/cafe_reserv/updateStatus">
									<input type="hidden" name="R_STATUS" value="0">
									<input type="hidden" name="R_IDX" value="${r.R_IDX}">
									환불완료
								</a>
							</c:if>

						</td>
					</tr>
					</c:forEach>
				</table>
			<c:if test="${!empty paginationInfo}">
				<div class="paging txt_center">
					<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
				</div>
			</c:if>	

	</c:if>
	<c:if test="${list[0].TOTAL_COUNT == 0}">
		<br>
		<div class="txt_center color">
			<h1>😲</h1>
			예약내역이 존재하지 않아요.
		</div>
	</c:if>
	<br>
	</div>
	<div id="modal">
    	<div class="modal_body">
    			Modal
    	    	<div></div>
    	</div>
	</div>
	<!-- //컨텐츠 종료 -->
</main>
<!-- //main 종료 -->


<%@ include file="/WEB-INF/include/common-footer.jspf"%>
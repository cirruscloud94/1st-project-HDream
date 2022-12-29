<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/css/reservList.css"/>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<!-- 마이페이지에 해당하는 페이지라면 nav 삽입이 필요합니다. -->
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
		
	<script type="text/javascript">
		function checkCancel() {
			var output = confirm("정말 삭제하시겠습니까?");
			return output;
		}
		
		function checkRefund(target) {
			//7일이 지나면 환불요청이 불가
			$("tr").removeClass("on");
			$(target).closest("tr").addClass("on");
			var str = $(target).closest("tr").find('#r_date').val(); //ex.'220301'
			var d = '20'+str.substr(0, 2)+'-'+ str.substr(2, 2)+'-'+str.substr(4, 2);
			let reservDate = new Date(d);
			reservDate.setDate(reservDate.getDate() + 7);//7일 후
			var refundDate = reservDate.toLocaleString(); //'2022. 12. 18. 오후 5:01:44'
			var rd = parseInt(refundDate.substr(0,4)+ refundDate.substr(6,2)+refundDate.substr(10,2));
			
			var now = new Date().toLocaleString();//'2022. 12. 20. 오후 5:01:44'
			var n = parseInt(now.substr(0,4)+ now.substr(6,2)+now.substr(10,2));
			console.log('hi');
			if(rd < n) {//이미 환불기한이 지났다면
				alert('환불기한이 지나 요청이 불가합니다.');
				return false;
			} else {
				window.open('/user/reserv/refundForm', 'RefundPage', "width=450, height=250, left=100, top=50");
			}
			
		}
	</script>
	
	<h1>나의 예약현황</h1>
	<span class="color"><%=session.getAttribute("m_name") %>님의 예약현황입니다 :)</span> <br><br>
	<c:if test="${list[0].TOTAL_COUNT != 0}">
	<table class="card_table" ><tbody>
		<c:forEach items="${list}" var="r">
			
			<tr>
				<td>
					<div style="float:left;" class="txt_big">${r.R_CAFE_NAME}</div>
					<div style="float:right;" class="color">
						<c:if test="${r.R_STATUS==0}">예약취소</c:if>
						<c:if test="${r.R_STATUS==1}">예약완료</c:if>
						<c:if test="${r.R_STATUS==2}">입금완료</c:if>
						<c:if test="${r.R_STATUS==3}">예약확정</c:if>
						<c:if test="${r.R_STATUS==4}">사용완료</c:if>
						<c:if test="${r.R_STATUS==5}">환불요청</c:if>
					</div>
					<br>
				</td>
				<td>&nbsp;${r.R_ROOM_NAME} (${r.R_PEOPLE}명)</td>
				<td>&nbsp;${r.R_CAFE_LOCATION}</td>
				<td>&nbsp;${fn:substring(r.R_DATE,0,2)}.${fn:substring(r.R_DATE,2,4)}.${fn:substring(r.R_DATE,4,6)}
					<input type="hidden" id="r_date" name="r_date" value="${r.R_DATE}">
					<input type="hidden" id="r_idx" name="r_idx" value="${r.R_IDX}">
					${fn:substring(r.R_POSSIBLETIME,0,2)}:${fn:substring(r.R_POSSIBLETIME,2,4)} (${r.R_USETIME}분)
				</td>
				<td align="right">
					<div class="flex">
						<a class="btn submit" href="/com/detail/selectGoodsInfo/${r.C_IDX}">상세정보</a>&nbsp;
						<c:if test="${r.R_STATUS==4 and (empty r.V_R_IDX)}">
							<a class="btn submit use_move" href="/user/mypage/review/insertForm" onclick="move(this, 'in', 'v_r_idx', 'v_o_idx', 'v_c_idx', 'r_cafe_name', 'r_room_name')" ">
								리뷰작성
								<input type="hidden" name="v_r_idx" value="${r.R_IDX}"><!-- 예약번호 -->
								<input type="hidden" name="v_o_idx" value="${r.R_C_IDX}"><!-- 옵션번호 -->
								<input type="hidden" name="v_c_idx" value="${r.C_IDX}"><!-- 카페번호 -->
								<input type="hidden" name="r_cafe_name" value="${r.R_CAFE_NAME}"><!-- 카페이름 -->
                                <input type="hidden" name="r_room_name" value="${r.R_ROOM_NAME}"><!-- 옵션이름 -->
							</a> &nbsp;
							<a class="btn submit" onclick="checkRefund(this)">환불요청</a>
						</c:if>
						<c:if test="${r.R_STATUS==5 and (empty r.V_R_IDX)}">
							<a class="btn disable" href="">리뷰작성</a>
						</c:if>
						<c:if test="${r.R_STATUS==1||r.R_STATUS==2||r.R_STATUS==3}">
							<form action="/user/mypage/reserv/cancelReserv" method="POST">
								<a class="btn disable" href="">리뷰작성</a>
								<input type="hidden" name="R_IDX" value="${r.R_IDX}">
								<input type="submit" value="예약취소" class="btn submit"  onclick="return checkCancel();" >
							</form>
						</c:if>
						<c:if test="${r.R_STATUS==0}">
							<a class="btn disable" href="#">리뷰작성</a>
						</c:if>
					</div>
				</td>
			</tr>
		
	</c:forEach>
	</tbody>
	</table>
	<c:if test="${!empty paginationInfo}">
				<div class="paging txt_center">
					<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
				</div>
			</c:if>	
	</c:if>
	
	<c:if test="${list[0].TOTAL_COUNT == 0}">
		<br><br>
		<div class="txt_center color">
		<h1>😲</h1>
		저희 서비스를 이용하신 적이 없으시네요<br>
		그렇다면 예약하러 가볼까요?	
		</div>
	</c:if>
		<br><br><br><br><br><br>
	</div><!-- div 종료 -->
</main><!-- main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
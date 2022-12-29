<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/cafeReservList.css" />

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> 	

<script src="/resources/js/pay.js"></script>

<main class="layoutCenter">
	<div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		// 라디오 클릭에 따라 상세보기 변경
		$(".personal").show();
		$(".owner").hide();
		$(".non").hide();	
		$(".tab_radio label").on("click", function() {
			if ($(this).text() == '개인소득공제용') {
				$(".personal").show();
				$(".owner").hide();
				$(".non").hide();
			}
			if ($(this).text() == '사업자증빙용/세금계산서') {
				$(".personal").hide();
				$(".non").hide();
				$(".owner").show();
			}
			if ($(this).text() == '신청안함') {
				$(".personal").hide();
				$(".owner").hide();
				$(".non").show();
			}
		});
		
		$(".kakao").show();
		$(".card").hide();
		$(".moo").hide();		
		$(".tab_radio label").on("click", function() {
			if ($(this).text() == '카카오페이') {
				$(".kakao").show();
				$(".card").hide();
				$(".moo").hide();
				$("#r_payMethod").html("<input type='hidden' name='r_payMethod' value='2'>");
				$("#r_status").html("<input type='hidden' name='r_status' value='2'>");
			}
			if ($(this).text() == '신용/체크카드') {
				$(".kakao").hide();
				$(".moo").hide();
				$(".card").show();
				$("#r_payMethod").html("<input type='hidden' name='r_payMethod' value='1'>");
				$("#r_status").html("<input type='hidden' name='r_status' value='2'>");
			}
			if ($(this).text() == '무통장') {
				$(".kakao").hide();
				$(".card").hide();
				$(".moo").show();
				$("#r_payMethod").html("<input type='hidden' name='r_payMethod' value='0'>");
				$("#r_status").html("<input type='hidden' name='r_status' value='1'>");
			}
		});			
	});
	</script>
	
	<form id="payForm" action="/user/reserv/completePay" method="post" onsubmit="return payModule()">
		<h1 class="txt_center">결제 하기</h1><br><br>
		
		<!-- reserv테이블에 등록되는 정보들 -->
		<input type="hidden" id="r_id" name="r_id" value="${userInfo.M_ID}">
		<input type="hidden" id="r_name" name="r_name" value="${userInfo.M_NAME}">
		<input type="hidden" id="r_cellphone"  name="r_cellphone" value="${userInfo.M_CELLPHONE}">
		<input type="hidden" id="c_idx" name="c_idx" value="${cafeInfo.CAFE_IDX}">
		<input type="hidden" id="r_cafe_name" name="r_cafe_name" value="${cafeInfo.CAFE_NAME}">
		<input type="hidden" id="r_cafe_location" name="r_cafe_location" value="${cafeInfo.CAFE_LOCATION}">
		<input type="hidden" id="r_c_idx" name="r_c_idx" value="${goodsInfo.GOODSREG_IDX}">
		<input type="hidden" id="r_room_name" name="r_room_name" value="${goodsInfo.GOODSREG_OPTIONNAME}">
		<input type="hidden" id="r_useTime" name="r_useTime" value="${goodsInfo.GOODSREG_USETIME}">
		<input type="hidden" id="r_possibleTime" name="r_possibleTime" value="${selectTime}">
		<input type="hidden" id="r_date" name="r_date" value="${selectedDate}">
		<input type="hidden" id="r_people" name="r_people" value="${peopleNum}">
		<input type="hidden" id="r_price" name="r_price" value="${goodsInfo.GOODSREG_PRICE*peopleNum}">
		<span id="r_status"><input type='hidden' name='r_status' value='2'></span>
		<span id="r_payMethod"><input type='hidden' name='r_payMethod' value='2'></span>
		<!-- ********************* -->
		<span id="uid"></span>
		
		<div>
			<h3>선택메뉴 정보</h3><br/>
			<div>
				<div class="txt_big bold">${goodsInfo.GOODSREG_OPTIONNAME} ${peopleNum}인&nbsp;</div>
				<div class="txt_big bold">${selectedDate} ${selectTime}&nbsp;</div>
			</div>
		</div>
		
		<br><br><br><br>
		
		<div>
			<h3>예약자 정보</h3>
			<br/>
			<div class="txt_big bold">${userInfo.M_NAME}님</div>
			<div>${fn:substring(userInfo.M_CELLPHONE,0,3)}-
				${fn:substring(userInfo.M_CELLPHONE,3,7)}-
				${fn:substring(userInfo.M_CELLPHONE,7,11)}
			</div>
			<div>${userInfo.M_EMAIL}</div>
			<input type="hidden" id="m_email" value="${userInfo.M_EMAIL}">
		</div>

		<br><br><br><br>
		
		<div>
			<h3>결제 정보</h3>
			<br/>
			<h4 class="bold">
				<fmt:formatNumber value="${goodsInfo.GOODSREG_PRICE*peopleNum}" type="currency"/>
			</h4>
			<br/>
			<span class="color bold"> ※ 결제수단을 선택해주세요 </span><br>
			<fieldset class="tab_radio">
				<input type="radio" name="payRadio" value="kakao" id="kakao" checked>
				<label for="kakao">카카오페이</label> 
				<input type="radio" name="payRadio" value="card" id="card" > 
				<label for="card">신용/체크카드</label>
				<input type="radio" name="payRadio" value="moo" id="moo" > 
				<label for="moo">무통장</label>
			</fieldset>
			
			<div class="color txt_center" >
			<table class="kakao">
				<tr>
					<td scope="col">
						<br>
						<span class="bgSubColor">&nbsp;※카카오페이 간단결제입니다.&nbsp;</span><br>
						<img width="135px" src="https://img.hani.co.kr/imgdb/resize/2019/0711/53_1562747881_156274784097_20190711.PNG">
						<br><br>
					</td>
				</tr>
			</table>
			<table class="card">
				<tr>
					<td scope="col" >
						<br>
						<span class="bgSubColor">&nbsp;※일반카드결제입니다.&nbsp;</span><br>
						<img width="81px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXZ5I5eL8ioH8gwU0p_H9S075NfWtcA33fqRj7AKcOs77Y8AL_FbULfSCk-Q2h00Mw89Y&usqp=CAU">
						<br><br>
					</td>
				</tr>
			</table>
			<table class="moo">
				<tr>
					<td scope="col"><br>
						<span class="bgSubColor">&nbsp;※입금하실 계좌입니다.&nbsp;</span><br>
						<h4>${cafeInfo.CAFE_ACCOUNTINFO}</h4><br>
						<span class="bgSubColor">&nbsp;※입금자명은 예약자명과 동일해야합니다.&nbsp;</span><br>
						입금자명 <span class="color bold txt_big"> &nbsp;${userInfo.M_NAME}</span>
						<%-- <input type="text" value="${userInfo.M_NAME}" placeholder="입금자명을 입력해주세요"> --%>
					<br></td>
				</tr>
			</table>
		</div>
			
		</div>		
		
		<br><br><br><br>
		
		<div>
			<h3>현금영수증 신청</h3>
		</div>
		<br>
		<fieldset class="tab_radio">
			<input type="radio" id="personal" name="tab" value="personal" checked>
			<label for="personal">개인소득공제용</label> 
			<input type="radio" id="owner" name="tab" value="owner"> 
			<label for="owner">사업자증빙용/세금계산서</label>
			<input type="radio" id="non" name="tab" value="non"> 
			<label for="non">신청안함</label>
		</fieldset>

		<div class="color txt_center">
			<table class="personal">
				<tr><td scope="col">
						<br><span class="bold">휴대폰번호</span> <br>
						<input type="text" value="${userInfo.M_CELLPHONE}"><br>
						<span class="bgSubColor">&nbsp;※번호가 잘 입력되었는지 확인해 주세요&nbsp;</span>
						<br><br>
				</td></tr>
			</table>
			<table class="owner">
				<tr><td scope="col" >
						<br><span class="bold">사업자등록번호</span><br>
						<input type="text" value="${userInfo.M_OWN_NUM}"><br>
						<span class="bgSubColor">&nbsp;※번호가 잘 입력되었는지 확인해 주세요&nbsp;</span>
						<br><br>
				</td></tr>
			</table>
			<table class="non">
				<tr><td scope="col"><br><br>
					<span class="bgSubColor">&nbsp;※현금영수증을 신청하지 않습니다.&nbsp;</span><br><br><br>
				</td></tr>
			</table>
		</div>

		<br><br><br><br>
		<div class="txt_center">
			<input class="btn submit" type="submit" value="결제하기" />
		</div>
		
	</form>
	</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>

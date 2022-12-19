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
		<div class="txt_center ">
			<h1>결제 완료</h1><br><br>
			<h1>🥳</h1>
			<h4 class="color">결제가 정상적으로 완료되었습니다.</h4>
			<span class="bgSubColor">&nbsp;※사장님의 예약확정 이후 서비스사용이 가능합니다. &nbsp;</span>
			<br><br>
			<div class="border_right">
				<form method="POST" action="/user/mypage/reserv/reservList">
						<input type="hidden" id="M_ID" name="M_ID" value="${m_id}">
						<input class="btn submit" type="submit" value="예약확인하러가기"> 
				</form>
			</div>

		</div>

	</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>

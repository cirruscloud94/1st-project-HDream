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
			<h1>κ²°μ  μλ£</h1><br><br>
			<h1>π₯³</h1>
			<h4 class="color">κ²°μ κ° μ μμ μΌλ‘ μλ£λμμ΅λλ€.</h4>
			<span class="bgSubColor">&nbsp;β»μ¬μ₯λμ μμ½νμ  μ΄ν μλΉμ€μ¬μ©μ΄ κ°λ₯ν©λλ€. &nbsp;</span>
			<br><br>
			<div class="border_right">
				<form method="POST" action="/user/mypage/reserv/reservList">
						<input type="hidden" id="M_ID" name="M_ID" value="${m_id}">
						<input class="btn submit" type="submit" value="μμ½νμΈνλ¬κ°κΈ°"> 
				</form>
			</div>

		</div>

	</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf"%>

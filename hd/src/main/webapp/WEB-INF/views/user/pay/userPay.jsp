<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HDream 결제</title>
<%@ include file="/WEB-INF/include/common-header.jspf" %>

<!-- FONTAWESOME -->
<script src="https://kit.fontawesome.com/4d34cda21a.js" crossorigin="anonymous"></script>
</head>
<body>
<main class="layoutCenter">

	<form action="/reserv/pay" method="post" onsubmit="">
		<h1 class="txt_center">결제 하기</h1>
		
		<div class="txt_left">
			<h3>선택메뉴 정보</h3>
			<br/>
			<div>일정: 12. 05(월) , 정오 12:00</div>
			<div>옵션명: 꿈마루(수면) 1시간 + 커피/음료</div>
			<div>가격: 7000원</div>
		</div>
		
		<hr>
		
		<div class="txt_left">
			<h3>주문자 정보</h3>
			<br/>
			<div>홍길동</div>
			<div>01012345678</div>
			<div>honggildong@naver.com</div>
		</div>
		
		<hr>
		
		<div class="txt_left">
			<h3>결제 정보</h3>
			<br/>
			<div>가격: 7000원</div>
			<br/>
			<table class="card_table">
					<tbody><!-- 테이블 태그의 내용 -->
						<tr>
							<td>카카오페이</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>신용/체크 카드</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>무통장</td><!-- td태그 사용 -->
						</tr>
					</tbody>
				</table>		
		</div>
		<div class="txt_left">
			<h4>현금영수증 신청</h4>
			<br/>
			<input type="radio" name="test" checked>개인소득공제용
			<input type="radio" name="test">사업자증빙용·세금계산서
			<input type="radio" name="test">신청안함
		</div>
	
		<div class="txt_center">
			<input class="btn submit" type="submit" value="결제하기"/>
		</div>	
	</form>
	
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</body>
</html>
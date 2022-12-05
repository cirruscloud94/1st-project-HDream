<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HDream 예약</title>
<%@ include file="/WEB-INF/include/common-header.jspf" %>


<!-- JQUERY DATEPICKER 설정 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- JS & CSS -->
<script src="/resources/js/reservTime.js"></script>
<link rel="stylesheet" href="/resources/css/reservTime.css">


<!-- FONTAWESOME -->
<script src="https://kit.fontawesome.com/4d34cda21a.js" crossorigin="anonymous"></script>
</head>

<body>
<main class="layoutCenter">

	<h1 class="txt_center">예약하기</h1>
	
	<div class="txt_center reservation">
		<div>
			<details>
				<summary>
					<button class="btn txt_normal txt_left">
						<i class="fa-solid fa-calendar" id="selectedDate"></i>
					</button>
				</summary>
			
			<!-- DATEPICKER 달력 기능 -->
			<div class="gentle-flex" id="datepicker"></div>
			</details>
		</div>
		
		<div class="txt_center">
			<details>
				<summary>
					<button class="btn txt_normal txt_left">
						<i class="fa-solid fa-clock"> 시간선택</i>
					</button>
				</summary>
			<br/>
				<table class="card_table gentle-flex" id="selectReservTime">
					<tbody><!-- 테이블 태그의 내용 -->
						<tr>
							<td>9:00</td><!-- td태그 사용 -->
						</tr>
					</tbody>
				</table>
			</details>
		</div>
		
		<div class="txt_center">
			<details>
				<summary>
					<button class="btn txt_normal txt_left">
						<i class="fa-regular fa-hand-pointer"> 옵션선택</i>
					</button>
				</summary>
			<br/>
				<table class="card_table gentle-flex" id="selectOption">
					<tbody><!-- 테이블 태그의 내용 -->
						<tr>
							<td>{goodsReg_optionName}</td><!-- td태그 사용 -->
							<td>{goodsReg_price}</td>
						</tr>
					</tbody>
				</table>
			</details>
		</div>
		
		<hr>
		
		<div class="txt_left">
			<h3>예약 내용을 확인해 주세요</h3>
			<br/>
			<div id="selectedDate">일정 12. 05(월) , 정오 12:00</div>
		</div>
	</div>
		
	<hr>
	<form action="/reserv/time" method="post" onsubmit="">
		<div class="txt_center">
			<h3>예약자 정보</h3>
			<ul class="reserv_info txt_left">
				<li class="m_name">
					<label class="req" for="m_name">예약자</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30"/>
					<label class="req" for="m_name">연락처</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30"/>
					<label class="req" for="m_name">이메일</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30"/>
					<label class="req" for="m_name">요청사항</label>
					<textarea id="m_name" class="req" name="m_name" maxlength="100" placeholder="업체에 요청하실 내용을 적어주세요">
					</textarea>
				</li>
			</ul>
			<br/>
			<input class="btn submit" type="submit" value="예약하기"/>
		</div>
	</form>
	
</main>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</body>
</html>


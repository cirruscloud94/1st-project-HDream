<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약설정</title>
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

<div>


<h1 class="txt_center">예약하기</h1>

<hr>

<br/>
<!-- <div class="area"> -->


<div class="txt_center">
<details>
<summary>
<!-- <div class="accordion_item open"> -->
<button class="btn txt_normal txt_left">
<i class="fa-solid fa-calendar" id="selectedDate">
</i>
</button>
</summary>

<!-- <div class="accordion_content"> -->
<!-- DATEPICKER 달력 기능 -->
<div class="gentle-flex" id="datepicker"></div>
<!-- </div> -->
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
<!-- <div class="accordion_content"> -->
<table class="card_table" id="selectReservTime">
	<tbody><!-- 테이블 태그의 내용 -->
		<tr>
			<td>9:00</td><!-- td태그 사용 -->
		</tr>
	</tbody>
</table>
<!-- </div> -->
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
<!-- <div class="accordion_content txt_left"> -->
<table class="card_table" id="selectOption">
	<tbody><!-- 테이블 태그의 내용 -->
		<tr>
			<td>{goodsReg_optionName}</td><!-- td태그 사용 -->
			<td>{goodsReg_price}</td>
		</tr>
	</tbody>
</table>
</details>
<!-- </div> -->
</div>
<!-- </div> -->
</div>

<br/>

<hr>
	
<div class="txt_center">

<br>
	
<a class="btn submit boxsize txt_big" href="/reserv/pay">예약하기</a>
	
</div>
	
<!-- </div> -->

</main>
<!-- 아코디언 동작 -->
<script defer>
//아코디언 클릭 이벤트 정의
document.querySelectorAll
(
		'.accordion .accordion_item > button'
		
).forEach((btn) =>
{
  btn.addEventListener('click', (e) => 
  {
	  let accordion_item = e.currentTarget.parentNode;
	  accordion_item.classList.toggle('open');
  });
});
</script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</body>
</html>


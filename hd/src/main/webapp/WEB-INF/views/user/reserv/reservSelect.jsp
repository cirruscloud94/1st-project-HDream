<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약설정</title>
<%@ include file="/WEB-INF/include/common-header.jspf" %>


<!-- Jquery datepicker 설정 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Js & Css -->
<script src="/resources/js/reservCalendar.js"></script>
<link rel="stylesheet" href="/resources/css/reservStyle.css" />

<!-- Fontawesome -->
<script src="https://kit.fontawesome.com/4d34cda21a.js" crossorigin="anonymous"></script>
</head>

<style>
body 
{
    font-size: 16px;
    text-align: left;
}

i 
{
    font-size: 30px;
    color: #674ea7;
}

a 
{
	width: 200pt;
}

</style>

<script>


const options =  
{
	dataStyle: "medium",
	timeStyle: "full"
}

new Intl.DateTimeFormat('en-US', options).format(date)
new Intl.DateTimeFormat('ko-KR', options).format(date)

</script>

<body>
<main class="layoutCenter">

<div>

<h1>예약하기</h1>

<!-- datepicker 달력 기능 -->
<div>
<a class="btn txt_normal" href="#" id="datep"> 
<i class="fa-solid fa-calendar"> 날짜선택</i>
</a>
</div>

<div class="datepicker">
</div>

<div>
<input type="hidden" id="dp" /> 
<a class="btn txt_normal" href="#">
<i class="fa-solid fa-clock"> 시간선택</i>
</a>
</div>

<hr>
	
<!-- 시간 선택기능 -->
<p class="txt_normal">코스 선택</p>

<table class="card_table">
	<tbody><!-- 테이블 태그의 내용 -->
		<tr>
			<td>상품내용</td><!-- td태그 사용 -->
			<td>가격</td>
		</tr>
		
		<tr>
			<td>{goodsDetail}</td><!-- td태그 사용 -->
			<td>{price}</td>
		</tr>
		
		<tr>
			<td>{goodsDetail}</td><!-- td태그 사용 -->
			<td>{price}</td>
		</tr>
		
		<tr>
			<td>{goodsDetail}</td><!-- td태그 사용 -->
			<td>{price}</td>
		</tr>
		
		<tr>
			<td>{goodsDetail}</td><!-- td태그 사용 -->
			<td>{price}</td>
		</tr>
		
		<tr>
			<td>{goodsDetail}</td><!-- td태그 사용 -->
			<td>{price}</td>
		</tr>
	</tbody>
</table>
	
<div class="txt_center">
	
<a class="btn submit" href="#">{price}원 결제하기</a>
	
</div>
	
</div>

</main>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</body>
</html>


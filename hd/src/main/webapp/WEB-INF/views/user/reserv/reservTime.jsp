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
<style>
.gentle-flex 
{
	display: flex; 
	flex-direction: column; 
	align-items: center; 
	justify-content: center; 
	gap: 1ch; 
}
</style>
</head>

<body>
<main class="layoutCenter">

	<h1 class="txt_center">예약하기</h1>
	
	<div class="txt_center reservation">
		<div>
			<details>
				<summary>
					<button class="btn txt_normal txt_left">
						<i class="fa-solid fa-calendar" id="selectedDate">
						<script>
						const currentDate = new Date();

						const options =  
						{
							month:"numeric",
							weekday:"short",
							day:"2-digit",
						}
						document.write(currentDate.toLocaleDateString("ko-KR", options));
						</script>
						</i>
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
			<script>
				
			</script>
				<table class="card_table">
					<tbody><!-- 테이블 태그의 내용 -->
						<tr>
							<td>9:00</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>9:30</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>10:00</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>10:30</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>11:00</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>11:30</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>12:00</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>12:30</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>13:00</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>13:30</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>14:00</td><!-- td태그 사용 -->
						</tr>
						<tr>
							<td>14:30</td><!-- td태그 사용 -->
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
			<script>
			
			</script>
				<table class="card_table gentle-flex">
					<tbody><!-- 테이블 태그의 내용 -->
						<tr>
							<td>꿈마루(수면) 1시간 + 커피/음료</td><!-- td태그 사용 -->
							<td>7000원</td>
						</tr>
						<tr>
							<td>쉼마루(휴식) 1시간 + 커피/음료</td><!-- td태그 사용 -->
							<td>6000원</td>
						</tr>
						<tr>
							<td>시원마루(안마) 30분 + 커피/음료</td><!-- td태그 사용 -->
							<td>6000원</td>
						</tr>
						<tr>
							<td>시원마루(안마) 1시간 + 커피/음료</td><!-- td태그 사용 -->
							<td>10000원</td>
						</tr>
						<tr>
							<td>대화마루(라운지) 1시간 + 커피/음료</td><!-- td태그 사용 -->
							<td>3000원</td>
						</tr>
					</tbody>
				</table>
			</details>
		</div>
		
		<hr>
	</div>
	
	<form action="/reserv/time" method="post" onsubmit="">	
		<div class="txt_left">
			<h3>예약 내용을 확인해 주세요</h3>
			<br/>
			<div>일정:
			<script>
			const currentDate2 = new Date();

			const options2 =  
			{
				month:"numeric",
				weekday:"short",
				day:"2-digit",
			}
			document.write(currentDate2.toLocaleDateString("ko-KR", options2));
			</script>
			, 오후 12:00</div>
			<div>옵션명: 꿈마루(수면) 1시간 + 커피/음료</div>
			<div>가격: 7000원</div>
		</div>
		<hr>
		<div class="txt_center">
			<h3>예약자 정보</h3>
			<ul class="reserv_info txt_left">
				<li class="m_name">
					<label class="req" for="m_name">예약자</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value="${map.m_name}"/>
					<label class="req" for="m_name">연락처</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value=""/>
					<label class="req" for="m_name">이메일</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value=""/>
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


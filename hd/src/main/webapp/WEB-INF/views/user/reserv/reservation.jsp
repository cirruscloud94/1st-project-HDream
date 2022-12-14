<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf" %>


<!-- JQUERY DATEPICKER 설정 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- JS & CSS -->
<script src="/resources/js/reservTime.js"></script>
<link rel="stylesheet" href="/resources/css/reservTime.css">


<!-- FONTAWESOME -->
<script src="https://kit.fontawesome.com/4d34cda21a.js" crossorigin="anonymous"></script>

<main class="layoutCenter">

<article>
	<section class="txt_center">
	<br/>
		<h3>예약하기</h3>
		<br/>
		
			<div>
				<details>
					<summary class="btn txt_normal txt_center">
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
					</summary>
				
					<!-- DATEPICKER 달력 기능 -->
					<div class="gentle-flex" id="datepicker"></div>
				</details>
			</div>
			
			<div class="txt_center" id="selectTimes">
				<details>
					<summary class="btn txt_normal txt_center">
						<i class="fa-solid fa-clock"> 시간선택</i>
					</summary>
					<br/>
					<table class="card_table selectTime">
						<tbody>
							<!-- 시간선택옵션 -->
						</tbody>
					</table>
				</details>
			</div>
			
			<div class="txt_center" id="selectPeople">
				<details>
					<summary class="btn txt_normal txt_center">
						<i class="fa-solid fa-user-check"> 인원선택</i>
					</summary>
					<br/>
					<div>
					인원을 선택해주세요
						<input type='button' onclick='count("minus")' value='-'/>
						<span id="num">1</span>
						<input type='button' onclick='count("plus")' value='+'/>
					</div>
				</details>
			</div>
	</section>
	
	<br/>
	
	<hr>
	
	<form action="/user/reserv/pay" method="post">	
		<section class="txt_left">
			<h3>예약 내용을 확인해 주세요</h3>
			
			<br/>
			
			<div>
				일정:
				<span id="selectedDate2">
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
				</span>
				
				<span id="selectTime">
				</span>
			</div>
			
			<div>옵션명: ${option.GOODSREG_OPTIONNAME}</div>
			<input type="hidden" id="goodsReg_Idx" name="goodsReg_idx" value="${option.GOODSREG_IDX}">
			
			<div>인원: <span id="num2">1<input type="hidden" name="peopleNum" value="1"></span>명</div>
			<div>가격: <span id="totalPrice">${option.GOODSREG_PRICE}</span>원</div>
			<input type="hidden" name="cafe_idx" value="${option.GOODSREG_CAFE_IDX}">
		</section>
		
		<hr>
		
		<section class="txt_center">
			<h3>예약자 정보</h3>
			
			<ul class="reserv_info txt_left reserInfo">
				<li class="m_name">
					<input type="hidden" name="m_id" id="m_id" value="${userInfo.M_ID}" readOnly>
					<label class="req" for="m_name">예약자</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value="${userInfo.M_NAME}" required/>
					<label class="req" for="m_name">연락처</label>
					<input type="text" id="m_name" class="req" name="m_cellphone" maxlength="30" value="${userInfo.M_CELLPHONE}" required/>
					<label class="req" for="m_name">이메일</label>
					<input type="text" id="m_name" class="req" name="m_email" maxlength="30" value="${userInfo.M_EMAIL}" required/>
				</li>
			</ul>
			
			<br/>
			
			<input class="btn submit" type="submit" value="예약하기"/>
		</section>
	</form>
</article>	

</main>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>


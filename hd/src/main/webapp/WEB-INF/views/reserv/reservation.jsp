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
					<table class="card_table gentle-flex optionTable">
						<tbody><!-- 테이블 태그의 내용 -->
							<tr>
								<td>
								${option.GOODSREG_OPTIONNAME}
								<input type="hidden" name="goodsReg_Idx" value="${GOODSREG_IDX}">
								</td>
								<td>
								${option.GOODSREG_PRICE}
								<input type="hidden" name="goodsReg_Idx" value="${GOODSREG_IDX}">
								</td>
							</tr>
						</tbody>
					</table>
				</details>
			</div>
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
				<table class="card_table selectTime">
					<tbody>
					</tbody>
				</table>
			</details>
		</div>
		
		<div class="txt_center">
			<details>
				<summary>
					<button class="btn txt_normal txt_left">
						<i class="fa-solid fa-user-check"> 인원선택</i>
					</button>
				</summary>
			<br/>
			<div class="peopleNum">
				<div>
				인원을 선택해주세요
					<input type='button' onclick='count("minus")' value='-'/>
					<span id="num">1</span>
					<input type='button' onclick='count("plus")' value='+'/>
				</div>
			</div>
			</details>
		</div>
		
		<hr>
	</div>
	
	<form action="/reserv" method="post" onsubmit="/reserv/pay">	
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
			<div>옵션명: ${option.GOODSREG_OPTIONNAME}</div>
			<div>인원: ${option.GOODSREG_PEOPLE}명</div>
			<div>가격: ${option.GOODSREG_PRICE}원</div>
		</div>
		<hr>
		<div class="txt_center">
			<h3>예약자 정보</h3>
			<ul class="reserv_info txt_left reserInfo">
				<li class="m_name">
					<label class="req" for="m_name">예약자</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value="${m_name}"/>
					<label class="req" for="m_name">연락처</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value="${m_cellPhone}"/>
					<label class="req" for="m_name">이메일</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value="${m_email}"/>
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


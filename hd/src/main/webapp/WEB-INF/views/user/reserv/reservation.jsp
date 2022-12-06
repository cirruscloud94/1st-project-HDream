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
								${goodsReg_optionName}
								<input type="hidden" name="goodsReg_Idx" value="${goodsReg_Idx}">
								</td>
								<td>
								${goodsReg_price}
								<input type="hidden" name="goodsReg_Idx" value="${goodsReg_Idx}">
								</td>
							</tr>
							<tr>
								<td>쉼마루(휴식) 1시간 + 커피/음료</td>
								<td>6000원</td>
							</tr>
							<tr>
								<td>시원마루(안마) 30분 + 커피/음료</td>
								<td>6000원</td>
							</tr>
							<tr>
								<td>시원마루(안마) 1시간 + 커피/음료</td>
								<td>10000원</td>
							</tr>
							<tr>
								<td>대화마루(라운지) 1시간 + 커피/음료</td>
								<td>3000원</td>
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
						<i class="fa-solid fa-user-check"> 인원선택</i>
					</button>
				</summary>
			<br/>
				<div>인원을 선택해주세요</div>
			</details>
		</div>
		
		<hr>
	</div>
	
	<form action="/reserv" method="post" onsubmit="">	
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
			<div>옵션명: 꿈마루(수면) 1시간 + 커피/음료 ${goodsReg_optionName}</div>
			<div>인원: 1명 ${goodsReg_people}</div>
			<div>가격: 7000원 ${goodsReg_price} </div>
		</div>
		<hr>
		<div class="txt_center">
			<h3>예약자 정보</h3>
			<ul class="reserv_info txt_left">
				<li class="m_name">
					<label class="req" for="m_name">예약자</label>
					<input type="text" id="m_name" class="req" name="m_name" maxlength="30" value=""/>
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

<script>
function showOption(data) 
{
	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty(); //.empty 해당 요소 내용을 지움 ex. body 변수 태그 안의 내용을 제거
	
	if(total == 0) 
	{
		var str = "<tr>"
				+ "<td> 선택가능한 옵션이 없습니다.</td>"
				+ "</tr>";
		
		body.append(str); //.append 해당 태그 마지막 위치에 요소를 추가
		
	} else 
	{
		var params = 
		{
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				eventName : "showOption"
		};
		
		gfn_renderPaging(params);
		
		var str = "";
		$.each(data.list, function(key, value)
		{
			str += "<tr>" 
			+ "<td>" + value.IDX + "</td>" 
			+ "<td class='title'>" 
			+ "<a href='#this' name='title'>"+ value.TITLE + "</a>" 
			+ "<input type='hidden' id='IDX' value=" + value.IDX + ">"
			+ "</td>" + "<td>" + value.HIT_CNT + "</td>" 
			+ "<td>" + value.CREA_DTM + "</td>" + "</tr>";
		});
		
		body.append(str);
		
		$("a[name='title']").on("click", function(e)
		{ //제목 
	        e.preventDefault();
	        fn_openBoardDetail($(this));
	    });
	}
}
</script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</body>
</html>


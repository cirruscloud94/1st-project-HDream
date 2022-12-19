<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf" %>
 
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>


<div class="main_wrap">

	<table class="board_view">
		<tbody>
			<tr>
				<th scope="row" style="width: 90px;">카페 번호</th>
				<td style="width: 250px;">${map.CAFE_IDX }</td>	
				<th scope="row" style="width: 90px;">작성자</th>
				<td style="width: 250px;">${map.CAFE_OWN_ID }</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td>${map.viewcafetel }</td>
				<th scope="row">등록날짜</th>
				<td>${map.CAFE_REG_DATE }</td>
			</tr>
			<tr>
				<th scope="row">카페이름</th>
				<td colspan="3">${map.CAFE_NAME }</td>
			</tr>
			<tr>
				<th scope="row">주소</th>
				<td colspan="3">${map.CAFE_LOCATION }</td>
			</tr>
			<tr>
				<th scope="row">오픈시간</th>
				<td>${map.viewcafeopenhour }</td>
				<th scope="row">마감시간</th>
				<td>${map.viewcafeclosehour }</td>
			</tr>
			<tr>
				<th scope="row">휴무요일</th>
				<td>${map.cafeoffday }</td>
				<th scope="row">주차여부</th>
				<td>${map.CAFE_PARKING }</td>
			</tr>
			<tr>
				<th scope="row">업주계좌정보</th>
				<td colspan="3">${map.CAFE_ACCOUNTINFO }</td>
			</tr>
			<tr>
				<th scope="row">상세정보</th>
				<td colspan="3">${map.CAFE_CONTENTS }</td>
			</tr>
			<tr>
				<th scope="row">이용/취소안내</th>
				<td colspan="3">${map.CAFE_NOTICE }</td>
			</tr>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>

</div>
</main>	

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){
				e.preventDefault();
				fn_openBoardUpdate();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/owner/openCafeList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.CAFE_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/owner/openCafeUpdate' />");
			comSubmit.addParam("CAFE_IDX", idx);
			comSubmit.submit();
		}
	</script>

<%@ include file="/WEB-INF/include/cafeinclude-body.jspf" %>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
	
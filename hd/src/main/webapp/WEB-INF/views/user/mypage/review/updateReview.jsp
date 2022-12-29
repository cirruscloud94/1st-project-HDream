<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<style>
main article{ max-width: 600px; margin: 40px auto; }

textarea { padding: 5px 7px; resize: none; width:100%; height:130pt;}
input #star { width:100%; }

#reviewStars fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
}
#reviewStars input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#reviewStars label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#reviewStars label:hover{
    text-shadow: 0 0 0 #674ea7; /* 마우스 호버 */
}
#reviewStars label:hover ~ label{
    text-shadow: 0 0 0 #674ea7; /* 마우스 호버 뒤에오는 이모지들 */
}
#reviewStars fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#reviewStars fieldset legend{
    text-align: left;
}
#reviewStars input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #674ea7; /* 마우스 클릭 체크 */
}
span {
	font-size: 1em;
}
</style>
<main class="layoutCenter">
			<article>
	<h1 class="txt_center">리뷰 수정💌</h1>
	<br/>
	<h3 class="txt_center">${r_cafe_name}💤</h3>
			<form action="./updateReview" onsubmit="return check()"  name="reviewStars" id="reviewStars"  method="post" class="txt_center">
		<table>
			<tbody>
				<tr>
					<td>
						<textarea id="v_contents" class="view_text" name="v_contents" >${v_contents}</textarea>
					</td>
<!-- 						<td><input type="text" id="v_contents" name="v_contents" style="width: 400px;"></input></td> -->
				</tr>
				
				<tr>
					<td>
						<fieldset>
					        <legend>이모지 별점</legend>
					        <input type="radio" name="v_star" value="5" id="rate1"><label for="rate1">⭐</label>
					        <input type="radio" name="v_star" value="4" id="rate2"><label for="rate2">⭐</label>
					        <input type="radio" name="v_star" value="3" id="rate3"><label for="rate3">⭐</label>
					        <input type="radio" name="v_star" value="2" id="rate4"><label for="rate4">⭐</label>
					        <input type="radio" name="v_star" value="1" id="rate5"><label for="rate5">⭐</label>	      
					    </fieldset>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<input type="hidden" name="v_idx" value="${v_idx}"><!--리뷰 -->
        <input type="hidden" name="v_o_idx" value="${v_o_idx}"><!-- 옵션번호 -->
        <input type="hidden" name="v_c_idx" value="${v_c_idx}"><!-- 카페번호 -->
		<button class="btn submit">수정하기
		
		</button>
		<a href="/user/mypage/review/reviewList" class="btn">목록으로</a>
		<input type="hidden" id="v_r_idx" name="v_r_idx" value="${v_r_idx}">
	</form>
</article>		

<script type="text/javascript">

function check() {
	var contents = document.querySelector("#v_contents").value; //내용
	var Category1 = $('#rate1');

	if (contents == "" || contents == null) {
		alert("리뷰를 작성해주세요.");
		return false;
	}
	if($(':radio[name="v_star"]:checked').length < 1){
		alert('별점을 선택해주세요.');						
		
		return false;
		}

	}	  
</script>		

<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
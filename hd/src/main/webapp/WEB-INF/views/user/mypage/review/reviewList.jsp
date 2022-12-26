<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->

<main class="layoutCenter">

				<form action="./updateReview" method="post"class="txt_center">
					<table>
					<c:choose>
						<c:when test="${!empty list}">
							<c:forEach items="${list}" var="i" varStatus="status">
								<tr>
									<td>옵션번호 : ${i.V_C_IDX}</td>
									<td>리뷰 : ${i.V_CONTENTS}</td>
									<td>별점 :${i.V_STAR}</td>
									<td>작성자 : ${i.R_ID}</td>
									<td>날짜 : ${i.V_REG_DATE}</td>
									<td>
										<a href="/user/mypage/review/updateForm" class="btn use_move" onclick="move(this, 'in', 'v_idx', 'v_contents', 'v_star')">
											수정
											<input type="hidden" name="v_idx" value="${i.V_IDX}">
											<input type="hidden" name="v_contents" value="${i.V_CONTENTS}">
											<input type="hidden" name="v_star" value="${i.V_STAR}">
										</a>
									</td>
									<td>
										<a href="/user/mypage/review/deleteReview" class="btn use_move" onclick="move(this, 'in', 'v_idx'); delete();">
											리뷰삭제
											<input type="hidden" name="v_idx" value="${i.V_IDX}">
										</a>
									</td>
									<td>
										
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td>조회된 결과가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</table>
					</form>
							
						
						<br><br>
						<script type="text/javascript">
						
						function delete()
						{
						    var result = confirm("실행하시겠어요 ?");

						    if(result)
						    {
						        document.write("<h1> 실행합니다. </h1>")
						    }
						    else
						    {
						        document.write("<h1> 실행하지 않습니다. </h1>")
						    }
						}
						
						</script>
					
				

<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
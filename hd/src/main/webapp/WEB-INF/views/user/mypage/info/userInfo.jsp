<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
		<h1>나의 정보관리</h1>

		<c:if test="${userInfo != null}">
		
			<span class="color">${m_name}님의 마이페이지입니다 :)</span>
			<br><br>
					<div class="txt_center color">
						<div>
							<img alt="" src="https://iboardpro.com/iBoard/Skin/iBoard/iCardTwine/image/UnknownPerson.png" width="150px">
						</div>
						<div class="txt_big">
							${fn:substring(userInfo.M_ID,0,2)}
							<c:forEach begin="3" end="${fn:length(userInfo.M_ID)}" step="1">
								*
							</c:forEach>
						</div>
						<div>
							since <fmt:formatDate value="${userInfo.M_REG_DATE}" type="date" />
						</div><br>
						<table>
							<thead>
							<tr>
								<th>NAME</th>
								<th>PW</th>
								<th>E-MAIL</th>
							</tr>
							</thead>
							<tr>
								<td>
									${userInfo.M_NAME}
								</td>
								<td>
									${fn:substring(userInfo.M_PW,0,2)}
									<c:forEach begin="3" end="${fn:length(userInfo.M_PW)}" step="1">
										*
									</c:forEach>
								</td>
									<td>
									<c:if test="${!empty userInfo.M_EMAIL}">
										${fn:substring(userInfo.M_EMAIL,0,2)}
										<c:set var="email" value="${fn:split(userInfo.M_EMAIL,'@')}" />
										<c:forEach begin="3" end="${fn:length(email[0])}" step="1">
											*
										</c:forEach>
										@${email[1]}
									</c:if>
								</td>
							</tr>

							<!-- 사장님이라면 사업자 번호를 표시 -->
						
						</table>
						<table>
							<thead>
								<tr>
									<th>TYPE</th>
									<th>CELLPHONE</th>
									<th>
										<c:if test="${userInfo.M_TYPE == 1}">
											BUSSINESS NO.
										</c:if>		
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>
										<c:if test="${userInfo.M_TYPE==0}"> 일반회원 </c:if>
										<c:if test="${userInfo.M_TYPE==1}"> 사업주 </c:if>
										<c:if test="${userInfo.M_TYPE==2}"> 관리자 </c:if>
									</th>
									<th>
										${fn:substring(userInfo.M_CELLPHONE,0,3)}-
										****-
										${fn:substring(userInfo.M_CELLPHONE,7,11)}
									</th>
									<th>${userInfo.M_OWN_NUM}</th>
								</tr>		
							</tbody>
						</table>
					
				</div>
				<br>
				<div class="txt_right">				
					<a class="btn" href="/user/mypage/info/userCheck">정보 수정 및 회원 탈퇴</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br>
		</c:if>

	</div>

</main>
<!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf"%>
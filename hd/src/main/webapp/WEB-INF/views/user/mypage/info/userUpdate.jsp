<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<script src="/resources/js/join.js"></script>
<script>
	var result = "${empty result?null:result}";
</script>
<link rel="stylesheet" type="text/css" href="/resources/css/join.css"/>
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<h1 class="txt_center">정보수정</h1>
	<form action="/user/mypage/info/updateUserInfo" method="post" onsubmit="return check_form()">
		<ul class="user_info">
			<br><br>
			<li class="m_name">
				<label class="req" for="m_name">수정 이름</label>
				<input type="text" id="m_name" value="${userInfo.M_NAME}" class="req" name="M_NAME" maxlength="30"/>
			</li>
			<li>
				<label class="req" for="m_id">아이디</label>
				<span class="need_confirm">
					${userInfo.M_ID}
				<input type="hidden" name="M_ID" value="${userInfo.M_ID}">
				</span>
			</li>
			<li>
				<label class="req" for="m_pw">수정 비밀번호</label>
				<input type="password" id="m_pw" value="${userInfo.M_PW}" class="req" name="M_PW" minlength="8" maxlength="15"/><br>
				<span class="need_confirm">
					<input type="password" id="m_pw2" class="req" name="m_pw2" minlength="8" maxlength="15" placeholder="비밀번호 확인"/>
				</span>
				<p class="help">비밀번호는 8~15자의 영문 대소문자, 숫자 및 특수문자로 입력해주세요.</p>
			</li>
			<li>
				<label class="req" for="m_cellphone">핸드폰 번호</label>
				<span class="need_confirm">
					<input type="tel" id="m_cellphone" value="${userInfo.M_CELLPHONE}" class="req" name="M_CELLPHONE" maxlength="11" placeholder="'-'를 제외한 휴대폰번호를 입력해 주세요" data-check-type="number"/>
					<input type="hidden" id="m_cellphone_chk" name="m_cellphone_chk" value=""/>
				</span>
				<input type="button" class="btn" onclick="check_phone()" value="인증번호 전송"/>
				<div class="need_confirm displaynone">
					<input type="number" id="check_p_num" class="req" name="check_p_num" maxlength="4" placeholder="인증번호 4자리를 입력해 주세요"/>
					<i class="time">05:00</i>
				</div>
			</li>
			<li>
				<label for="m_email1">이메일</label>
				<c:set var="email" value="${fn:split(userInfo.M_EMAIL,'@')}" />
				<input type="text" value="${email[0]}" id="m_email1" name="m_email1"/> @ <input type="text" id="m_email2" value="${email[1]}" name="m_email2"/>
				<select name="m_email3" id="m_email3" onchange="mail_domain();" title="이메일 도메인 선택">
					<option value="*" disabled>선택하세요.</option>
					<option value="" selected>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
				<input type="hidden" id="m_email" name="M_EMAIL" value="${userInfo.M_EMAIL}"/>
			</li>
		</ul>
		
		<input class="btn submit" type="submit" value="수정하기"/>
	</form>
	<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
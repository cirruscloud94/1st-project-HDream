<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script src="/resources/js/find_info.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/join.css"/>
<link rel="stylesheet" type="text/css" href="/resources/css/find_info.css"/>
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<h1 class="txt_center">계정 정보 찾기</h1>
	<form onsubmit="return check_form(this)">
		<div class="tab_radio find_type">
			<input type="radio" id="findId" name="find_type" value="id" ${(find_type eq 'id')?"checked":""}/>
			<label for="findId">아이디 찾기</label>
			<input type="radio" id="resetPw" name="find_type" value="pw" ${(find_type eq 'pw')?"checked":""}/>
			<label for="resetPw">비밀번호 찾기</label>
		</div>
		<ul class="user_info">
			<c:if test="${find_type eq 'pw'}">
				<li>
					<label class="req" for="m_id">아이디</label>
					<input type="text" id="m_id" class="req" name="m_id" minlength="4" maxlength="15" data-check-type="alphabet_number"/>
				</li>
			</c:if>
			<li class="m_name">
				<label class="req" for="m_name">이름</label>
				<input type="text" id="m_name" class="req" name="m_name" maxlength="30"/>
			</li>
			<li>
				<label class="req" for="m_cellphone">핸드폰 번호</label>
				<span class="need_confirm">
					<input type="tel" id="m_cellphone" class="req" name="m_cellphone" maxlength="11" placeholder="'-'를 제외한 휴대폰번호를 입력해 주세요" data-check-type="number"/>
					<input type="hidden" id="m_cellphone_chk" name="m_cellphone_chk" value=""/>
				</span>
				<input type="button" class="btn" onclick="check_phone()" value="인증번호 전송"/>
				<div class="need_confirm displaynone">
					<input type="number" id="check_p_num" class="req" name="check_p_num" maxlength="4" placeholder="인증번호 4자리를 입력해 주세요"/>
					<i class="time">05:00</i>
				</div>
			</li>
			<li><input class="btn submit" type="submit" value="인증하기"/></li>
		</ul>
		<hr>
		<ul class="a_wrap flexCenter">
			<li><a href="/login">로그인</a></li>
			<li><a href="/join">회원가입</a></li>
		</ul>
	</form>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
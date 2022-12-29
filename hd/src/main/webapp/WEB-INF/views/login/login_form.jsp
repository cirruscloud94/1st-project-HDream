<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="/resources/js/login.js"></script>
<script src="/resources/js/sns_login.js"></script>
<script>var type = "${empty m_type?null:m_type}"; var result = "${empty result?null:result}"; var resultMsg = "${empty resultMsg?null:resultMsg}"; var logout = "${empty param.logout?null:param.logout}";</script>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css"/>
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<h1 class="txt_center">로그인</h1>
	<form action="/login" method="post" onsubmit="return check_form()">
		<ul>
			<li><span class="id"><input type="text" id="m_id" class="req" name="m_id" maxlength="15" data-check-type="alphabet_number" placeholder="아이디"/></span></li>
			<li><span class="pw"><input type="password" id="m_pw" class="req" name="m_pw" maxlength="15" placeholder="비밀번호"/></span></li>
		</ul>
		<input class="btn submit" type="submit" value="로그인"/>
	</form>
	<ul class="a_wrap flexCenter">
		<li><a href="/login/findId">아이디 찾기</a></li>
		<li><a href="/login/resetPw">비밀번호 재설정</a></li>
		<li><a href="/join">회원가입</a></li>
	</ul>
	<div class="sns_wrap">
		<p class="flexCenter"><span>간편 로그인</span></p>
		<ul class="sns_btn_wrap flexCenter">
			<li id="naverIdLogin"></li>
		</ul>
	</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
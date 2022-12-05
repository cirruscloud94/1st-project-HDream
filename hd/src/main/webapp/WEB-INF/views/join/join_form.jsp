<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<script src="/resources/js/join.js"></script>
<script>
	$(function(){
		err_alert(${empty result?"":result});
	});
	function err_alert(result){
		//앞/뒤로가기 버튼으로 이동한 경우
		if(result == null || history.state){ $("input[type='text'], input[type='tel'], input[type='number']").val(""); return; }
		if(result == "success"){//성공값이 넘어오면 
			alert("회원가입에 성공하셨습니다!\n로그인을 진행해 주세요!");
			location.href = "/login";
			return;
		}else {//에러값이 넘어온다면
			alert("회원가입에 실패하셨습니다!");
			console.log(${err});
			return;
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="/resources/css/join.css"/>
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<h1 class="txt_center">회원가입</h1>
	<form action="/join" method="post" onsubmit="return check_form()">
		<ul class="user_info">
			<li class="tab_radio">
				<input type="radio" id="mem" name="m_type" value="0" ${(m_type != 1)?"checked":""}/>
				<label for="mem">일반 회원가입</label>
				<input type="radio" id="own" name="m_type" value="1" ${(m_type == 1)?"checked":""}/>
				<label for="own">사업자 회원가입</label>
			</li>
			<li class="m_name">
				<label class="req" for="m_name">${(m_type != 1)?"이름":"상호"}</label>
				<input type="text" id="m_name" class="req" name="m_name" maxlength="30"/>
			</li>
			<c:if test="${m_type == 1}">
			<li>
				<label class="req" for="m_own_num">사업자번호</label>
				<span class="need_confirm">
					<input type="number" id="m_own_num" class="req" name="m_own_num" minlength="10" maxlength="10" placeholder="'-'를 제외한 사업자번호 10자리를 입력해주세요"/>
					<input type="hidden" id="m_own_num_chk" name="m_own_num_chk" value=""/>
				</span>
				<input type="button" class="btn" onclick="check_m_own_num()" value="사업자 번호 인증"/>
				<p class="help">정상적인 사업자 등록 번호를 입력했으나 인증에 문제가 있을 경우,<br>국세청 고객센터(<a href="tel:126">126</a>)로 문의 바랍니다.</p>
			</li>
			</c:if>
			<li>
				<label class="req" for="m_id">아이디</label>
				<span class="need_confirm">
					<input type="text" id="m_id" class="req" name="m_id" minlength="4" maxlength="15" data-check-type="alphabet_number"/>
					<input type="hidden" id="m_id_chk" name="m_id_chk" value=""/>
				</span>
				<input type="button" class="btn" onclick="check_id()" value="중복 확인"/>
				<p class="help">아이디는 영문소문자 또는 숫자 4~15자로 입력해 주세요.</p>
			</li>
			<li>
				<label class="req" for="m_pw">비밀번호</label>
				<input type="password" id="m_pw" class="req" name="m_pw" minlength="8" maxlength="15"/><br>
				<span class="need_confirm">
					<input type="password" id="m_pw2" class="req" name="m_pw2" minlength="8" maxlength="15" placeholder="비밀번호 확인"/>
				</span>
				<p class="help">비밀번호는 8~15자의 영문 대소문자, 숫자 및 특수문자로 입력해주세요.</p>
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
			<li>
				<label for="m_email1">이메일</label>
				<input type="text" id="m_email1" name="m_email1"/> @ <input type="text" id="m_email2" name="m_email2"/>
				<select name="m_email3" id="m_email3" onchange="mail_domain();" title="이메일 도메인 선택">
					<option value="*" disabled>선택하세요.</option>
					<option value="" selected>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
				<input type="hidden" id="m_email" name="m_email"/>
			</li>
		</ul>
		<ul class="agreements">
			<li>
				<label><input type="checkbox" id="agreeAll" name="agree" value="all"> <strong>이용약관 전체 동의</strong></label>
			</li>
			<li>
				<label class="flex flexBetween" for="agree01">
					<span>
						<input type="checkbox" id="agree01" class="req_chk" name="agree01" value="1">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim warn">필수</span><span> 개인정보 수집 및 이용</span>
					</span>
					<i class="fa-solid fa-chevron-down"></i>
				</label>
				<div class="slim_scroll">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</div>
			</li>
			<li>
				<label class="flex flexBetween" for="agree02">
					<span>
						<input type="checkbox" id="agree02" class="req_chk" name="agree02" value="2">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim warn">필수</span><span> 개인정보 제 3자 제공</span>
					</span>
					<i class="fa-solid fa-chevron-down"></i>
				</label>
				<div class="slim_scroll">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</div>
			</li>
			<li>
				<label class="flex flexBetween" for="agree03">
					<span>
						<input type="checkbox" id="agree03" name="agree03" value="3">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim normal">선택</span><span> 이벤트, 혜택 정보 수신 동의</span>
					</span>
					<i class="fa-solid fa-chevron-down"></i>
				</label>
				<div class="slim_scroll">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</div>
			</li>
			<li>
				<label class="flex flexBetween" for="agree04">
					<span>
						<input type="checkbox" id="agree04" name="agree04" value="4">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim normal">선택</span><span> 이벤트, 혜택 정보 전송을 위한 개인정보 수집 및 이용 동의</span>
					</span>
					<i class="fa-solid fa-chevron-down"></i>
				</label>
				<div class="slim_scroll">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</div>
			</li>
		</ul>
		<input class="btn submit" type="submit" value="가입하기"/>
	</form>
	<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
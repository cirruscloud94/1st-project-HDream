<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<script src="/resources/js/join.js"></script>
<script>
	var result = "${empty result?null:result}";
	$(function(){
		if(result == null || history.state){ $("input[type='text'], input[type='tel'], input[type='number']").val(""); return; }
	});
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
				<label class="req" for="m_name">이름</label>
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
				<span class="flexBetween">
					<label for="agree01">
						<input type="checkbox" id="agree01" class="req_chk" name="agree01" value="1">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim warn">필수</span><span> 개인정보 수집 및 이용</span>
					</label>
					<i class="fa-solid fa-chevron-down"></i>
				</span>
				<div class="slim_scroll">** 본 양식은 쇼핑몰 운영에 도움을 드리고자 샘플로 제공되는 서식으로 쇼핑몰 운영형태에 따른 수정이 필요합니다. 쇼핑몰에 적용하시기 전, 쇼핑몰 운영 사항 등을 확인하시고 적절한 내용을 반영하여 사용하시기 바랍니다. **(주)○○○은 (이하 "회사"는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 회사는 개인정보처리방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. ■ 수집하는 개인정보 항목 및 수집방법 가. 수집하는 개인정보의 항목 o 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다. - 회원가입시 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보 - 서비스 신청시 : 주소, 결제 정보 o 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다. 나. 수집방법 - 홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집 ■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. o 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스 o 회원 관리 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달 o 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 ■ 개인정보의 보유 및 이용기간 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. 가. 회사 내부방침에 의한 정보보유 사유  회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 oo년간 회원의 정보를 보유할 수 있습니다. 나. 관련 법령에 의한 정보 보유 사유 전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. o 계약 또는 청약철회 등에 관한 기록 -보존이유 : 전자상거래등에서의소비자보호에관한법률 -보존기간 : 5년 o 대금 결제 및 재화 등의 공급에 관한 기록 -보존이유: 전자상거래등에서의소비자보호에관한법률 -보존기간 : 5년 o 소비자 불만 또는 분쟁처리에 관한 기록 -보존이유 : 전자상거래등에서의소비자보호에관한법률 -보존기간 : 3년 o 로그 기록 -보존이유: 통신비밀보호법 -보존기간 : 3개월 ■ 개인정보의 파기절차 및 방법 회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. o 파기절차 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다. o 파기방법 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. ■ 개인정보 제공 회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. o 이용자들이 사전에 동의한 경우 o 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 ■ 수집한 개인정보의 위탁 회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다. o 위탁 대상자 : [택배사 이름] o 위탁업무 내용 : [택배사 위탁 내용] o 위탁 대상자 : [PG사 이름] o 위탁업무 내용 : [PG사 위탁 내용] o 위탁 대상자 : #supply_list# o 위탁업무 내용 : [위탁업무 내용] ■ 이용자 및 법정대리인의 권리와 그 행사방법 o 이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. o 이용자들의 개인정보 조회,수정을 위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. o 혹은 개인정보보호책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다. o 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다. o 회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다. ■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 회사는 귀하의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다. o 쿠키 등 사용 목적 1. 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공 2. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. o 쿠키 설정 거부 방법 1. 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 2. 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 3. 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. ■ 개인정보에 관한 민원서비스 회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호책임자를 지정하고 있습니다. o 개인정보보호담당자 성명 : OOO 소속 : OOO 전화번호 : OO-OOO-OOOO 이메일 : o 개인정보보호책임자 성명 : OOO 소속 : OOO 전화번호 : OO-OOO-OOOO 이메일 : o 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자 혹은 담당부서로 신고하실 수 있습니다. o 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. o 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다. 개인정보침해신고센터 (privacy.kisa.or.kr / 국번 없이 118) 개인정보분쟁조정위원회 (kopico.go.kr / 1833-6972) 대검찰청 사이버수사과 (spo.go.kr / 지역번호+1301) 경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)</div>
			</li>
			<li>
				<span class="flexBetween">
					<label for="agree02">
						<input type="checkbox" id="agree02" class="req_chk" name="agree02" value="2">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim warn">필수</span><span> 개인정보 제 3자 제공</span>
					</label>
					<i class="fa-solid fa-chevron-down"></i>
				</span>
				<div class="slim_scroll">아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다. - 제공 받는 자 : 광고업체 - 제공 항목 : 어쩌구 저쩌구 - 제공 목적 : 마케팅 - 보유 및 이용기간 : 3년 </div>
			</li>
			<li>
				<span class="flexBetween">
					<label for="agree03">
						<input type="checkbox" id="agree03" name="agree03" value="3">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim normal">선택</span><span> 이벤트, 혜택 정보 수신 동의</span>
					</label>
					<i class="fa-solid fa-chevron-down"></i>
				</span>
				<div class="slim_scroll">알림 보낼꺼야~ 많이 보낼꺼야</div>
			</li>
			<li>
				<span class="flexBetween">
					<label for="agree04">
						<input type="checkbox" id="agree04" name="agree04" value="4">
						<i class="fa-solid fa-check"></i>
						<span class="btn slim normal">선택</span><span> 이벤트, 혜택 정보 전송을 위한 개인정보 수집 및 이용 동의</span>
					</label>
					<i class="fa-solid fa-chevron-down"></i>
				</span>
				<div class="slim_scroll">개인정보 이용 목적 및 수집항목. 개인정보 이용 목적 및 수집항목. 항목	이용 목적	수집항목. 마케팅	상품 및 서비스 안내, 이벤트 정보 및 혜택 제공	성명, 휴대폰번호, 이메일주소, 생년월일, 마케팅 수신 동의여부. 보유기간. - 회원 탈퇴시 또는 동의 철회시. 동의를 거부할 권리 및 동의 거부에 따른 불이익 안내. 선택 개인정보의 경우 동의를 거부하실 수 있으며, 동의 거부 시에는 상기 이용목적에 명시된 서비스는 받으실 수 없습니다.</div>
			</li>
		</ul>
		<input class="btn submit" type="submit" value="가입하기"/>
	</form>
	<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
let inputs = {};
function set_inputs(){
	//인풋 세팅
	let _input = document.querySelectorAll(".user_info input:not([id$='_chk'])");
	for(let i=0; i<_input.length; i++){
		inputs[_input[i].id] = _input[i];
	}
}
let helptxt = {
	ok: "인증이 완료되었습니다.",
	fail: "인증에 실패하셨습니다. 다시 인증을 시도해 주세요!",
	npattern: "유효한 값을 입력해 주세요!",
	req: "필수 입력사항 입니다!",
	chk_need: "인증이 필요한 항목입니다!",
	chk_p_neq: "인증번호가 일치하지 않습니다!",
	chk_p_timeout: "인증번호 입력 시간을 초과하였습니다.",
	chk_id: "아이디 중복확인이 필요합니다!",
	chk_own: "사업자 번호 인증이 필요합니다!",
	chk_cell: "핸드폰 번호 인증이 필요합니다!",
	id_use: "사용 가능한 아이디입니다!",
	id_nuse: "이미 존재하는 아이디입니다!\n다른 아이디를 입력해 주세요!",
	pw_min: "비밀번호는 최소 8자리 이상이어야 합니다!",
	pw_neq: "비밀번호가 일치하지 않습니다!",
	p_count: "핸드폰 번호 10자리를 입력해 주세요!",
	own_nstt: "휴업/폐업 상태의 사업자는 등록이 불가합니다!",
};
$(document).ready(function() {
	set_inputs();//인풋 세팅
	err_alert(result);//알럿 세팅
	//회원 유형 라디오 클릭에 따라 입력폼 변경
	$(".tab_radio input").on("click", function(){
		let form = document.getElementById("search");//제출 시 사용할 폼
		if(this.value == 1){
			document.getElementById("search").action = "/joinOwner";
			form.innerHTML = form.innerHTML + this.outerHTML.replace("radio","hidden\" checked");
			form.submit();
		}else{
			location.href="/join";
		}
	});

	/* =========이용약관 체크========= */
	agreements();

	/* =========입력값 감시========= */
	$(".user_info input:not([id$='_chk'])").on("change keyup paste input", function() {
		_this = $(this)[0];
		let type = _this.type;//타입 확인
		if(!isNull(_this.dataset.checkType)){ type = _this.dataset.checkType; }//입력값 제한 타입이 있다면 타입에 대입

		if(_this == inputs.m_pw || _this == inputs.m_pw2){//만약 비밀번호일 때
			chk_pw(_this);
			return;
		}else if(_this == inputs.check_p_num){//만약 인증번호일 때
			chk_input_filter(type, _this);
			chk_p_num(inputs.m_cellphone, inputs.check_p_num);
			return;
		}else if(_this == inputs.m_email1 || _this == inputs.m_email2){//만약 이메일일 때
			chk_mail(_this);
			return;
		}
		//그 외
		chk_input_filter(type, _this);
		return;
	});
});
//알럿 출력 함수
function err_alert(_result){
	if(isNull(_result)) return;
	if(_result == "success"){//성공값이 넘어오면 
		alert("회원가입에 성공하셨습니다!\n로그인을 진행해 주세요!");
		location.href = "/login";
		return;
	}else {//에러값이 넘어온다면
		alert("회원가입에 실패하셨습니다!");
		return;
	}
}
//입력값 제한 함수
function chk_input_filter(type, target){
	if(type == 'alphabet'){//영문만 허용
		target.value = target.value.replace(/[^a-zA-Z]/gi,""); return false;
	}else if(type == 'number'){//숫자만 허용
		target.value = target.value.replace(/[^0-9]/gi,""); return false;
	}else if(type == 'alphabet_number'){//영문 , 숫자만 허용
		target.value = target.value.replace(/[^a-zA-Z0-9]/gi,""); return false;
	}else if(type == 'non_spec'){//특수문자 비허용
		target.value = target.value.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/]/gi,""); return false;
	}else if(type == 'name'){//특수문자, 숫자 비허용
		target.value = target.value.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/0-9]/gi,""); return false;
	}else if(type == 'non_ko'){//한글 비허용
		target.value = target.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/gi,""); return false;
	}
	return true;
}
//비밀번호값 입력 시
function chk_pw(target){
	if(inputs.m_pw2.value.length <= 0){
		if(target.value.length < inputs.m_pw.minLength){
			help(inputs.m_pw2, helptxt.pw_min);
		}else { remove_help(inputs.m_pw2); }
		return;
	}else if(inputs.m_pw.value != inputs.m_pw2.value){//입력값이 다를 때
		help(inputs.m_pw2, helptxt.pw_neq);
		return;
	}
	remove_help(inputs.m_pw2); check_icon(inputs.m_pw2, true);
	return;
}
//인증번호 입력 시
function chk_p_num(target, num){
	if(num.value == chk_phone_num) {//인증번호 입력 값이 랜덤 생성된 번호와 일치하게 되면
		remove_help(target);//도움말 제거
		check_icon(target, true);//체크 아이콘 생성
		target.readOnly = "true";//데이터 수정 불가하도록 변경
		target.nextElementSibling.value = target.value;//~_chk 인풋 값 리셋
		target.closest("li").nextElementSibling.querySelector("input").focus();//다음 인풋 포커스
		num.parentElement.classList.add("displaynone");
		clearInterval(countDown);//카운트 다운 종료
		alert(helptxt.ok);
		return;
	}else{//일치하지 않는다면
		help(num, helptxt.chk_p_neq);
	}
}
//메일 입력 시
function chk_mail(target){
	chk_input_filter("non_ko", target);
	inputs.m_email.value = inputs.m_email1.value + "@" + inputs.m_email2.value;
}
//메일 선택 시
function mail_domain(){
	let select = document.getElementById("m_email3");
	let op = select.options[select.selectedIndex];
	//만약 직접입력을 선택했다면
	if(isNull(op.value)) { inputs.m_email2.readOnly = false; return; }
	//그 외
	inputs.m_email2.readOnly = true;
	inputs.m_email2.value = op.value;
	chk_mail(inputs.m_email2);
	inputs.m_email1.focus();
}

/* =========인증 버튼 클릭 시 작동========= */
//아이디 중복확인 버튼 클릭
function check_id(){
	let target = inputs.m_id;
	let msg = "";
	if(!isNull(target.value) && target.value.length >= target.minLength){
		$.ajax({
			url: "/join/confirmId",
			type: "POST",
			data: "&"+$("#"+target.id).serialize(),
			async: false,
			success: function(result, status){
				if(result.result == "success"){
					remove_help(target);//도움말 제거
					check_icon(target, true);//체크 아이콘 생성
					target.readOnly = "true";//데이터 수정 불가하도록 변경
					target.nextElementSibling.value = target.value;//~_chk 인풋 값 리셋
					target.closest("li").nextElementSibling.querySelector("input").focus();//다음 인풋 포커스
					msg = helptxt.id_use;//알럿 출력
				}else{
					check_icon(target, false);//체크 아이콘 있다면 제거
					target.nextElementSibling.value = "";//~_chk 인풋 값 리셋
					target.focus();//해당 인풋 포커싱
					msg = helptxt.id_nuse;//알럿 출력
					help(target, msg);//도움말 생성
				}
				if(!isNull(msg)) alert(msg);//알럿 출력
				return result;
			},
			error: function(result){
				console.log(result.responseText); //responseText의 에러메세지 확인
			}
		});
	}else{ help(target, helptxt.npattern); }
}
//사업자 번호 인증 버튼 클릭
function check_m_own_num(){
	let target = inputs.m_own_num;
	let msg = "";
	if(!isNull(target.value) && target.value.length >= target.minLength){
		$.ajax({
			url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=IphIdN5%2B0WY74RnCjSH6nP9w8Sr%2FPD%2BCFlfQODiZCfnlTzH4WGYKBSalhaBl6igM1dYQPmt6cZwfwG%2B2en3Q2Q%3D%3D",
			type: "POST",
			data: JSON.stringify({"b_no": [target.value]}), // json 을 string으로 변환하여 전송
			dataType: "JSON",
			contentType: "application/json",
			accept: "application/json",
			success: function(result) {
				if(result.data[0]["b_stt_cd"] == "01"){
					remove_help(target);//도움말 제거
					check_icon(target, true);//체크 아이콘 생성
					target.readOnly = "true";//데이터 수정 불가하도록 변경
					target.nextElementSibling.value = target.value;//~_chk 인풋 값 리셋
					target.closest("li").nextElementSibling.querySelector("input").focus();//다음 인풋 포커스
					msg = helptxt.ok;//알럿 출력
				}else{
					msg = helptxt.own_nstt;//알럿 출력
					if(isNull(result.data[0]["b_stt_cd"])) msg = result.data[0]["tax_type"];
					help(target, msg);//도움말 생성
					check_icon(target, false);//체크 아이콘 있다면 제거
					target.nextElementSibling.value = "";//~_chk 인풋 값 리셋
					target.focus();//해당 인풋 포커싱
				}
				if(!isNull(msg)) alert(msg);//알럿 출력
				return result;
			},
			error: function(result) {
				console.log(result.responseText); //responseText의 에러메세지 확인
			}
		});
	}else{ help(target, helptxt.npattern); }
}
//핸드폰번호 인증 버튼 클릭
let chk_phone_num = 0;//랜덤 인증번호
let countDown;//카운트다운 함수
function check_phone(){
	let target = inputs.m_cellphone;
	let chk_num = inputs.check_p_num;//인증번호 입력 인풋
	if(!isNull(target.value) && target.value.length == 11){
		chk_phone_num = parseInt(Math.random()*10000);//랜덤 번호 생성
		alert(chk_phone_num);
		check_icon(target, false);//체크박스 제거
		chk_num.textContent = "";//입력값 초기화
		chk_num.parentElement.classList.remove("displaynone");//인증번호 입력란 보이게 변경
		chk_num.focus();//포커싱
		chk_num.nextElementSibling.textContent = "1:00";//카운트다운값 초기화 변경
		//1초마다 카운트다운
		countDown = setInterval(function(){
			let num = document.querySelector(".time").textContent.split(":");
			if(num[1] == "00"){
				if(num[0] == "0") {
					alert(helptxt.chk_p_timeout);
					clearInterval(countDown);//카운트 다운 종료
					help(chk_num, helptxt.fail);
					return false;
				}
				num[1] = 60;
				num[0] = num[0] - 1;
			}
			num[1] = num[1] - 1;
			num[1] = (parseInt(num[1]/10) == 0)?"0"+num[1]:num[1];
			chk_num.nextElementSibling.textContent = num[0]+":"+num[1];
		}, 1000);
	}else{
		help(target, helptxt.p_count);
	}
}

/* =========이용약관 클릭 시 작동========= */
function agreements(){
	let agreeAll = document.getElementById("agreeAll");
	let agrees = document.querySelectorAll("input[id^='agree0']");
	let checked_agrees = document.querySelectorAll("input[id^='agree0']:checked");
	if(isNull(agreeAll)) return;
	agreeAll.addEventListener("click", function(){
		let flag = true;
		if(this.checked){ flag = true; }else{ flag = false; }
		for (let i = 0; i < agrees.length; i++) {
			agrees[i].checked = flag;
		}
	});
	for (let i = 0; i < agrees.length; i++) {
		agrees[i].addEventListener("click", function(){
			if(checked_agrees.length != agrees.length){ agreeAll.checked = false; } else{ agreeAll.checked = true; }
		});
		agrees[i].closest("li").querySelector(".fa-chevron-down").addEventListener("click", function(){
			this.closest("li").classList.toggle("on");
		});
	}
}

/* =========회원가입폼 제출 전 유효성 검증========= */
function check_form(){
	if(!check_confirm()) return false;//인증 여부 검사
	if(!check_req()) return false;//필수 입력값 입력 여부 검사
	if(!checkbox_req()) return false;//필수 약관 동의 여부 검사
	return true;
}
//필수 입력값 검사
function check_req(){
	let req_input = document.querySelectorAll("input.req");
	let flag = true;
	let focus = 0;
	if(!isNull(req_input) && req_input.length > 0){
		for(let i=0; i< req_input.length; i++){
			if(isNull(req_input[i].value)){
				focus++;
				if(focus == 1) req_input[i].focus();
				help(req_input[i], helptxt.req);
				check_icon(req_input[i], false);
				flag = false;
			}else{
				remove_help(req_input[i]);
			}
		}
	}
	return flag;
}
//필수 체크박스 체크여부 검사
function checkbox_req(){
	let req_checkbox = document.querySelectorAll(".req_chk[type='checkbox']");
	if(!isNull(checkbox_req) && req_checkbox.length > 0){
		for(let i=0; i< req_checkbox.length; i++){
			if(!req_checkbox[i].checked){
				alert("약관에 동의해주세요!");
				return false;
			}else{ return true; }
		}	
	}
	return true;
}
//인증 여부 검사
function check_confirm(){
	let confirm_input = document.querySelectorAll("input[id$='_chk']");
	let flag = true;
	let focus = 0;
	if(!isNull(confirm_input) && confirm_input.length > 0){
		for(let i=0; i< confirm_input.length; i++){
			if(confirm_input[i].value.length <=0 ){
				let text = helptxt.chk_need;
				if(confirm_input[i].id.lastIndexOf("id") > 0){
					text = helptxt.chk_id; flag = false;
				}else if(confirm_input[i].id.lastIndexOf("own") > 0){
					text = helptxt.chk_own; flag = false;
				}else if(confirm_input[i].id.lastIndexOf("cell") > 0){
					text = helptxt.chk_cell; flag = false;
				}
				focus++;
				help(confirm_input[i], text);
			}
			if(focus == 1) document.getElementById(confirm_input[i].id.split("_chk")[0]).focus();
		}
	}
	return flag;
}

/* =========검증 결과 출력========= */
//안내문구 생성 함수
function help(target, text){
	target = target.closest("li");
	let warn = target.querySelector(".warn");
	if(warn != null){
		warn.textContent = text;
	}else{
		let help = document.createElement("p");//안내문구
		help.classList.add("help");
		help.classList.add("warn");
		help.textContent = text;
		target.append(help);
	}
	check_icon(target, false);
}
function remove_help(target){
	let warn = target.closest("li").querySelector(".warn");
	if(warn != null) warn.remove();
}
//체크 생성/제거 함수
function check_icon(target, event){
	let check = null;
	if(event){//생성
		check = document.createElement("i");
		check.classList.add("fa-solid");
		check.classList.add("fa-check");
		target.closest(".need_confirm").append(check);
	}else if(target.closest("li").querySelector(".fa-check") != null){//제거
		target.closest("li").querySelector(".fa-check").remove();
	}
}
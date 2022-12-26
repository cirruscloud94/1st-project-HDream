$(document).ready(function() {
	err_alert(result, resultMsg);
	/* =========아이디 입력값 감시========= */
	$("#m_id").on("change keyup paste input", function() {
		_this = $(this)[0];
		_this.value = _this.value.replace(/[^a-zA-Z0-9]/gi,"");
		return;
	});
});

//알럿 출력 함수
function err_alert(result, resultMsg){
	//앞/뒤로가기 버튼으로 이동한 경우
	if(isNull(result) || (window.performance && window.performance.navigation.type == 2)){ $("input[type='text'], input[type='tel'], input[type='number']").val(""); return; }
	if(!isNull(resultMsg)) alert(resultMsg);
	if(result == "success"){//성공값이 넘어오면
		let re_url = "/main";
		if(type == 2) re_url = "/admin/userList";
		return location.href = re_url;
	}
	return;
}

/* =========로그인폼 제출 전 유효성 검증========= */
function check_form(){
	let req_input = document.querySelectorAll("input.req");
	let flag = true;
	let focus = 0;
	if(req_input.length > 0){
		for(let i=0; i< req_input.length; i++){
			if(isNull(req_input[i].value)){
				focus++;
				if(focus == 1) req_input[i].focus();
				help(req_input[i], "필수 입력사항 입니다!");
				flag = false;
			}else{
				remove_help(req_input[i]);
			}
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
}
function remove_help(target){
	let warn = target.closest("li").querySelector(".warn");
	if(warn != null) warn.remove();
}
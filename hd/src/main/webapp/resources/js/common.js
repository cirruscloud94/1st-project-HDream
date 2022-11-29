document.addEventListener("scroll", function(){
    let header = document.getElementsByTagName("header")[0];
    if (window.scrollY > 0) { header.classList.add("on"); } else { header.classList.remove("on"); }
});

$(document).ready(function() {
    $("#search .types input").on("click", function(){
        document.getElementById("search").submit();
    });
    //use_move 클래스의 a 태그 클릭 시 href 작동 중지
    $(".use_move").on("click", function(e){ e.preventDefault(); });
    
	let nav = document.querySelector("nav");
    if(nav != null && window.innerWidth <= 1200){
    	let target_li = document.querySelector("header .sub_pages ."+nav.classList.value);
    	target_li.parentElement.insertBefore(nav, target_li);
    }
});

/* a태그 클릭 시 form 제출로 바꿔서 이동시키는 함수.
	a 태그 세팅
	클래스 명: use_move
	href: form을 제출할 링크. (단, 제출할 링크가 /main 이라면 #을 작성해도 됨.)
	onclick: move(파라미터)
*/
function move(target, where, ...param){
	/*
	target: 무조건 this
	where: 전달시키려는 input이 a 태그 내부일 경우 in, 부모일 경우 out
	param: 전달시키려는 input의 name을 따옴표(" 또는 ')로 감싸 적어줄것!
	*/
	let form = document.getElementById("search");//제출 시 사용할 폼
	let tag = "";
	if(target.href != "#"){ form.action = target.href; }//폼의 제출처 바꾸기
	if(where == "out"){ target = target.parentElement; }
	
	//input 처리
	for(let i=0; i<param.length; i++){
		let _inputs = target.querySelectorAll("input[name='"+param[i]+"']");
		for(let j=0; j<_inputs.length; j++){
			tag += _inputs[j].outerHTML;
		};
	}
	form.innerHTML = form.innerHTML + tag;
	form.submit();
}

function silde_header(){
	document.querySelector("header").classList.toggle("show");
}
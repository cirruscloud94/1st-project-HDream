let date = $("input[name='reg_date']").val();

$(function () {
    //처음 DOM 로딩 시 첫번째 상세보기 내용만 보이도록 처리
    contents.hide();//모든 내용 숨기기
    contents.filter(":first-child").show();//첫번째만 보이기
    
    show_contents();//라디오 클릭에 따른 보이기

    
    let change = (date) => {
        $("span .today").innerHTML =
        elapsedTime(date);
    }
    
});

function elapsedTime(date)
{
    let regDate = new Date(date);  //등록 날짜 및 시간

    let now = new Date(); // 현재 날짜

    let afterTime = (now - regDate); // 경과시간

    let times = 
    [
        {name: '년', milliSeconds: 60 * 60 * 24 * 365},
        {name: '개월', milliSeconds: 60 * 60 * 24 * 30},
        {name: '일', milliSeconds: 60 * 60 * 24},
        {name: '시간', milliSeconds: 60 * 60},
        {name: '분', milliSeconds: 60}
    ];

    // 년 단위부터 알맞는 단위 찾기
    for(let value of times)
    {
        let betweenTime = Math.floor(afterTime / value.milliSeconds);

        // 큰 단위는 0보다 작은 소수 단위 나옴
        if(betweenTime > 0)
        {
            return '${betweenTime}${value.name} 전';
        }
    }
    // 모든 단위가 맞지 않을 시
    return "방금 전";
}

//라디오 클릭에 따라 상세보기 변경 함수
let contents = $(".content_wrap").children();//상세보기 내용들

function show_contents(){
    if(contents.length <= 1) return false;//상세보기 내용이 없다면 함수 종료
    $(".tab_radio label").on("click", function () {//라디오의 라벨 클릭 시
        contents.hide();//모든 내용 숨기기
        //클릭한 라벨의 for 속성값과 동일한 클래스명의 상세보기 내용만 보이게 처리
        contents.filter("."+$(this).attr("for")).show();
    });
}

function zzim1() {
    alert("카페가 찜 되었어요!");
    return true;
}

function zzim2() {
    alert("카페 찜이 삭제되었어요!");
    return true;
}

/* 이미지 이동 */
const slides = document.querySelector('.main_img');//전체 슬라이드 컨테이너
const slideimg = document.querySelectorAll('.main_img li');//모든 슬라이드들
let currentIdx = 0;//현재 슬라이드
const slideCount = slideimg.length;//슬라이드 개수
const prev = document.querySelector('#prev');//이전버튼
const next = document.querySelector('#next');//다음버튼
const slideWidth= 450;//한개의 슬라이드 넓이
const slideMargin = 50;//한개의 슬라이드의 마진값

//전체 슬라이더 컨테이너 넓이 설정
slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num){
	slides.style.left = -num*500 + 'px';
	currentIdx = num;
}

prev.addEventListener('click', function(){
//첫번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx!=0일때만 moveSlide 함수 불러옴
	if(currentIdx!==0) moveSlide(currentIdx -1);
});

next.addEventListener('click', function(){
//마지막 슬라이드도 마찬가지
	if(currentIdx!==slideCount -1){
		moveSlide(currentIdx + 1);
		}
});
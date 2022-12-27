// let regex = /[^0-9]/g; // 숫자가 아닌 문자열 제거식
let reg_date = $("#v_reg_date").val()  // 등록시간
let regDate = reg_date.substring(0, 16) // '2022-12-26 10:00'

$(function () {
    //처음 DOM 로딩 시 첫번째 상세보기 내용만 보이도록 처리
    contents.hide();//모든 내용 숨기기
    contents.filter(":first-child").show();//첫번째만 보이기

    show_contents();//라디오 클릭에 따른 보이기

    timeBefore('SP', regDate);

});

function timeBefore(className, time) {
    //현재시간
    let now = new Date() // 현재시간 
    //기준시간 
    let writeDay = new Date(time)

    let ResultTime = "";

    //현재 시간과 기준시간의 차이를 getTime을 통해 구한다 
    var difference = now.getTime() - writeDay.getTime();
    //초로 바꿔준다 
    difference = Math.trunc(difference / 1000);

    // 초 
    const seconds = 1;
    // 분
    const minute = seconds * 60;
    // 시
    const hour = minute * 60;
    // 일
    const day = hour * 24;
    // 달
    const mon = day * 30;
    // 년
    const year = mon * 12;

    let resultYear, resultMon, resultDay, resultHour, resultMin, resultSec;

    if (difference < seconds) {
        ResultTime = "바로"
    } else if (difference < minute) {
        ResultTime = Math.trunc(difference / seconds) + '초 ';
    } else if (difference < hour) {
        ResultTime = Math.trunc(difference / minute) + '분 ';
    } else if (difference < day) {
        ResultTime = Math.trunc(difference / hour) + '시간 ';
    } else if (difference < mon) {
        ResultTime = Math.trunc(difference / day) + '일 ';
    } else if (difference < year) {
        ResultTime = Math.trunc(difference / mon) + '달 ';
    } else {
        ResultTime = Math.trunc(difference / year) + '년 ';
    }

    console.log(ResultTime);
    document.getElementsByClassName(className)[0].innerHTML = ResultTime + "전";

}


//라디오 클릭에 따라 상세보기 변경 함수
let contents = $(".content_wrap").children();//상세보기 내용들

function show_contents() {
    if (contents.length <= 1) return false;//상세보기 내용이 없다면 함수 종료
    $(".tab_radio label").on("click", function () {//라디오의 라벨 클릭 시
        contents.hide();//모든 내용 숨기기
        //클릭한 라벨의 for 속성값과 동일한 클래스명의 상세보기 내용만 보이게 처리
        contents.filter("." + $(this).attr("for")).show();
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
const slideWidth = 450;//한개의 슬라이드 넓이
const slideMargin = 50;//한개의 슬라이드의 마진값

//전체 슬라이더 컨테이너 넓이 설정
slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num) {
    slides.style.left = -num * 500 + 'px';
    currentIdx = num;
}

prev.addEventListener('click', function () {
    //첫번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx!=0일때만 moveSlide 함수 불러옴
    if (currentIdx !== 0) moveSlide(currentIdx - 1);
});

next.addEventListener('click', function () {
    //마지막 슬라이드도 마찬가지
    if (currentIdx !== slideCount - 1) {
        moveSlide(currentIdx + 1);
    }
});




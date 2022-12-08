// 옵션 선택 함수
// 상세보기 페이지에서 데이터 받아옴
function selectOption()
{
    let optionList = "<tr>" + 
    "<td>" + goodsReg_optionName 
    + "<input type='hidden' name= 'goodsReg_Idx' value= '${goodsReg_Idx}'>"
    + "</td>"
    + "</tr>";

    $(".optionTable>tbody").append(optionList);
}
// 변수선언 옵션 op
let op;

$(function () {
    $(".optionTable tbody tr td").on("click",function()
    {
        // .optionTable tbody tr td 태그 클릭시
        // 현재위치의 자식 input 태그로 값 전송
        op = $(this).children("input").val();

        $("#datepicker").datepicker({
            // 날짜 범위 지정 오늘부터 ~ 1주이후까지
            minDate: 0,
            maxDate: "+7D",
            defaultDate: 0,

            // 날짜 선택 시 데이터 값 가져오기
            onSelect: function () {

                const selectedDate = 
                // 날짜포맷
                $.datepicker.formatDate
                (
                    //월.일(요일), 날짜선택 데이터 가져오기
                    "mm.dd(D)", $(this).datepicker('getDate') 
                );
                // id="selectedDate" 적용시 텍스트 출력
                $("#selectedDate, #selectedDate2").text(selectedDate);
                console.log(selectedDate.substring(3,5));
                //날짜만 선택
                console.log(op);
                // 날짜 선택시 포맷
                selectDay(selectedDate.substring(3,5));
            },
        });
    });
});

// DATEPICKER 한글화
$.datepicker.setDefaults({
    dateFormat: 'mm월dd일',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
});

// 날짜 선택 후 시간 선택
function selectDay(param)
{
    $.ajax({
        url: "/reserv/getTime",
        type: "POST",
        data: 
        {
            // 옵션번호, 날짜
            sche_good_idx: op, sche_date: param
        },
        // 비동기 방식
        async: false,
        success: function(result)
        {
            console.log(result);
            // 변수 선언
            let times = result.time;
            let table = $(".selectTime tbody");
            // 행 추가
            for(let i = 9; i <= 20; i++)
            {
                let time = (i<10) ? "0" + i : i;
                let _time = "T_" + time + "00";
                let _time_30 = "T_" + time + "30";
                let str = "";
                let str2 = "";
                let person30 = times[_time_30];

                if(times[_time] != -1) 
                {
                    str = "<tr><td>" + time + ":00 <span>" + times[_time] +"</span>명</td></tr>";
                }

                if(times[_time_30] != -1)
                {
                    str2 = "<tr><td>" + time + ":30 <span>" + times[_time_30] +"</span>명</td></tr>";
                }
                table.append
            (
                str + str2
            );
            }
            selectPerson();
            return result;
        },

        error: function(result){
            // 오류 발생 시 처리
            console.log(result.time); //time의 에러메세지 확인
        }
    });
}

var selectNum;

function selectPerson()
{
    $(".selectTime tr td").on("click", function()
    {
        selectNum = $(this).children("span").text();
        console.log(selectNum);
    });
}

function count(type)  
{
    // 결과를 표시할 element
    let resultElement = document.getElementById('num');
    
    // 현재 화면에 표시된 값
    let number = resultElement.innerText;
    
    // 더하기/빼기
    if(type === 'plus') {
        if(number < parseInt(selectNum))
        {
            number = parseInt(number) + 1;
        }

    }else if(type === 'minus')  {
    	if(number > 1) {
    		number = parseInt(number) - 1;
    	}
    }
    
    // 결과 출력
    resultElement.innerText = number;
}
// 변수선언 옵션 op
let op;
let totalPrice;

$(function () {
    op = $("#goodsReg_Idx").val();
    totalPrice = $("#totalPrice").text();

     // DATEPICKER
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
            // id="selectedDate", "selectedDate2" 적용시 텍스트 출력
            $("#selectedDate, #selectedDate2").html(selectedDate
                + "<input type='hidden' name='selectedDate' value='"+ selectedDate +"'>");
            console.log("선택날짜(일): "+selectedDate.substring(3,5));
            //날짜만 선택
            console.log("옵션번호: " + op);
            // 날짜 선택시 포맷
            selectDay(selectedDate.substring(3,5));

            $(this).siblings("summary").trigger("click");

            $("#selectTimes details summary").trigger("click");
        },
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
        url: "/user/reserv/getTime",
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
            // selectTime 클래스의 tbody 태그를 table 변수에 저장
            let table = $(".selectTime tbody");
            table.html("");
            // 행 추가
            // 9시부터 20시 까지
            for(let i = 9; i <= 20; i++)
            {
                // 삼항연산 i가 10보다 작을경우(참) "0" + i, 거짓일 경우 i
                let time = ( i < 10) ? "0" + i : i;
                // _time 변수에 저장 "T_{time}00" ex) T_0900
                let _time = "T_" + time + "00";
                // _time_30 변수에 저장 "T_{time}30" ex) T_0930
                let _time_30 = "T_" + time + "30";
                let str = "";
                let str2 = "";
                

                // 받아온 값이 -1 일 때(-1은 영업시간이 아님)
                if(times[_time] != -1)
                
                {
                    str = "<tr><td>" 
                    + "<span class='selectTime'>" 
                    +time + ":00 </span>" 
                    + "<span>" + times[_time] + 
                    "</span>명</td></tr>";
                }

                if(times[_time_30] != -1)
                {
                    str2 = "<tr><td>" 
                    + "<span class='selectTime'>" 
                    +time + ":30 </span>" 
                    + "<span>" + times[_time_30] 
                    +"</span>명</td></tr>";
                }

                table.append
                (
                    str + str2
                );

            }
            
            table.children("tr").on("click", function()
            {
                $(this).siblings().removeClass("on");
                $(this).addClass("on");
                
                table.parent().siblings("summary").trigger("click");
                $("#selectPeople details summary").trigger("click");
            });


            // selectPerson 함수 실행
            selectPerson();
            return result;

        },

        error: function(result){
            // 오류 발생 시 처리
            console.log(result); //에러메세지 확인
        }
    });
}

// 인원수 변수 선언
let selectNum;
// 시간 변수 선언
let selectTime;

// 시간선택 함수
function selectPerson()
{
    // selectTime 클래스에 tr > td 태그 클릭시 함수 동작
    $(".selectTime tr td").on("click", function()
    {
        // 이 함수 자식 span 태그 텍스트로 변경해서 변수 selectNum 에 저장
        selectNum = $(this).children("span").text();
        selectTime = $(this).children(".selectTime").text();

        console.log("인원수: " + selectNum.substring(6,8));
        console.log("시간: " + selectTime);
        // 시간 값 출력
        $("#selectTime").html(", " + selectTime + "<input type='hidden' name='selectTime' value='"+ selectTime +"'> ");

    });
    $(this).siblings("summary").trigger("click");
}

// 인원수 count 함수 type
function count(type)  
{
    // 결과를 표시할 element 아이디값 num
    let resultElement = document.getElementById('num');
    
    // 현재 화면에 표시된 값
    let number = resultElement.innerText;
    
    // 더하기
    if(type === 'plus') {
        // 시간선택에서 넘어온 선택가능한 인원수 값 보다 작으면 + 1
        if(number < parseInt(selectNum))
        {
            number = parseInt(number) + 1;
        }
    // 빼기    
    }else if(type === 'minus')  {
        // 1보다 클 때 -1
    	if(number > 1) {
    		number = parseInt(number) - 1;
    	}
    }
    // 결과 출력
    resultElement.innerText = number;
    console.log(number);

    $("#num2").html(number + "<input type='hidden' name='peopleNum' value='"+ number +"'>");

    $("#totalPrice").text(totalPrice*number);
}
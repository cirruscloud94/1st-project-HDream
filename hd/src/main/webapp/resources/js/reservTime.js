// 변수선언 옵션 op
let op; // 옵션
let totalPrice; // 총액

$(function () {
    op = $("#goodsReg_Idx").val(); //옵션 번호
    totalPrice = $("#totalPrice").text(); // 가격

    let startDate = new Date().toLocaleDateString("ko-KR",
    {
        month:"numeric",
        day:"2-digit",
        weekday:"short"
    });

    $("#selectedDate1, #selectedDate2").html(startDate
        + "<input type='hidden' name='selectedDate' value='" + startDate + "'>");

    $("input[name='selectedDate']").val(startDate);

    selectDay(startDate.substring(4,6));

    $("#selectTimes details summary").trigger("click");
    
     // DATEPICKER
     $("#datepicker").datepicker({
        // 날짜 범위 지정 오늘부터 ~ 1주이후까지
        minDate: 0,
        maxDate: "+6D",
        defaultDate: 0,

        // 날짜 선택 시 데이터 값 가져오기
        onSelect: function () {
            // 선택한 날짜
            const selectedDate = 
            $(this).datepicker('getDate').toLocaleDateString("ko-KR",
            {
                month:"numeric",
                day:"2-digit",
                weekday:"short"
            });

            // id="selectedDate1", "selectedDate2" 적용시 텍스트 출력
            $("#selectedDate1, #selectedDate2").html(selectedDate
                + "<input type='hidden' name='selectedDate' value='" + selectedDate + "'>");
                //console.log(selectedDate);
            console.log("선택날짜(일): " + selectedDate.substring(4,6));
            //날짜만 선택
            console.log("옵션번호: " + op);
            // 날짜 선택시 포맷
            selectDay(selectedDate.substring(4,6));
            // 날짜 선택시 서머리 태그 클릭 트리거 작동(닫힘)
            $(this).siblings("summary").trigger("click");

            
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
            // 변수 선언 
            let times = result.time;
            // selectTime 클래스의 tbody 태그를 table 변수에 저장
            let table = $(".selectTime tbody");
            table.html("");
            // 행 추가
            // 9시부터 20시 까지
            let currentTime = new Date();
            let day = parseInt(('0' + currentTime.getDate()).slice(-2));
            let hours = parseInt(('0' + currentTime.getHours()).slice(-2)) + 1;
            //console.log(day, param);
            
            if(day == param)
            {

                if(hours < 9) hours = 9;
                if(hours <= 20)
                {
                    //console.log("현재 시간(시간만): " + hours);
                    for(let i = hours; i <= 20; i++)
                    {
                        // 삼항연산 i가 10보다 작을경우(참) "0" + i, 거짓일 경우 i
                        let time = ( i < 10) ? "0" + i : i;
                        // _time 변수에 저장 "T_{time}00" ex) T_0900
                        let _time = "T_" + time + "00";
                        // _time_30 변수에 저장 "T_{time}30" ex) T_0930
                        let _time_30 = "T_" + time + "30";
                        let str = "";
                        let str2 = "";
                        
        
                        // 받아온 값이 -1 아닐 때(-1은 영업시간이 아님)
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
                } else 
                {
                    alert("영업시간이 종료되었습니다.");
                }
            } else 
            {
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
            }
            //console.log(document.querySelectorAll(".selectTime tr").length);
            if(document.querySelectorAll(".selectTime tr").length == 0)
            {
                alert(selectContents.nullDate);
            }
            /* 클릭 시 닫히고 다음 선택 열리기 */
            // 시간선택 옵션 클릭시
            table.children("tr").on("click", function()
            {
                // 
                $(this).siblings().removeClass("on");
                $(this).addClass("on");

                // 시간선택 옵션을 클릭하면 서머리를 한번 더 클릭해서 닫아줌
                table.parent().siblings("summary").trigger("click");
                // 닫히는 동시에 인원 선택 서머리를 클릭하는 트리거 작동
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
        selectNum = $(this).children("span").text(); // ex) 12:00 10
        selectTime = $(this).children(".selectTime").text(); // ex) 12:00

        console.log("인원수: " + selectNum.substring(6,8)); // 10
        console.log("시간: " + selectTime);

        // 예약 내용을 확인해주세요 섹션에 출력
        $("#selectTime").html(", " + selectTime + "<input type='hidden' name='selectTime' value='"+ selectTime +"'> ");

    });
    // 인원선택 서머리 클릭 트리거 작동
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
        if(number < parseInt(selectNum.substring(6,8)))
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
    // 선택한 인원 값 출력
    $("#num2").html(number + "<input type='hidden' name='peopleNum' value='"+ number +"'>");
    // 옵션 가격 * 인원 = 총액
    $("#totalPrice").text(totalPrice*number);
}

let selectContents = 
{
    time: "예약 시간을 선택해 주세요.",
    nullDate: "예약 할 수 없는 날짜입니다.",
    nullTime: "선택 가능한 시간이 아닙니다.",
    notPeople: "예약 가능한 인원수 미만입니다.",
    finalTime: "시간을 선택해 주세요.",
    reservPeople: "예약자를 입력해 주세요.",
    reservTell: "연락처를 입력해주세요.",
    nullTell: "올바른 연락처가 아닙니다. 다시 입력해주세요.",
    nullEmail: "올바른 이메일이 아닙니다. 다시 입력해주세요."
}


/* ========= 폼 제출 전 유효성 검증========= */
function check_form(){
	if(!check_reservConfirm()) return false;//예약 내용 확인 검사
	if(!check_reservPeople()) return false;//필수 입력값 입력 여부 검사
	return true;
}

//예약 내용 확인 검사
function check_reservConfirm(){

    $("")
	
}

//필수 입력값 검사
function check_reservPeople(){
	let req_input = document.querySelectorAll("input.req");
	let flag = true;
	let focus = 0;
    console.log(req_input.length); //3개 문항
    // 클래스가 req 인 인풋에 값이 들어있을 경우
	if(!isNull(req_input) && req_input.length > 0)
    {
		for(let i=0; i< req_input.length; i++){
			if(isNull(req_input[i].value))
            {
				focus++;

				if(focus == 1) req_input[i].focus();

				alert(selectContents.reservPeople);

				flag = false;
			} else if($("#m_cellphone").val().length > 11)
            {
                alert(selectContents.nullTell);
            } else if($("#m_email").val().split('@').length > 12)
            {
                alert(selectContents.nullEmail);
            }
		}
	}
	return flag;
}




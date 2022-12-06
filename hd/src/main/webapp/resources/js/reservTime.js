// 변수선언
let op;

$(function () {
    $(".optionTable tbody tr").on("click",function(){
		// 현재위치의 자식 input 태그에서 값 
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
                
                // 날짜 선택시 포맷
                selectDay(selectedDate.substring(3,5));
            },
        });
    });
});

// 달력 한글화
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

function selectDay(param)
{
    $.ajax
    ({
        url: "/reserv/getTime",
        type: "POST",
        data: {sche_good_idx: op, sche_date: param},
        async: false,
        success: function(result)
        {
            let times = result.time;
            let table = $(".selectTime tbody");
            table.append("<tr>"
                +"09:00"+times.t_0900
            +"</tr>");
            return result;
        },
        error: function(result)
        {
            console.log(result.responseText); //responseText의 에러메세지 확인
        }
    });
}
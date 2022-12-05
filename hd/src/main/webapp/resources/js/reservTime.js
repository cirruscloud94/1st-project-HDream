$(function () {

    $("#datepicker").datepicker
        ({
            // 날짜 범위 지정 오늘부터 ~ 2주이후까지
            minDate: 0,
            maxDate: "+14D",
            defaultDate: 0,

            // 날짜 선택 시 데이터 값 가져오기
            onSelect: function () {

                const selectedDate = 
                // 날짜포맷
                $.datepicker.formatDate
                (
                    "mm.dd(D)", $(this).datepicker('getDate') //월.일(요일), 날짜선택 데이터 가져오기
                );
                // id="selectedDate" 적용시 텍스트 출력
                $("#selectedDate").text(selectedDate);

                // $("#datepicker").hide();
            },

            // 요일 disable 옵션
            beforeShowDay: function (date) {

                return [(date.getDay() != 0)];

                /* 
                일요일만 선택 불가 
                return [(date.getDay() != 0)];
    
                월요일만 선택 불가 
                return [(date.getDay() != 1)];
    
                화요일만 선택 불가 
                return [(date.getDay() != 2)];
    
                수요일만 선택 불가 
                return [(date.getDay() != 3)];
    
                목요일만 선택 불가 
                return [(date.getDay() != 4)];
    
                금요일만 선택 불가 
                return [(date.getDay() != 5)];
    
                토요일만 선택 불가 
                return [(date.getDay() != 6)];
    
                주말(토,일) 선택 불가 
                return [(day != 0 && day != 6)];
                */

            }
        });

    // 클릭하지 않아도 달력이 보이게 해줌
    // $('.datepicker').focus();
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
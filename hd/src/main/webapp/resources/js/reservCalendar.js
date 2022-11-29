//Datepicker
$(function () 
{
    $( "#datepicker" ).datepicker
    ({
    	minDate: 0, maxDate: "+15D" 
    });

    // 클릭하지 않아도 달력이 보이게 해줌
    $('.datepicker').focus();
});

// 달력 한글화
$.datepicker.setDefaults
({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});



var flag = false; // 플래그
var IMP = window.IMP; // 생략가능
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
IMP.init('imp26378240'); 

/* 결제방식 */
function payModule(){
    let method_num = $("input[name='r_payMethod']").val();
    // 결제 방식 0: 무통장, 1: 카카오페이, 2: 일반카드결제
    if(method_num == 2)
    {
        kakaopay();
    } else if(method_num == 1)
    {
        requestPay();
    } else if(method_num == 0)
	{
		return true;
	}
    return flag;
};

/* 카카오페이 */
function kakaopay()
{
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'kakaopay',
        merchant_uid: ""+$("#c_idx").val()+":"+$("#r_c_idx").val() 
        +":"+ $("#r_date").val()+ ":" + $("#r_possibleTime") + new Date().getTime(), 
        //카페번호:옵션번호:예약날짜:예약시간, // 상점에서 관리하는 주문 번호
        name: $("#r_room_name").val(),
        amount: $("#r_price").val(),
        buyer_email: $("#m_email").val(),
        buyer_name: $("#r_name").val(),
        buyer_tel: $("#r_cellphone").val(),
        buyer_addr: "none",
        buyer_postcode: "none"
    }, function(rsp) {
        console.log(rsp);
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            orderSuccess(rsp);
            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            var msg = '결제가 완료되었습니다.';
            msg += '\n고유ID : ' + rsp.imp_uid;
            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            msg += '\결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            alert(msg);

            $("#payForm").attr("onsubmit", "return true");
            $("#payForm").submit();
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
       
    });
    return flag;
}

/* 일반카드결제 */  	  	
function requestPay() {
	IMP.request_pay({ // param
		pg : "html5_inicis",
		pay_method: "card",
		merchant_uid: ""+$("#c_idx").val()+":"+$("#r_c_idx").val() 
			+":"+ $("#r_date").val()+ ":" + $("#r_possibleTime") + new Date().getTime(), //카페번호:옵션번호:예약날짜:예약시간
		name: $("#r_room_name").val(),
		amount: $("#r_price").val(),
		buyer_email: $("#m_email").val(),
		buyer_name: $("#r_name").val(),
		buyer_tel: $("#r_cellphone").val(),
		buyer_addr: "none",
		buyer_postcode: "none"
	}, function (rsp) {
		if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            orderSuccess(rsp);
            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            
            var msg = '결제가 완료되었습니다.';
            msg += '\n고유ID : ' + rsp.imp_uid;
            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            msg += '\결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            alert(msg);

            $("#payForm").attr("onsubmit", "return true");
            $("#payForm").submit();
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
       
    });
    return flag;
};

function orderSuccess(rsp)
{
    jQuery.ajax({
        url: "/user/reserv/pay", //cross-domain error가 발생하지 않도록 주의해주세요
        type: 'POST',
        dataType: 'json',
        data: {
            imp_uid : rsp.imp_uid
            //기타 필요한 데이터가 있으면 추가 전달
        }
    });
}

// function kakaopay()
// {
//     IMP.request_pay({
//         pg : 'kakaopay',
//         pay_method : 'kakaopay',
//         merchant_uid: ""+$("#c_idx").val()+":"+$("#r_c_idx").val() 
//         +":"+ $("#r_date").val()+ ":" + $("#r_possibleTime") + new Date().getTime(), 
//         //카페번호:옵션번호:예약날짜:예약시간, // 상점에서 관리하는 주문 번호
//         name: $("#r_room_name").val(),
//         amount: $("#r_price").val(),
//         buyer_email: $("#m_email").val(),
//         buyer_name: $("#r_name").val(),
//         buyer_tel: $("#r_cellphone").val(),
//         buyer_addr: "none",
//         buyer_postcode: "none"
//     }, function(rsp) {
//         console.log(rsp);
//          /** 결제 검증 **/
//          $.ajax({
//             type: 'POST',
//             url: '/verifyIamport/'+rsp.imp_uid,
//             beforeSend: function(xhr){
//                 xhr.setRequestHeader(header, token);
//             }
//         }).done(function(result){

//             // rsp.paid_amount와 result.response.amount(서버 검증) 비교 후 로직 실행
//             if(rsp.paid_amount === result.response.amount){
//                 alert("결제가 완료되었습니다.");
//                 $.ajax({
//                     type:'POST',
//                     url:'/user/reserv/pay',
//                     beforeSend: function(xhr){
//                         xhr.setRequestHeader(header, token);
//                     }
//                 }).done(function() {
//                     window.location.reload();
//                 }).fail(function(error){
//                         alert(JSON.stringify(error));
//                 })
//             } else{
//                 alert("결제에 실패했습니다."+"에러코드 : "+rsp.error_code+"에러 메시지 : "+rsp.error_message);

//             }
//         })
       
//     });
//     return flag;
// }

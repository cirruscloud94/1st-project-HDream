function cancelPay() 
  {
    $.ajax({
    	url: "/owner/mypage/cafe_reserv/cafeReservList", // 예: http://www.myservice.com/payments/cancel
    	type: "POST",
      	contentType: "application/json",
      	data:
        JSON.stringify
        ({
            merchant_uid: $("#r_uid").val(), // 예: ORD20180131-0000011
            cancel_request_amount: $("#r_price").val(), // 환불금액
      	    reason: $("#r_msg").val() // 환불사유
        }),
        dataType: "json",

        success: function()
        {
           
        }
    });
  }
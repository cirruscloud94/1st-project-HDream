function confirm()
{
  let r_status = $("input[name='STATUS']").val();

  if(r_status == 5)
  {
    cancelPay();
  } else
  {
    checkIt();
  }
}

function checkIt()
{ 
  alert("예약 상태가 변경되었습니다");
   
}

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
      async: false,
      success: function(result)
      {
        let msg = "환불이 완료되었습니다.";
        mgs += "\n주문번호: " + result.merchant_uid;
        mgs += "\n환불금액: " + result.cancel_request_amount + "원";
        mgs += "\n환불사유: " + result.reason;
        alert(msg);
        return result;
      },
      error: function(result)
      {
          // 오류 발생 시 처리
          console.log(result); //에러메세지 확인
      }
  });
}

function stars()
{
  $.ajax({
    url: "/user/mypage/review/insertForm",
        type: "POST",
        data: 
        {
            // 별점
            v_star: starData
        },
        // 비동기 방식
        async: false,
        success: function(result)
        {
          star();
        }
  })
}

function star()
{
  $("input[name='V_STAR']").on("click");

  let starData = $("input[name='V_STAR']").val();

  $("#reviewStars fieldset").html("<input type='hidden' value='" + starData +"'>");
}
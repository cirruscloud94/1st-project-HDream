function stars()
{
    let starData = $("input[name='V_STAR']").val();
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
            $("input[name='V_STAR']").on("click");
            $("#reviewStars fieldset").html("<input type='hidden' value='" + starData +"'>");
        }
    })
}
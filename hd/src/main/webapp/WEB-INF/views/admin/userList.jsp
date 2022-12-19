<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<main class="layoutCenter">
<style>
#modifyUser{ padding: 0 20px; }
#modifyUser ul{ width: 100%; }
#modifyUser ul li{ display: flex; flex-wrap: wrap; width: 100%; margin: 15px 0; }
#modifyUser ul li span{ display: block; width: 50%; }
#modifyUser ul li input[readonly]{ background-color: var(--subGray_10); }
#modifyUser .btn{ width: 100%; }

.row {
    border: 2px solid var(--subGray_50);
    padding: 20px;
    margin: 20px auto;
}
</style>
<div>
<div align="center">
	<h1>회원 정보 조회</h1>
</div>
	<div class="row" align="left">
		<form id="userSearch" action="/admin/userList" method="POST">
				회원 유형: 일반<input type="radio" value=0 name="m_type" >
				사업주<input type="radio" value=1 name="m_type" ><br/>
				탈퇴 여부<input type="checkbox" value="Y" name="m_del_gb"><br/>
			<select name="searchType">
				<option value="">---</option>
				<option value="I">아이디</option>
				<option value="N">이름</option>				
			</select>	
			<input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100">
			<input class="btn submit" type="submit" value="검색">
		</form>
	</div>
</div>
<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>회원 유형</th>	
			<th>가입일</th>
		</tr>
	</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}" >
					<tr><td colspan="4" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:when test="${!empty list}">
					<c:forEach var="i" items="${list}">
						<tr align="center">
							<td class="m_id">${i.M_ID}</td>
							<td>${i.M_NAME}</td>
							<td>${i.M_TYPE}</td>
							<td>${i.M_REG_DATE }</td>						
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
</table>

<script type="text/javascript">
$("table tbody tr").on("click", function() {
	let _this = $(this);
	let _id = $(this).children(".m_id").text();
	$.ajax({
		url: "/admin/userDetail",
		type: "POST",
		data: {m_id:_id,},
		async: false,
		success: function(result){
			console.log(result.map);
			_this.after("<tr><td colspan='3'>"
					+"<form id='modifyUser'>"
					+"<ul><li>"
						+"<span>아이디: <input name='m_id' type='text' value="+_id+" readonly></span>"
						+"<span>이름: <input name='m_name' type='text' value="+result.map.M_NAME+"></span>"
					+"</li>"
					+"<li>"
						+"<span>회원유형: <input name='m_type' type='text' value="+result.map.M_TYPE+"></span>"
						+"<span>사업자 번호: <input name='m_own_num' type='text' value="+result.map.M_OWN_NUM+"></span>"
					+"</li>"
					+"<li>"
						+"<span>이메일: <input name='m_email' type='text' value="+result.map.M_EMAIL+"></span>"
						+"<span>비밀번호: <input name='m_pw' type='password' value="+result.map.M_PW+"></span>"
					+"</li>"
					+"<li>"
						+"<span>전화번호: <input name='m_cellphone' type='text' value="+result.map.M_CELLPHONE+"></span>"
						+"<span>가입일: <input name='m_reg_date' type='text' value="+result.map.M_REG_DATE+" readonly></span>"
					+"</li>"
					+"<li>"
						+"<span>수정일: <input name='m_mod_date' type='text' value="+result.map.M__MOD_DATE+" readonly></span>"
						+"<span>탈퇴여부: <input name='m_del_gb' type='text' value="+result.map.M_DEL_GB+"></span>"
					+"</li></ul>"
					+"<button class='btn submit' type='button' onclick='modifyUser()'>수정</button>"
					+"</form>"
					+"</td></tr>");
		},
		error: function(result){
			console.log(result.responseText); //responseText의 에러메세지 확인
		}
	}); //ajax끝
});

function modifyUser() {
	let _form = $("#modifyUser");
	$.ajax({
		url: "/admin/modifyUser",
		type: "POST",
		data: _form.serialize(),
		async: false,
		success: function(result){
			console.log(result.map);
			alert("수정되었습니다.");
		},
		error: function(result){
			console.log(result.responseText); //responseText의 에러메세지 확인
		}
	});
}

</script>
</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
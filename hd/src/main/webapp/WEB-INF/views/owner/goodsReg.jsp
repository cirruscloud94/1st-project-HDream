<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/cafeinclude-header.jspf" %>

<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
<div class="main_wrap">
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="25%">
				<col width="*"/>
			</colgroup>
			<caption>옵션등록</caption>
			<tbody>
				<tr>
					<th scope="row">옵션이름</th>
					<td><input type="text" id="GOODSREG_OPTIONNAME" name="GOODSREG_OPTIONNAME" style="width:400px;"></input></td>
				</tr>
				<tr>
					<th scope="row">사용기간</th>
					<td>
						   <select name="GOODSREG_USETIME">
						   <option value="30">30</option>
						   <option value="60">60</option>
						    <option value="90">90</option>
						     <option value="120">120</option>
						      <option value="150">150</option>
						       <option value="180">180</option>
						  </select>
					</td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td><input type="text" id="GOODSREG_PRICE" name="GOODSREG_PRICE" style="width:400px;" placeholder="숫자로 입력해 주세요. ex)10000"></input></td>
				</tr>
				<tr>
					<th scope="row">인원</th>
					<td>
						   <select name="GOODSREG_PEOPLE">
						   <option value="1">1</option>
						   <option value="2">2</option>
						   <option value="3">3</option>
						   <option value="4">4</option>
						   <option value="5">5</option>
						  </select>
					</td>
				</tr>
				<tr>
					<th scope="row">휴무요일</th>
					<td>
						   <select name="GOODSREG_OFFDAY">
						   <option value="0">일</option>
						   <option value="1">월</option>
						   <option value="2">화</option>
						   <option value="3">수</option>
						   <option value="4">목</option>
						   <option value="5">금</option>
						   <option value="6">토</option>
						  </select>
					</td>
				</tr>
				<tr>
					<th scope="row">예약시작시간</th>
					<td>

						   <select name="GOODSREG_STARTTIME">
						   <option value="09:00">09:00</option>
						   <option value="09:30">09:30</option>
						   <option value="10:00">10:00</option>
						   <option value="10:30">10:30</option>
						    <option value="11:00">11:00</option>
						     <option value="11:30">11:30</option>
						      <option value="12:00">12:00</option>
						       <option value="12:30">12:30</option>
						        <option value="13:00">13:00</option>
						         <option value="13:30">13:30</option>
						          <option value="14:00">14:00</option>
						           <option value="14:30">14:30</option>
						            <option value="15:00">15:00</option>
						             <option value="15:30">15:30</option>
						              <option value="16:00">16:00</option>
						               <option value="16:30">16:30</option>
						                <option value="17:00">17:00</option>
						                 <option value="17:30">17:30</option>
						                  <option value="18:00">18:00</option>
						                   <option value="18:30">18:30</option>
						                    <option value="19:00">19:00</option>
						                     <option value="19:30">19:30</option>
						                      <option value="20:00">20:00</option>            
						  </select>

					</td>
				</tr>
				<tr>
					<th scope="row">예약종료시간</th>
					<td>
						   <select name="GOODSREG_ENDTIME">
						   <option value="09:00">09:00</option>
						   <option value="09:30">09:30</option>
						   <option value="10:00">10:00</option>
						   <option value="10:30">10:30</option>
						    <option value="11:00">11:00</option>
						     <option value="11:30">11:30</option>
						      <option value="12:00">12:00</option>
						       <option value="12:30">12:30</option>
						        <option value="13:00">13:00</option>
						         <option value="13:30">13:30</option>
						          <option value="14:00">14:00</option>
						           <option value="14:30">14:30</option>
						            <option value="15:00">15:00</option>
						             <option value="15:30">15:30</option>
						              <option value="16:00">16:00</option>
						               <option value="16:30">16:30</option>
						                <option value="17:00">17:00</option>
						                 <option value="17:30">17:30</option>
						                  <option value="18:00">18:00</option>
						                   <option value="18:30">18:30</option>
						                    <option value="19:00">19:00</option>
						                     <option value="19:30">19:30</option>
						                      <option value="20:00">20:00</option>            
						                        <option value="20:30">20:30</option> 
						                          <option value="21:00">21:00</option>         
						  </select>
					</td>
				</tr>
				
			</tbody>
		</table>
		<div id="fileDiv">
		<p>
		<input type="file" id="file" name="file_0">
		<a href="#this" class="btn" id="delete" name="delete">삭제</a>
		</p>
		</div>
		
		<br/><br/>
		<a href="#this" class="btn" id="addFile">파일 추가</a>
		<a href="#this" class="btn" id="write" >작성하기</a>
		<a href="#this" class="btn" id="list" >목록으로</a>
	</form>
</div>
</main>
	<script type="text/javascript">
		var gfv_count = 1;
		
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼
			e.preventDefault();
			fn_openGoodsList();
		});
		
		$("#write").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			fn_insertOwnerGoodsRegTable();
		});
		
		$("#addFile").on("click", function(e){	//파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});
		
		$("a[name='delete']").on("click", function(e){	//삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
		
	});
	
	function fn_openGoodsList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/owner/openGoodsList' />");
		comSubmit.submit();
	}
	
	function fn_insertOwnerGoodsRegTable(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/owner/insertOwnerGoodsRegTable' />");
		comSubmit.submit();
	}
	
	function fn_addFile(){
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click", function(e){	//삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));	 
		});
	}
	
	function fn_deleteFile(obj){
		obj.parent().remove();
	}
	
</script>
<%@ include file="/WEB-INF/include/cafeinclude-body.jspf" %>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="/resources/js/admin_user.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/admin_user.css"/>
<main class="layoutCenter">
<div>
	<h1 class="txt_center">회원 정보 조회</h1>
	<div class="search_wrarp">
		<form id="userSearch" method="POST">
			회원 유형:
				전체 <input type="radio" name="m_type" value="99" ${empty search.m_type || search.m_type == 99?"checked":""}>
				일반 <input type="radio" name="m_type" value="0" ${search.m_type == 0?"checked":""}>
				사업주 <input type="radio" name="m_type" value="1" ${search.m_type == 1?"checked":""}>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			탈퇴 여부 <input type="checkbox" name="m_del_gb" value="Y" ${!empty search.m_del_gb?"checked":""}>
			<br/><br/>
			<select name="searchType">
				<option value="A" ${empty search.searchType || search.searchType == "A"?"selected":""}>전체</option>
				<option value="I" ${search.searchType == "I"?"selected":""}>아이디</option>
				<option value="N" ${search.searchType == "N"?"selected":""}>이름</option>				
				<option value="E" ${search.searchType == "E"?"selected":""}>이메일</option>				
				<option value="P" ${search.searchType == "P"?"selected":""}>전화번호</option>				
				<option value="O" ${search.searchType == "O"?"selected":""}>사업자번호</option>				
			</select>	
			<input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100" value="${!empty search.keyword?search.keyword:''}">
			<input class="btn submit" type="submit" value="검색">
		</form>
	</div>
</div>
<div class="member_info_wrap">
	<table>
		<colgroup>
			<col width="100px"/>
		</colgroup>
		<thead>
			<tr>
				<th>No.</th>
				<th>아이디</th>
				<th>이름</th>
				<th>회원 유형</th>	
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${list[0].TOTAL_COUNT == 0}" >
					<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:otherwise>
					<c:forEach var="i" items="${list}">
						<tr align="center">
							<td>${i.RNUM}</td>
							<td class="m_id">${i.M_ID}</td>
							<td>${i.M_NAME}</td>
							<td>
								<c:if test="${i.M_TYPE == 0}">일반회원</c:if>
								<c:if test="${i.M_TYPE == 1}">사업주</c:if>
								<c:if test="${i.M_TYPE == 2}">관리자</c:if>
							</td>
							<td>${i.M_REG_DATE}</td>						
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<c:if test="${!empty paginationInfo}">
			<tfoot>
				<tr>
					<td class="paging" colspan="5">
						<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
					</td>
				</tr>
			</tfoot>
		</c:if>
	</table>
</div>
</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>
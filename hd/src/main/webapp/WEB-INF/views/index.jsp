<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:redirect url="/main"/> --%>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 컨텐츠 출력 -->
	<!-- 마이페이지에 해당하는 페이지라면 nav 삽입이 필요합니다. -->
	<%@ include file="/WEB-INF/include/mypage_nav.jspf" %>

	<h1>Hello world!</h1>
	<P>  The time on the server is ${serverTime}. </P>
	
	<table>
		<colgroup>
			<col width="100%"/>
		</colgroup>
		<thead>
			<tr>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="i" begin="0" end="5">
			
			</c:forEach>
		</tbody>
	</table>
	<!-- //컨텐츠 종료 -->
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
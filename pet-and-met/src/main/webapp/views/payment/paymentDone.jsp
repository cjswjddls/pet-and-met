<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String pagePath = "./";
	    String aid = (String)request.getAttribute("aid");
		String tid = (String)request.getAttribute("tid");
    %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	</style>
	</head>
	<body>
		<%@ include file="../common/header.jsp" %>
		<div class="container">
			<h2 align="center">결제가 완료되었습니다.</h2>
			<p align="center">결제 내역은 마이페이지에서 조회 가능하며,
				결제 취소는 예약일로부터 14일 이내에 가능합니다.
			</p><br>
			<p align="center">결제번호 : <%= tid %><br>요청번호 : <%= aid %></p>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</body>
</html>
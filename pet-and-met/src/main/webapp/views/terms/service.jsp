<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.nio.file.Paths, java.io.File, java.nio.file.Files" %>

	<% 
		String pagePath = "./"; 
	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>서비스 이용약관</title>
	<link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
	</head>
	<body>
		<%@ include file="../common/header.jsp" %>
		<br><br>

		<div class="container">
			<div align="center">
				<img src="<%= pagePath %>resources/img/terms/01.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/02.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/03.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/04.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/05.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/06.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/07.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/08.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/09.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/10.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/11.jpg" width="75%">
				<img src="<%= pagePath %>resources/img/terms/12.jpg" width="75%">
			</div>
		</div>
		
		<br><br>

		<%@ include file="../common/footer.jsp" %>
	</body>
</html>
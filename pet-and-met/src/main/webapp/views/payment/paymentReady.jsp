<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.HttpURLConnection" %>
	<%
    	String pagePath = "./";
		String kakaoUrl = (String)request.getAttribute("kakaoUrl");
    %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%@ include file="../common/header.jsp" %>
		<br><br><br><br>
		<div class="container" style="width: 800px; height: 800px; text-align: center; background-image: url(<%= pagePath %>resources/img/kakao.jpg); background-repeat : no-repeat; background-size : 100% 100%;">
			<!-- <img src="<%= pagePath %>resources/img/kakao.jpg" width="100%"> --><br><br><br>
			<iframe src="<%= kakaoUrl %>" frameborder="0" width="80%" height="60%" style="margin-top: 200px"></iframe>
		</div>
		<div class="container" style="text-align: center;">
			<button class="btn btn-sm btn-success" style="background-color: rgb(121, 172, 120);">다음으로</button>
			<br><br><br><br>
		</div>
		<%@ include file="../common/footer.jsp" %>
		<script></script>
	</body>
</html>
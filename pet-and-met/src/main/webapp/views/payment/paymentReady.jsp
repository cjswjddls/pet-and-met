<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.HttpURLConnection" %>
	<%
    	String pagePath = "./";
		String kakaoUrl = (String)request.getAttribute("kakaoUrl");
		String oid = (String)request.getAttribute("oid");
		String tid = (String)request.getAttribute("tid");
    %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>결제 진행중...</title>
	</head>
	<body>
		<%@ include file="../common/header.jsp" %>
		<br><br><br><br>
		<div class="container" style="text-align: center;">
			<img src="<%= pagePath %>resources/img/payment/payment_icon_yellow_medium.png">
		</div>
		<div class="container" style="width: 800px; height: 800px; text-align: center; background-image: url(<%= pagePath %>resources/img/kakao.jpg); background-repeat : no-repeat; background-size : 100% 100%;">
			<!-- <img src="<%= pagePath %>resources/img/kakao.jpg" width="100%"> --><br><br><br>
			<iframe src="<%= kakaoUrl %>" name="kakaoIframe" id="kakaoIframe" frameborder="0" width="80%" height="60%" style="margin-top: 200px"></iframe>
		</div>
		<br><br><br><br>
		<%@ include file="../common/footer.jsp" %>
		<script>
			$(function() {
				let kakaoIframe = document.getElementsByName("kakaoIframe");
				kakaoIframe.setAttribute("tid", tid);
			});
		</script>
	</body>
</html>
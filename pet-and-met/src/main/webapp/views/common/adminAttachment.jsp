<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.member.model.vo.Member" %>

	<% 
		String contextRoot = "/pet-and-met"; 
		String contextPath = request.getContextPath();

		String ip = request.getRemoteAddr();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String alertMsg = (String)session.getAttribute("alertMsg");

		Cookie[] cookies = request.getCookies();
		String saveId = "";

		if(cookies != null) { for(int i=0; i < cookies.length; i++) { if(cookies[i].getName().equals("userId")) { saveId = cookies[i].getValue(); break; } } }
	%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Pet & Met</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons(대충 창 아이콘) -->
        <link href="<%= pagePath %>resources/img/favicon.png" rel="icon">
        <link href="<%= pagePath %>resources/img/apple-touch-icon.png" rel="apple-touch-icon">

		<!-- jQuery 3.7버전 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- jQuery UI -->
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>

        <!-- Latest compiled JavaScript -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- datepicker range -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        
        <!-- 데이터피커쪽 관련-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

        <!-- Popper JS -->
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

		<style>
			.sidebar { background-color: rgb(176, 217, 177); width: 20%; height: 100%; margin: 0; padding: 0; outline: none; box-sizing: border-box; position: fixed; }
			.sidebar ul { list-style-type:circle; color: white; font-size: 30px; font-weight: 1000; }
			.sidebar li { color: white; font-size: 22px; font-weight: 1000; }
			.sidebar a { text-decoration: none; color: white; cursor: context-menu; }
			.sidebar ul a:hover { background: rgb(176, 217, 177); box-shadow: -7px -7px 20px 0px rgb(121, 172, 120), -4px -4px 5px 0px rgb(121, 172, 120), 7px 7px 20px 0px rgb(121, 172, 120), 4px 4px 5px 0px rgb(121, 172, 120); transition: all 0.3s ease; }
			.adminNameBar { margin: 0% 0% 0% 30%; }
			.adminNameBar hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; margin-right: 20%; }
		</style>
	</head>
	<body>
		<nav class="sidebar" style="padding: 0px; margin: 0px; text-align: center;">
			<br>
			<ul>홈페이지 관리
				<li><a>공지사항 관리</a></li>
				<li><a>리뷰게시판 관리</a></li>
			</ul>
		    <ul>객실 / 예약 현황
				<li><a  href="<%= contextPath %>/check">객실 관리</a></li>
				<li><a>예약 현황 조회</a></li>
			</ul>
			<ul>통계
				<li><a href="<%= contextPath %>/admin.statistics">매출 조회</a></li>
			</ul>
			<ul>회원 관리
				<li><a href="<%= contextPath %>/listAll.mm">전체 회원 조회</a></li>
			</ul>
			<ul>문의 내역
				<li><a>문의 내역 조회</a></li>
			</ul>
			<ul>메인페이지
				<li><a href="<%= contextPath %>">메인페이지</a></li>
			</ul>
		</nav>

		<div class="adminNameBar">
			<br><br><br><br>
			<h1><%= pageName %></h1>
			<hr>
		</div>

		<script>
			$(function() {
				$(".sidebar>ul").children().slideUp();
				$(".sidebar>ul").click(function() {
					if($(this).children().css("display") == "none") { $(this).children().slideDown(); }
					else { $(this).children().slideUp(); }
				});
			});
		</script>
	</body>
</html>
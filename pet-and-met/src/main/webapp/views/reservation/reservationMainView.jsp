<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pagePath = "./";
	String reservationNextPage = "list.resv";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 1400px;
		margin: auto;
		margin-top: 50px;
		/* border: 1px solid red; */
	}

	/* div { border: 1px solid black;} */

	/* index outer */
	.reservation-index {
		width: 400px;
		height: 100px;
		margin: auto;
		text-align: center;
	}

	/* 현재 선택된 페이지 index 원 라인 */
	.index {
		width: 30px;
		height: 30px;
		border-radius: 50px ;
		border: 1px solid rgb(176, 217, 177);
		display : inline-block;
		text-align: center;
		line-height: 30px; 	
		margin-top : 15px;
		background-color: white;
		font-weight: 700;
		color: rgb(121, 172, 120);
	}

	/* 나머지 index 원 */
	#index-one {
		width: 30px;
		height: 30px;
		border-radius: 50px ;
		border: 1px solid rgb(176, 217, 177);
		display : inline-block;
		text-align: center;
		line-height: 30px; 	
		margin-top : 15px;
		background-color: rgb(121, 172, 120);
		font-weight: 700;
		color: white;
	}

	/* index 원 라인 */
	.line {
		border: 1px solid rgb(176, 217, 177);
		width: 30px;
		margin-top: 15px;
		display : inline-block;
		margin-bottom : 4px;
	}

	/* index 텍스트 */
	#index-text {
		width: 100%;
		margin-top: 10px;
		font-size: 28px;
		font-weight: 550;
		color: rgb(121, 172, 120);	
	}

	/* contnet 구분선 */
	.dividing-line {
		width: 100%;
		border: 2px solid rgb(121, 172, 120);
		margin: auto;
		margin-top: 30px;
		box-sizing: border-box;	
	}

	/* content */
	.reservation-content {
		width: 100%;
		height: 950px;
		margin-top: 0px;
	}
	
	.null-content {
	width : 700px;
	height : 200px;
	margin: auto;
	margin-top: 150px;
	padding-top: 80px;
	text-align: center;
	font-size: 25px;
	font-weight: 700;
	color: rgb(51, 51, 51);
	}

</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div class="outer" >

		<!-- reservation index -->
		<div class="reservation-index">
			<div class="index one" id="index-one">1</div
			><div class="line"></div
			><div class="index two">2</div
			><div class="line"></div
			><div class="index three">3</div>
			<div id="index-text">날짜, 타입, 마리수 선택</div>
		</div>
		
		<!-- contnet 구분선 -->
		<div class="dividing-line"></div>
		<br>
		<%@ include file="../reservation/reservationCalender.jsp" %>
		
		<!-- content -->
		<div class="reservation-content">
		
		
			<div class="null-content">예약을 원하시는 날짜, 타입을 선택해주세요.</div>
	
			<script>
				
				$(function() {
					
					$(".reservation-content").css("height", "500px");
						
			});
	
			</script>
		
		
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>
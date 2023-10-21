<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.reservation.model.vo.Room, com.kh.reservation.model.vo.Reservation" %>
<%
	String pagePath = "./";
	String reservationNextPage = "list.resv";
	
	Reservation resvDay = (Reservation)request.getAttribute("resvDay");
	
	String resvType = (String)request.getAttribute("resvType");
	
	Room roomTypeA = (Room)request.getAttribute("roomTypeA");
	Room roomTypeB = (Room)request.getAttribute("roomTypeB");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationMain</title>
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

	.form-resv {width: 100%; height: 40%; margin-top: 50px; margin-left: 20px;}

	/* type div */
	.type {width: 100%; height: 100%; box-sizing: border-box;}
	.type > div {float: left; box-sizing: border-box; border: 1px solid lightgrey;}
	.type-img { width: 45%; height: 100%; }
	.type-content { width: 35%; height: 100%;}
	.type-submit { width: 18%; height: 100%;}
	
	/* 객실 img */
	.roomImg { width: 100%; height: 80%; margin-top: 35px;}
	
	/* img size */
	img { height: 100%; }

	/* type content */
	.roomType {
		width: 80%;
		height: 80px;
		margin:auto;
		margin-top: 35px;
		border-radius: 10px;
		background-color: rgb(188, 142, 207);
		text-align: center;
		line-height: 80px;
		font-size: 25px;
		border: 1px solid black;
	}


	/* select-button */
	.type-select-button {
		width: 150px;
		height: 45px;
		font-size: 18px;
		font-weight: 600;
		position: relative;
		top: 300px;
		left: 50px;
	}

	.type-data-div {
		width: 80%;
		height: 50%;
		margin: auto;
		background-color: beige;
	}

	.type-data {
		width: 100%;
		height: 33.4%;
		margin: auto;
		padding-top: 15px;
		text-align: center;
		font-size: 20px;
		border: solid 1px black;
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
			
		<%if(roomTypeA != null) { %>
			
			<!-- A type -->
			<form action="<%= pagePath %>request.resv" method="get" class="form-resv">
				<div class="type">
					
					<!-- 객실 img typeA -->
					<div class="type-img">
						<div class="roomImg">
							<img src="<%= pagePath%>resources/img/room/A_type.png">
						</div>
					</div>
	
					<!-- A type content -->
					<div class="type-content">
						<div class="roomType" id="typeA"><%= roomTypeA.getRoomType() %> TYPE</div>
						<input type="hidden" id="hiddenTypeA" name="hiddenTypeA" value="A">
						<br><br>
						<div class="type-data-div">
							<div class="type-data">면적 : <%= roomTypeA.getRoomSize() %></div>
							
							<div class="type-data">요금 : <%= roomTypeA.getRoomFee() %></div>
							<div class="type-data">남은 객실 수 : <%= resvType.substring(1,2) %></div>
						</div>
					</div>
	
					<!-- select-button -->
					<div class="type-submit">
						<button class="type-select-button" type="submit">예약하기</button>
					</div>
				</div>
				
				<!-- A type hidden data -->
				<input type="hidden" id="roomType" name="roomType" value="<%= roomTypeA.getRoomType() %>">
				<input type="hidden" id="roomSize" name="roomSize" value="<%= roomTypeA.getRoomSize() %>">
				<input type="hidden" id="roomFee" name="roomFee" value="<%= roomTypeA.getRoomFee() %>">
				
				<!-- Calender hidden -->
				<input type="hidden" id="startDate" name="startDate" value="<%= resvDay.getReservationStartDate() %>">
				<input type="hidden" id="endDate"   name="endDate"   value="<%= resvDay.getReservationEndDate() %>">
				<input type="hidden" id="stayDate"  name="stayDate"  value="<%= resvDay.getReservationStayDate() %>">
			</form>
			
			<% } %>
			
			<% if(roomTypeB != null) { %>
			<!-- contnet 구분선 -->
			<div class="dividing-line"></div>
			
			<!-- B type -->
			<form action="<%= pagePath %>request.resv" method="get" class="form-resv">
				<div class="type">
					
					<!-- 객실 img typeB -->
					<div class="type-img">			
						<div class="roomImg">
							<img src="<%= pagePath%>resources/img/room/B_type.png">
						</div>
					</div>
					
					<!-- B type content -->
					<div class="type-content">
						<div class="roomType" id="typeB"><%= roomTypeB.getRoomType() %> TYPE</div>
						<input type="hidden" id="hiddenTypeB" name="hiddenTypeB" value="B">
						<br><br>
						<div class="type-data-div">
							<div class="type-data">면적 : <%= roomTypeB.getRoomSize() %></div>
							<div class="type-data">요금 : <%= roomTypeB.getRoomFee() %></div>
							<div class="type-data">남은 객실 수 : <%= resvType.substring(3,4) %></div>
						</div>
					</div>
	
					<!-- select-button -->
					<div class="type-submit">
						<button class="type-select-button" type="submit">예약하기</button>
					</div>
				</div>
				
				<!-- B type hidden data -->
				<input type="hidden" id="roomType" name="roomType" value="<%= roomTypeB.getRoomType() %>">
				<input type="hidden" id="roomSize" name="roomSize" value="<%= roomTypeB.getRoomSize() %>">
				<input type="hidden" id="roomFee" name="roomFee" value="<%= roomTypeB.getRoomFee() %>">
				
				<!-- Calender hidden -->
				<input type="hidden" id="startDate" name="startDate" value="<%= resvDay.getReservationStartDate() %>">
				<input type="hidden" id="endDate"   name="endDate"   value="<%= resvDay.getReservationEndDate() %>">
				<input type="hidden" id="stayDate"  name="stayDate"  value="<%= resvDay.getReservationStayDate() %>">
			</form>
				
			<% } %>
			
			<% if(roomTypeA == null && roomTypeB == null) { %>
				
				<div class="null-content">예약 가능한 객실이 없습니다.</div>

				<!-- Calender hidden -->
				<input type="hidden" id="startDate" name="startDate" value="<%= resvDay.getReservationStartDate() %>">
				<input type="hidden" id="endDate"   name="endDate"   value="<%= resvDay.getReservationEndDate() %>">
				<input type="hidden" id="stayDate"  name="stayDate"  value="<%= resvDay.getReservationStayDate() %>">
				
				<script>
					
					$(function() {
						
						$(".reservation-content").css("height", "500px");
							
				});

				</script>
			
			<% } %>
			<!-- Calender hidden -->
			<input type="hidden" id="sDate" value="<%= resvDay.getReservationStartDate() %>">
			<input type="hidden" id="eDate" value="<%= resvDay.getReservationEndDate() %>">
			<input type="hidden" id="tDate" value="<%= resvDay.getReservationStayDate() %>">

			<script>
				
				// 데이트피커에 선택한 값 넣어주기
				$(function() {
					
					let startDate = $("#sDate").val();
		        	let endDate = $("#eDate").val();
		        	let stayDate = $("#tDate").val();
		        	
		        	let sDate = startDate.substring(0, 4) + "-" + startDate.substring(4, 6) + "-" + startDate.substring(6, 8);
					let eDate = endDate.substring(0, 4) + "-" + endDate.substring(4, 6) + "-" + endDate.substring(6, 8);
		        	
		        	// console.log(startDate);
		        	// console.log(endDate);
		        	   	
		        	$("#mainReservationStartDate").val(sDate);
		        	$("#mainReservationEndDate").val(eDate);
		        	$(".mainReservationDays").val(stayDate + "박");
							
				});
				
			</script>

		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
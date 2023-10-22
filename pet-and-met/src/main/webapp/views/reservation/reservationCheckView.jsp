<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.reservation.model.vo.Reservation" %>
<%
	String pagePath = "./";

	ArrayList<Reservation> resvList = (ArrayList<Reservation>)request.getAttribute("resvList");
	
	System.out.println(resvList);
	// 내가 그동안 예약했던 내역들이 다들어있음
	
	
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
		width: 200px;
		height: 60px;
		margin: auto;
		text-align: center;
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
		margin-top: 10px;
		box-sizing: border-box;	
	}

	/* content */
	.reservation-content {
		width: 100%;
		height: 950px;
		margin-top: 0px;
	}

	.form-resv {width: 98%; height: 40%; margin-top: 50px; margin-left: 20px;}

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
		margin-top: 20px;
		top: 215px;
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
		font-weight: 600;
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

	#date { font-size: 18px;}
	
</style>
</head>
<body>
	
	<%@ include file="../common/header.jsp" %>

	<div class="outer" >

		<!-- reservation index -->
		<div class="reservation-index">
			<div id="index-text">예약 내역 조회</div>
		</div>
		
		<br>
		<!-- contnet 구분선 -->
		<div class="dividing-line"></div>
		
		<!-- content -->
		<div class="reservation-content" style="overFlow-y : scroll">	
			
			<% if(resvList.isEmpty()) { %>
				
				<div class="null-content">예약 한 객실이 없습니다.</div>
				
				<script>
					
					$(function() {
						
						$(".reservation-content").css("height", "500px");
							
				});
				</script>
			
			<% } else { %>
			
			<% int index = 0; %>
			
			<% for(Reservation resv : resvList) { %>
			
				<form class="form-resv">
					<div class="type">		
						<!-- 객실 img type -->
						<div class="type-img">
							<div class="roomImg">
								<img src="<%= pagePath%>resources/img/room/A_type.png">
							</div>
						</div>
		
						<!-- type content -->
						<div class="type-content">
							<div class="roomType" id="type"><%= resv.getReservationType() %> TYPE</div>	
							<input type="hidden"  name="hiddenNo" value="<%= resv.getReservationNo() %>">
							<br><br>
							<div class="type-data-div">
								<div class="type-data" id="rDate"><%= resv.getReservationRegistDate().substring(0, 10) %></div>				
								<div class="type-data" id="date"><%= resv.getReservationStartDate().substring(0, 10) + " ~ " + resv.getReservationEndDate().substring(0, 10) %></div>
								<div class="type-data" id="won"><%= resv.getReservationFee() * resv.getReservationStayDate() %>원</div>
							</div>
						</div>
		
						<!-- select-button -->
						<div class="type-submit">
							<button class="type-select-button" id="button-update" type="submit">예약자 수정</button>
							<button class="type-select-button" id="button-delete" type="submit">예약 취소</button>
						</div>
					</div>
				</form>
				
				<!-- contnet 구분선 -->
				<div class="dividing-line"></div>
			
			<% } %>
			
		<% } %>				
		</div>
	</div>
	
	<script>
		$("#button-update").click(function () {
		       $("form").attr("action", "<%= contextPath %>/modify.resv");
		});
		 
		$("#button-delete").click(function () {
		       $("form").attr("action", "/manage/delete");
		});

	</script>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.reservation.model.vo.Reservation" %>

<% 
	String pagePath = "./"; 

	Reservation resvDay = (Reservation)request.getAttribute("resvDay");
	String roomType = (String)request.getAttribute("roomType");
	int roomFee = (int)request.getAttribute("roomFee");
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
		border: 1px solid red;
	}

	/* test div */
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
	#index-three {
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
		height: 1300px;
		margin-top: 0px;
	}

	form {width: 100%; height: 100%; margin-top: 30px;}

	
	/* type div */
	.customer {width: 100%; height: 300px;  margin-left: 130px;}
	.customer > div {display: inline-block; box-sizing: border-box; width: 35% ; margin-left: 50px;}
	.customer-data { width: 100%; height: 100%; }
	.pay-data { width: 100%; height: 100%;}
	
	/*  */
	.table {
		border-left : 1px dotted lightgrey;
        border-right: 1px dotted lightgrey;
        border-bottom: 1px dotted lightgrey;
		
		width: 20px;
		height: 55%;
		margin: auto; 
	}

	#table-pay { 
		height: 45%;
		margin: auto; 
	}

	.table-div {
		width: 100%;
		height: 50px;
		font-size: 30px;
		text-align: left;
		margin: auto; padding-top: 6px;
		border-top: 1px solid black;
		background-color: rgb(240, 240, 240);}

	.table-index { text-align: left; font-size: 20px; height: 50px;}

    .table-text {font-size: 16px; font-weight: 500; width: 140px; text-align: left; padding-left: 35px;}
    .table-content {width: 200px; height: 30px;}

	/* request-data-area */
	.request-data {width: 93%; height: 100%; margin-left: 7%; padding-left: 7%; padding-top: 2%; background-color: rgb(240, 240, 240);}
	.request-text {width: 90%; height: 35%;}
	.request-caution {width: 90%; height: 35%; margin-top: 40px;}
	textarea {width: 100%; height: 100%; box-sizing: border-box;}

	/* request-rule */
	.request-rule { width: 100%; height: 780px; margin-top: 10px;}
	.request-commit { width: 100%; height: 150px;}

	/* rule */
	.rule {width: 80%; height: 45%; margin: auto; margin-top: 25px; background-color: rgb(52, 152, 219); padding-top: 10px; padding-left: 30px;
	font-size: 30px; font-weight: 700; color: white;}
	.rule-text {width: 96%; height: 75%; margin-top: 10px; background-color: rgb(255, 235, 152);}

	
	/* request-commit */
	.commit-button {
		width: 600px; 
		height: 130px;
		position: relative;
		left: 397px;
		top: 17px;
		background-color: rgb(52, 73, 94);
	}

	/* commit div  */
	.request-commit-div {
		width: 32%;
		height: 100%;
		float: left;
		box-sizing: border-box;
		font-size: 28px;
		font-weight: 800;
		color: white;
	}
	
	/* commit fee&won */
	#fee {position: relative; left: 15px; top: 15px;}
	#won {position: relative; top: 78px;}

	/* commit button */
	.request-commit-button {
		width: 100%;
		height: 40%;
		margin-top: 38%;
		background-color: rgb(121, 172, 120);
		font-size: 22px;
		font-weight: 800;
		color: white;
	
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
			><div class="index two" id="index-two">2</div
			><div class="line"></div
			><div class="index three" id="index-three">3</div>
			<div id="index-text">고객 정보 입력</div>
		</div>
		
		<!-- contnet 구분선 -->
		<div class="dividing-line"></div>
		
		<!-- content -->
		<div class="reservation-content">	
			
			<!-- customer form -->
			<form action="<%= pagePath %>payment.ready" method="post">
				
				<div class="customer">				
					
					<!-- customer-data  -->
					<div class="customer-data">
						<table class="table">
							
							<div class="table-div">&nbsp;정보 입력</div>
							<tbody>
								<tr>
									<th colspan="2" class="table-index">&nbsp;고객정보</th>
					
								</tr>
								<tr>
									<th class="table-text">&nbsp;아이디</th>
									<td><input type="text" class="table-content" name="memberId" value="<%= loginMember.getMemberId() %>" readonly></td>
								</tr>
								<tr>
									<th class="table-text">&nbsp;성명</th>
									<td><input type="text" class="table-content" name="memberName" value="<%= loginMember.getMemberName() %>" ></td>
								</tr>
								<tr>
									<th class="table-text">&nbsp;이메일</th>
									<td><input type="text" class="table-content" name="memberEmail" value="<%= loginMember.getMemberEmail() %>" ></td>
								</tr>
								<tr>
									<th class="table-text">&nbsp;연락처</th>
									<td><input type="text" class="table-content" name="memberPhone" value="<%= loginMember.getMemberPhone() %>" ></td>
								</tr>
							</tbody>
						</table>
					
					</div>
	
					<!-- pay-data -->
					<div class="pay-data">
                        <table class="table" id="table-pay">
							
							<div class="table-div">&nbsp;결제 입력</div>

							<tbody>
                                <tr>
									<th colspan="2" class="table-index">&nbsp;결제 정보</th>
					
								</tr>
								<tr>
									<th class="table-text">&nbsp;날짜</th>
									<td><input type="text" class="table-content" id="rDate" value="" readonly></td>
								</tr>
								<tr>
									<th class="table-text">&nbsp;총합일수</th>
									<td><input type="text" class="table-content" id="rDay" value="" readonly></td>
								</tr>
								<tr>
									<th class="table-text">&nbsp;객실정보</th>
									<td><input type="text" class="table-content" id="rRoom" value="<%= roomType %> Type" readonly></td>
								</tr>
							</tbody>
						
                        </table>
					</div>
					
				</div>

				<!-- request rule -->
				<div class="request-rule">
					<div class="rule">
						유의사항
						<div class="rule-text"></div>
					</div>
					<div class="rule">
						취소 및 환불 규정
						<div class="rule-text"></div>
					</div>
				</div>

				<div class="request-commit">
					<div class="commit-button">
						<div class="request-commit-div" id="fee">요금합계</div
						><div class="request-commit-div" id="won"></div
						><div class="request-commit-div">
							<button class="request-commit-button" type="submit">예약하기</button>
						</div>
					</div>
				</div>
				
				<!-- hidden -->
				<input type="hidden" id="roomFee" 	name="roomFee"  	value="<%= roomFee %>">
				
				<input type="hidden" id="startDate" name="startDate" 	value="<%= resvDay.getReservationStartDate() %>">
				<input type="hidden" id="endDate" 	name="endDate" 		value="<%= resvDay.getReservationEndDate() %>">
				<input type="hidden" id="stayDate" 	name="stayDate" 	value="<%= resvDay.getReservationStayDate() %>">
				<input type="hidden" id="reservationMemo" 	name="reservationMemo" 	value="<%= resvDay.getReservationMemo() %>">
				
				<input type="hidden" id="roomType"  name="roomType"   	value="<%= roomType %>">
				
				<input type="hidden" id="memberNo"  name="memberNo"   	value="<%= loginMember.getMemberNo() %>">
			
			</form>

		</div>
	</div>
	
	<script>
	
		// 원 계산
		$(function() {
			
			let fee = $("#roomFee").val();
	       	
	       	let won = fee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	       	
	       	$("#won").text(won + "원");
	       	// $("#roomWon").val(fee);
		});
		
		// 숙박 일수
		$(function() {
			
			let day1 = $("#stayDate").val();
			
			let day2 = Number(day1) + 1;
	
			$("#rDay").val(day1 + "박 " + day2 + "일");
				
		});
		
		// 예약날짜 표기
		$(function() {
		
			let startDate = $("#startDate").val();
			
			let endDate = $("#endDate").val();
			
			let sDate = startDate.substring(0, 4) + "-" + startDate.substring(4, 6) + "-" + startDate.substring(6, 8);
			let eDate = endDate.substring(0, 4) + "-" + endDate.substring(4, 6) + "-" + endDate.substring(6, 8);
			
			$("#rDate").val(sDate + " ~ " + eDate);
				
		});
			
	</script>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>
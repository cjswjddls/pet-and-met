<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.reservation.model.vo.Room, com.kh.reservation.model.vo.Reservation" %>
<% 
	String pagePath = "./"; 

	Reservation resvDay = (Reservation)request.getAttribute("resvDay");
	Room resvType = (Room)request.getAttribute("resvType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 요청사항 접수</title>
<style>

	.outer{
		width: 1400px;
		margin: auto;
		margin-top: 50px;
		/* border: 1px solid red; */
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
	#index-two {
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
		height: 1490px;
		margin-top: 0px;
	}

	form {width: 100%; height: 100%; margin-top: 50px;}

	
	/* type div */
	.request {width: 100%; height: 475px;}
	.request > div {float: left;box-sizing: border-box;}
	.request-room { width: 30%; height: 98%; }
	.request-content { width: 70%; height: 100%;}
	
	
	/* type content */
	.roomType {
		width: 100%;
		height: 15%;
		margin:auto;
		border-radius: 10px;
		background-color: rgb(188, 142, 207);
		text-align: center;
		box-sizing: border-box;
		line-height: 65px;
		font-size: 30px;
		border: 1px solid black;
	}	
	/* 객실 room-data */
	.room-data { width: 100%; height: 80%; margin-top: 8%; box-sizing: border-box;}

	/* room */
	.room {width: 100%; height: 25%; box-sizing: border-box; text-align: center; line-height: 90px; font-size: 20px; font-weight: 600; background-color: beige; border: 1px solid black;}

	/* request-data-area */
	.request-data {width: 93%; height: 100%; margin-left: 7%; padding-left: 7%; padding-top: 2%; background-color: rgb(240, 240, 240); border: 1px solid black;}
	.request-text {width: 90%; height: 35%;}
	.request-caution {width: 90%; height: 35%; margin-top: 40px; border: 1px solid black;}
	textarea {width: 100%; height: 100%; box-sizing: border-box;}

	/* request-rule */
	.request-rule { width: 100%; height: 780px; margin-top: 10px;}
	.request-commit { width: 100%; height: 150px;}

	/* rule */
	.rule {width: 80%; height: 45%; margin: auto; margin-top: 25px; background-color: rgb(52, 152, 219); padding-top: 10px; padding-left: 30px;
	font-size: 30px; font-weight: 700; color: white;}
	.rule-text {width: 96%; height: 75%; margin-top: 10px; background-color: rgb(255, 235, 152); font-size: 16px; color: black;}

	
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
			><div class="index three">3</div>
			<div id="index-text">요청사항 입력</div>
		</div>
		
		<!-- contnet 구분선 -->
		<div class="dividing-line"></div>
		
		<!-- content -->
		<div class="reservation-content">	
			
			<!-- request form -->
			<form action="<%= pagePath %>customer.resv" method="post">
				
				<div class="request">				
					<!-- request room-data  -->
					<div class="request-room">
						<!-- roomType -->
						<div class="roomType"><%= resvType.getRoomType() %> Type</div>
						
						<div class="room-data">
							<div class="room" id="todyDate"></div>
							<div class="room" id="sDate"></div>
							<div class="room" id="eDate"></div>
							<div class="room">객실 면적 : <%= resvType.getRoomSize() %></div>
						</div>
					</div>
	
					<!-- request content -->
					<div class="request-content">
						<div class="request-data">
							<h2>추가 요청 사항</h2>
							<div class="request-text">
								<textarea name="reservationMemo" cols="70" rows="10" style="resize: none;"></textarea>
							</div>
							<div class="request-caution">
								<textarea name="reservationMemo" cols="70" rows="10" style="resize: none;" readonly>
국내 숙소의 체크인은 일반적으로 오후 2시 이후부터 가능하며, 체크아웃은 정오 12시 전까지 입니다.
숙소에 따라 체크인 시간이 다른 경우도 있으므로 해당 숙소 정보에서 반드시 확인해 주시기 바랍니다.

체크인 시간이 늦어질 경우 호텔엔조이나 해당 숙소에 미리 알려주시기 바랍니다.

숙소에 따라서 사전 요청 없이 늦게 체크인을 할 경우 고객이 숙박하지 않는 것으로 간주하여 숙소 별 
규정에 따라 투숙이 불가능 할 수 있으므로 체크인이 늦어질 경우 호텔엔조이에 미리 알려주시면 숙소
와 연락하여 전달해 드리며, 고객님께서 직접 숙소로 예약 확인을 하실 수 있습니다.
								
								</textarea>
							</div>
						</div>
					</div>
					
				</div>

				<!-- request rule -->
				<div class="request-rule">
					<div class="rule">
						유의사항
						<div class="rule-text">
							<pre>

 객실이용 시 에어컨이나 히터 등이 고장이거나 작동법을 모르실 경우 프론트에 문의하세요.

 객실 내 음료와 기타 식품들은 화장대 위나 냉장고 위에 비치되어 있는 간단한 차와 커피 등을 제외하면 대부분 유료이므로 꼭
 확인하시고 이용하시길 바랍니다. 숙소에 따라 치약/칫솔을 구비해두지 않으므로 별도로 준비하셔야 합니다.

 조식이 포함되어있는 숙소의 경우 아침 식사하는 장소에 대해 체크인 시 알아두면 편리하게 이용하실 수 있습니다.

 숙소 내 사우나, 헬스, 수영장 등의 부대시설을 이용하실 때에는 투숙객인 경우 할인되는 경우가 있으니 프론트에 문의하시면 
 보다 저렴하게 이용하실 수 있습니다.
	
							</pre>
						</div>
					</div>
					<div class="rule">
						취소 및 환불 규정
						<div class="rule-text">
							<pre>
								
 당사는 실제 투숙 여부와 관계없이 확정된 숙박 건에 수수료를 부과합니다.

 또한, 다음과 같은 경우에도 수수료를 납부하셔야 합니다.

 환불 불가 또는 부분 환불 가능 예약에서 노쇼 또는 취소가 발생하여 고객에게 위약금을 청구한 경우
 무료 취소 기간이 지난 후 예약을 취소한 고객에게 위약금을 청구한 경우
 다음과 같은 경우에는 수수료를 납부하실 필요가 없습니다.

 환불 불가 예약 또는 부분 환불 가능 예약에 부과되는 취소 위약금을 면제하기로 결정한 경우
 고객이 예정된 날짜에 숙소에 나타나지 않아 엑스트라넷 또는 Pulse 앱에서 해당 예약 건을 노쇼로 표시하고 
 위약금은 면제하기로 결정한 경우요금이 청구되지 않는 고객의 카드를 유효하지 않은 신용카드로 표시한 경우


							</pre>


						</div>
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
					
					<!-- customer 로 보낼 데이터 -->
					<input type="hidden" id="roomFee" name="roomFee"  value="<%= resvType.getRoomFee()%>">
					<input type="hidden" id="roomFeeWon" name="roomFeeWon"  value="">
					
					<input type="hidden" id="stayDate"  name="stayDate"  value="<%= resvDay.getReservationStayDate() %>">	
					<input type="hidden" id="startDate" name="startDate" value="<%= resvDay.getReservationStartDate() %>">
					<input type="hidden" id="endDate"   name="endDate"   value="<%= resvDay.getReservationEndDate() %>">
					<input type="hidden" id="roomType"  name="roomType"   value="<%= resvType.getRoomType() %>">

				</div>	
			</form>

		</div>
	</div>
	
	<script>
	
		// 원표기
		$(function() {
			
			let roomFee = $("#roomFee").val();
	       	let stayDate = $("#stayDate").val();
	     
	       	let fee = roomFee * stayDate;
	       	let won = fee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	       	
	       	$("#won").text(won + "원");
	    	$("#roomFeeWon").val(fee);
	       	
		});
		
		// 예약날짜 표기
		$(function() {
		
			let startDate = $("#startDate").val();
			
			let endDate = $("#endDate").val();
			
			let sDate = startDate.substring(0, 4) + "-" + startDate.substring(4, 6) + "-" + startDate.substring(6, 8);
			let eDate = endDate.substring(0, 4) + "-" + endDate.substring(4, 6) + "-" + endDate.substring(6, 8);
			
			$("#sDate").text("객실 입실 날짜 : " + sDate);
			$("#eDate").text("객실 퇴실 날짜 : " + eDate);
				
		});
		
		// 현재 날짜 출력
		$(function() {
		
			let now = new Date();
			
			let year = now.getFullYear();
			let month = now.getMonth() + 1;
			let date = now.getDate();
			
			$("#todyDate").text("객실 예약 날짜 : " + year + "-" + month + "-" + date);			
		});
			
	</script>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
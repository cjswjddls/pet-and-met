<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.reservation.model.vo.Room" %>
<% 
	String pagePath = "./"; 
	String hiddenTypeA = (String)request.getAttribute("hiddenTypeA");
	String hiddenTypeB = (String)request.getAttribute("hiddenTypeB");
	Room r = (Room)request.getAttribute("type");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.outer{
		width: 1000px;
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
	.request-room { width: 30%; height: 100%; }
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
	}	
	/* 객실 room-data */
	.room-data { width: 100%; height: 80%; margin-top: 8%; box-sizing: border-box;}

	/* room */
	.room {width: 100%; height: 25%; box-sizing: border-box; text-align: center; line-height: 90px;}

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
			><div class="index three">3</div>
			<div id="index-text">요청사항 입력</div>
		</div>
		
		<!-- contnet 구분선 -->
		<div class="dividing-line"></div>
		
		<!-- content -->
		<div class="reservation-content">	
			
			<!-- request form -->
			<form action="<%= pagePath %>?" method="post">
				
				<div class="request">				
					<!-- request room-data  -->
					<div class="request-room">
						<!-- roomType -->
						<div class="roomType"><%= r.getRoomType() %></div>
						
						<div class="room-data">
							<div class="room">객실 예약 일자</div>
							<div class="room">객실 입실 일자</div>
							<div class="room">객실 퇴실 일자</div>
							<div class="room"><%= r.getRoomSize() %></div>
						</div>
					</div>
	
					<!-- request content -->
					<div class="request-content">
						<div class="request-data">
							<h2>추가 요청 사항</h2>
							<div class="request-text">
								<textarea name="" cols="70" rows="10" style="resize: none;"></textarea>
							</div>
							<div class="request-caution">내용입력시 주의사항</div>
						</div>
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
						><div class="request-commit-div" id="won"><%= r.getRoomFee()%>원</div
						><div class="request-commit-div">
							<button class="request-commit-button" type="submit">예약하기</button>
						</div>

					</div>
				</div>	


			</form>

		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>
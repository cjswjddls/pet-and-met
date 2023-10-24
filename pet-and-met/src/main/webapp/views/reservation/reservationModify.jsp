<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.reservation.model.vo.Reservation" %>
<%
	String pagePath = "./";

	Reservation resvMemer = (Reservation)request.getAttribute("resvMemer");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 수정</title>
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
		width: 250px;
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

	/* content */
	.reservation-content {
		width: 100%;
		height: 580px;
		margin-top: 0px;
	}

	form {width: 100%; height: 100%; margin-top: 30px; margin: auto;}

	
	/* type div */
	.modify {width: 30%; height: 500px;  margin-left: 130px; margin: auto;}
	.modify > div {display: inline-block; box-sizing: border-box; width: 100% ; margin-left: 50px; margin: auto;}
	.modify-data { width: 100%; height: 100%; }

	/*  */
	.table {
		border-left : 1px dotted lightgrey;
        border-right: 1px dotted lightgrey;
        border-bottom: 1px dotted lightgrey;
		
		width: 20px;
		height: 75%;
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

	.modify-button-div {width: 297px; height: 70px; margin: auto;}
	.modify-button {width: 120px; height: 50px;}
	#modify-commit {margin-left: 50px;}
</style>
</head>
<body>


	<%@ include file="../common/header.jsp" %>

	<div class="outer" >

		<!-- reservation index -->
		<div class="reservation-index">
			<div id="index-text">예약자 정보 수정</div>
		</div>
		
		<br>
		<!-- contnet 구분선 -->
		<div class="dividing-line"></div>
		
		<!-- content -->
		<div class="reservation-content">	
			
			<!-- customer form -->
			<form action="<%= pagePath %>modifiyResult.resv" method="post">
				
				<div class="modify">				
					
					<!-- customer-data  -->
					<div class="modify-data">
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
									<td><input type="text" class="table-content" name="memberName" value="<%= resvMemer.getReservationUserName() %>" required ></td>
								</tr>
								<tr>
									<th class="table-text">&nbsp;이메일</th>
									<td><input type="text" class="table-content" name="memberEmail" value="<%= resvMemer.getReservationUserEmail() %>" required ></td>
								</tr>
								<tr>
									<th class="table-text">&nbsp;연락처</th>
									<td><input type="text" class="table-content" name="memberPhone" value="<%= resvMemer.getReservationUserPhone() %>" required ></td>
								</tr>						
							</tbody>
						</table>
			
						<!-- reservationNo hidden -->
						<input type="hidden"  name="reservationNo" value="<%= resvMemer.getReservationNo() %>">				
					</div>
				</div>

				<div class="modify-button-div">
					<button class="modify-button" type="button" onclick="history.back();">취소</button>
					<button class="modify-button" id="modify-commit" type="submit">완료</button>
				</div>
			</form>
				
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>
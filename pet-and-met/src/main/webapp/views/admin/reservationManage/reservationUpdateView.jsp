<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.reservation.model.vo.Reservation" %>
<% 
	String pagePath = "../";
	
	String pageName = "예약자 수정";
	
	String resvMemberId = (String)request.getAttribute("resvMemberId");
	Reservation resvMemer = (Reservation)request.getAttribute("resvMemer");
	int currentPage = (int)request.getAttribute("currentPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약자 수정 페이지</title>
<style>

	.outer{
		width: 1000px;
		margin: auto;
		margin-top: 50px;
		margin-left: 30%;
		/* border: 1px solid red; */
	}
	
	/* div {border: 1px solid black;} */

	form {width: 100%; height: 100%; margin-top: 30px; margin: auto;}

	
	/* type div */
	.modify {width: 50%; height: 500px;  margin-left: 130px; margin: auto;}
	.modify > div {display: inline-block; box-sizing: border-box; width: 100% ; margin-left: 50px; margin: auto;}
	.modify-data { width: 100%; height: 100%; }

	/*  */
	.table {
		border-left : 1px dotted lightgrey;
        border-right: 1px dotted lightgrey;
        border-bottom: 1px dotted lightgrey;
		
		width: 100%;
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
	<%@ include file="../../common/adminAttachment.jsp" %>
	
	<br>
	
	<div class="outer" >
	
		<!-- customer form -->
		<form action="<%= contextPath %>/updateResult.resv" method="post">
			
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
								<td><input type="text" class="table-content" name="memberId" value="<%= resvMemberId %>" readonly></td>
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
					<input type="hidden"  name="currentPage" value="<%= currentPage %>">				
				</div>
			</div>
	
			<div class="modify-button-div">
				<button class="modify-button" type="button" onclick="history.back();">취소</button>
				<button class="modify-button" id="modify-commit" type="submit">완료</button>
			</div>
		</form>
	
	</div>
</body>
</html>
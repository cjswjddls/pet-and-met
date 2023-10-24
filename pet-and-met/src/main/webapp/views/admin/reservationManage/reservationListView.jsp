<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList, com.kh.reservation.model.vo.Reservation, com.kh.common.model.vo.PageInfo"%>
    <% 
	    String pagePath = "../";
	
		String pageName = "예약 현황";

		PageInfo pi = (PageInfo)request.getAttribute("pi");
		ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("list");

		int currentPage = pi.getCurrentPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		int maxPage = pi.getMaxPage();
    %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>예약 현황</title>
	<style>
		.tableInfo { margin-left: 15%; }
		.tableInfo thead { 
			background-color: rgb(121, 172, 120); 
			border: 1px solid lightgray;
			height: 60px; 
			}
			
		.tableInfo td{
            border: 1px solid lightgray;
            box-sizing: border-box;
        }	
		.tableInfo tbody {border-top: 2px solid black;}	
		.tableInfo tbody { text-align: center; }
		.tableInfo tbody tr { height: 60px; }
		
		.admin-cancel, .admin-update { width: 45%; height: 85%; }
	</style>
	</head>
	<body>
		<%@ include file="../../common/adminAttachment.jsp" %>
		<br><br><br><br>
		<div class="tableInfo">
			<% if ((currentPage > 0) || (currentPage <= maxPage)) { %>
				<table align="center" class="">
					<thead>
						<tr>
							<th width="70">예약번호</th>
							<th width="90">성명</th>
							<th width="160">예약날짜</th>
							<th width="100">객실타입</th>
							<th width="160">입실일</th>
							<th width="160">퇴실일</th>
							<th width="170">총금액</th>
							<th width="140">관리메뉴</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()) { %>
							<tr><td colspan="8">조회된 리스트가 없습니다.</td></tr>
						<% } else { %>
							<% for(Reservation r: list) { %>
								<tr>
									<td><%= r.getReservationNo() %></td>
									<td><%= r.getReservationUserName() %></td>
									<td><%= r.getReservationRegistDate().substring(0, 12) %></td>
									<% if(r.getReservationRoomNo() == 1) { %>
										<td>A타입</td>
									<% } else { %>
										<td>B타입</td>
									<% } %>
									<td><%= r.getReservationStartDate().substring(0, 12) %></td>
									<td><%= r.getReservationEndDate().substring(0, 12) %></td>
									<td><%= r.getReservationFee() %>원</td>
									<td>
										<button type="button" class="admin-cancel" id="admin-cancel">삭제</button>
										<button type="button" class="admin-update" id="admin-update">수정</button>
									</td>
								</tr>
							<% } %>
						<% } %>
					</tbody>
				</table>
				<script>
					$(".admin-cancel").on("click", function() {
						if(window.confirm("예약을 취소 하시겠습니까?")) { location.href = "<%= contextPath %>/adminCancel.resv?rno=" + $(this).parent().parent().children().eq(0).text() + "&currentPage=<%= currentPage %>"; }
					});
					$(".admin-update").click(function() {
						location.href = "<%= contextPath %>/adminUpdate.resv?rno=" + $(this).parent().parent().children().eq(0).text() + "&currentPage=<%= currentPage %>";
					});
				</script>
				<br><br>
				<div class="paging-area" align="center">
					<% if(currentPage != 1) { %>
						<button onclick="location.href = '<%= contextPath %>/adminList.resv?currentPage=<%= currentPage - 1 %>';">&lt;</button>
					<% } %>
					<% for(int p = startPage; p <= endPage; p++) { %>
						<% if(p != currentPage) { %>
							<button onclick="location.href = '<%= contextPath %>/adminList.resv?currentPage=<%= p %>';"><%= p %></button>
						<% } else { %>
							<button disabled><%= p %></button>
						<% } %>
					<% } %>
					<% if(currentPage != maxPage) { %>
						<button onclick="location.href = '<%= contextPath %>/adminList.resv?currentPage=<%= currentPage + 1 %>';">&gt;</button>
					<% } %>
				</div>
			<% } else { %>
				<h1 align="center">오류가 발생했습니다.</h1>
			<% } %>
		</div>
		<br><br><br>
	</body>
</html>
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
	<title>Insert title here</title>
	<style>
		.tableInfo { margin-left: 20%; }
		.tableInfo thead { background-color: lightgray; height: 60px; }
		.tableInfo tbody { text-align: center; }
		.tableInfo tbody tr { height: 60px; }
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
							<th width="70">성명</th>
							<th width="300">예약날짜</th>
							<th width="100">객실타입</th>
							<th width="100">입실일</th>
							<th width="100">퇴실일</th>
							<th width="240">관리메뉴</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()) { %>
							<tr><td colspan="7">조회된 리스트가 없습니다.</td></tr>
						<% } else { %>
							<% for(Reservation r: list) { %>
								<tr>
									<td><%= r.getReservationNo() %></td>
									<td><%= r.getReservationUserName() %></td>
									<td><%= r.getReservationRegistDate() %></td>
									<% if(r.getReservationRoomNo() == 1) { %>
										<td>A타입</td>
									<% } else { %>
										<td>B타입</td>
									<% } %>
									<td><%= r.getReservationStartDate() %></td>
									<td><%= r.getReservationEndDate() %></td>
									<td><button type="button">취소하기</td>
								</tr>
							<% } %>
						<% } %>
					</tbody>
				</table>
				<script>
					$(".tableInfo>table>tbody>tr").click(function() {
						// console.log($(this).children().eq(0).text());
						location.href = "<%= contextPath %>/adminCancel.resv?rno=" + $(this).children().eq(0).text() + "&currentPage=<%= currentPage %>";
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
				<h1 align="center">장난 ㄴㄴ...</h1>
			<% } %>
		</div>
		<br><br><br>
	</body>
</html>
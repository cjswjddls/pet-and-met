<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.common.model.vo.PageInfo, com.kh.board.model.vo.Board, java.util.ArrayList" %>
	<% 
		String pagePath = "./"; 
		String pageName = "공지사항";
		
		PageInfo pi = (PageInfo)(request.getAttribute("pi"));
		ArrayList<Board> list = (ArrayList<Board>)(request.getAttribute("list"));
		ArrayList<Board> listAccent = (ArrayList<Board>)(request.getAttribute("listAccent"));
		
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
		.container hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; }
		.boardSearch { float: right; }
		.boardList { width: 100%; }
		.paging-area button:disabled { background-color: black; color: white; cursor: no-drop; }
		.boardList thead th { font-weight: bold; font-size: 1em; text-align: left; color: aliceblue; }
		.boardList tbody .boardListNormal { font-weight: normal; font-size: 1em; -webkit-box-shadow: 0 2px 2px -2px #0E1119; -moz-box-shadow: 0 2px 2px -2px #0E1119; box-shadow: 0 2px 2px -2px #0E1119; color: skyblue; }
		.boardList { text-align: left; overflow: hidden; width: 80%; margin: 0 auto; display: table; padding: 0 0 8em 0; }
		.boardList td, .boardList th { padding-bottom: 2%; padding-top: 2%; padding-left:2%; }
		.boardList tr:nth-child(odd) { background-color: #323C50; }
		.boardList tr:nth-child(even) { background-color: #2C3446; }
		.boardList th { background-color: #1F2739; }
		.boardList td:first-child { color: #FB667A; }
		.boardList tr:hover { background-color: #464A52; -webkit-box-shadow: 0 6px 6px -6px #0E1119; -moz-box-shadow: 0 6px 6px -6px #0E1119; box-shadow: 0 6px 6px -6px #0E1119; }
		.boardListNormal:hover { background-color: #FFF842; color: #403E10; font-weight: bold; box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px; transform: translate3d(6px, -6px, 0); transition-delay: 0s; transition-duration: 0.4s; transition-property: all; transition-timing-function: line; }
		.boardListAccent { color: khaki; }
		.boardListAccent:hover { background-color: silver; color: forestgreen; font-weight: bold; box-shadow: ivory -1px 1px, ivory -2px 2px, ivory -3px 3px, ivory -4px 4px, ivory -5px 5px, ivory -6px 6px; transform: translate3d(6px, -6px, 0); transition-delay: 0s; transition-duration: 0.4s; transition-property: all; transition-timing-function: line; }
		@media (max-width: 800px) { .boardList td:nth-child(4), .boardList th:nth-child(4) { display: none; } }
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>

		<%@ include file="/views/common/sidebarHotel.jsp" %>

		<% if ((currentPage > 0) && (currentPage <= maxPage)) { %>
			<div class="container">
				<h1><%= pageName %></h1>
				<hr>
				<div class="boardSearch">
					<select name="boardSearchCategory" id="boardSearchCategory">
						<option value="all">제목 + 내용</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input name="" id="boardSearchText" type="text" required placeholder="키워드 입력">
					<input name="" id="boardSearchPage" type="hidden" value="<%= currentPage %>">
				</div>
				<br><br><br><br>
				<div class="boardList">
					<table style="width: 100%;">
						<thead class="thead-dark">
							<tr>
								<th width="15%">글번호</th>
								<th width="40%">제목</th>
								<th width="30%">작성일</th>
								<th width="15%">조회수</th>
							</tr>
						</thead>
						<tbody>
							<% for(Board b: listAccent) { %>
								<!--
								<tr class="boardListLinkAccent">
									<td class="boardListAccent" style="color: orangered;">필독!&nbsp; - <%= b.getBoardNo() %></td>
									<td class="boardListAccent"><%= b.getBoardName() %></td>
									<td class="boardListAccent"><%= b.getBoardInsert() %></td>
									<td class="boardListAccent"><%= b.getBoardView() %></td>
								</tr>
								-->
							<% } %>
							<% if(list.isEmpty()) { %>
								<tr>
									<td colspan="6">조회된 데이터가 없습니다.</td>
								</tr>
							<% } else { %>
								<!--
								<% for(Board b:list) { %>
									<tr class="boardListLinkOnly">
										<td class="boardListNormal"><%= b.getBoardNo() %></td>
										<td class="boardListNormal"><%= b.getBoardName() %></td>
										<td class="boardListNormal"><%= b.getBoardInsert() %></td>
										<td class="boardListNormal"><%= b.getBoardView() %></td>
									</tr>
								<% } %>
								-->
							<% } %>
						</tbody>
					</table>
				</div>
				<div class="paging-area boardPage container" align="center" style="display: flex; align-items: center; padding-left: 30%;">
					<button onclick="pagenation(<%= currentPage - 1 %>);" class="pagePreview">&lt;</button>&nbsp;
					<div id="pageOnArea">
						<% for(int p = -4 ; p <= 6; p++) { %>
							<button id="pageOn<%= p %>" class="pageOn" value="<%= p %>" onclick="pagenation(<%= p %>);"><%= p %></button>
						<% } %>
					</div>
					&nbsp;<button onclick="pagenation(<%= currentPage + 1 %>);" class="pageNext">&gt;</button>
					<!-- <% if(currentPage > 1) { %> -->
						<!-- <button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'">&lt;</button> -->
						<!-- <button onclick="pagenation(<%= currentPage - 1 %>);" class="pagePreview">&lt;</button> -->
					<!-- <% } else { %> -->
						<!-- <button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'" disabled>&lt;</button> -->
						<!-- <button onclick="pagenation(<%= currentPage - 1 %>);" disabled>&lt;</button> -->
					<!-- <% } %> -->
					<!-- <% for(int p = startPage; p <= endPage; p++) { %> -->
						<!-- <% if(p != currentPage) { %> -->
							<!-- <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= p %>'"><%= p %></button> -->
							<!-- <button onclick="pagenation(<%= p %>);"><%= p %></button> -->
						<!-- <% } else { %> -->
							<!-- <button disabled><%= p %></button> -->
							<!-- <button disabled><%= p %></button> -->
						<!-- <% } %> -->
					<!-- <% } %> -->
					<!-- <% if(currentPage != maxPage) { %> -->
						<!-- <button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'">&gt;</button> -->
						<!-- <button onclick="pagenation(<%= currentPage + 1 %>);">&gt;</button> -->
					<!-- <% } else { %> -->
						<!-- <button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'" disabled>&gt;</button> -->
						<!-- <button onclick="pagenation(<%= currentPage + 1 %>);" disabled>&gt;</button> -->
					<!-- <% } %> -->
				</div>
			</div>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<% } else { %>
			<div class="container">
				<h1 align="center">장난치지마세요!</h1>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		<% } %>
		<%@ include file="/views/common/footer.jsp" %>

		<script>
			$(function() {
				$("#boardSearchText").keyup(function() {
					// console.log($("#boardSearchText").val());
					// console.log($("#boardSearchCategory").val());
					$(".boardList tbody").html("");
					$.ajax({
						url: "boardAccent.search",
						type: "get",
						data: { },
						success: function(accent) {
							let resultStr = "";
							for(let i in accent) { resultStr += "<tr class='boardListLinkAccent' onclick=\"location.href='<%= contextPath %>/detail.bo?bno=" + accent[i].boardNo + "'\"><td class='boardListAccent' style='color: orangered;'>" + "필독!&nbsp; - " + accent[i].boardNo + "</td><td class='boardListAccent'>" + accent[i].boardName + "</td><td class='boardListAccent'>" + accent[i].boardInsert + "</td><td class='boardListAccent'>" + accent[i].boardView + "</td></tr>"; }
							
							$(".boardList tbody").html($(".boardList tbody").html() + resultStr);
						},
						error: function() {
							console.log("댓글 조회 ajax 실패");
						}
					})
					$.ajax({
						url: "board.search?currentPage=" + $("#boardSearchPage").val() + "&keyword=" + $("#boardSearchText").val() + "&method=" + $("#boardSearchCategory").val(),
						type: "get",
						data: { },
						success: function(list) {
							let resultStr = "";
							for(let i in list) { resultStr += "<tr class='boardListLinkOnly' onclick=\"location.href='<%= contextPath %>/detail.bo?bno=" + list[i].boardNo + "'\"><td class='boardListNormal'>" + list[i].boardNo + "</td><td class='boardListNormal'>" + list[i].boardName + "</td><td class='boardListNormal'>" + list[i].boardInsert + "</td><td class='boardListNormal'>" + list[i].boardView + "</td></tr>"; }
							
							$(".boardList tbody").html($(".boardList tbody").html() + resultStr);
						},
						error: function() {
							console.log("댓글 조회 ajax 실패");
						}
					})
					//location.href = "<%= contextPath %>/board.search?currentPage=1&keyword=" + $("#boardSearchText").val() + "&method=" + $("#boardSearchCategory").val();
				})
				$("#boardSearchCategory").change(function() {
					// console.log($("#boardSearchText").val());
					// console.log($("#boardSearchCategory").val());
					$(".boardList tbody").html("");
					$.ajax({
						url: "boardAccent.search",
						type: "get",
						data: { },
						success: function(accent) {
							let resultStr = "";
							for(let i in accent) { resultStr += "<tr class='boardListLinkAccent' onclick=\"location.href='<%= contextPath %>/detail.bo?bno=" + accent[i].boardNo + "'\"><td class='boardListAccent' style='color: orangered;'>" + "필독!&nbsp; - " + accent[i].boardNo + "</td><td class='boardListAccent'>" + accent[i].boardName + "</td><td class='boardListAccent'>" + accent[i].boardInsert + "</td><td class='boardListAccent'>" + accent[i].boardView + "</td></tr>"; }
							
							$(".boardList tbody").html($(".boardList tbody").html() + resultStr);
						},
						error: function() {
							console.log("댓글 조회 ajax 실패");
						}
					})
					$.ajax({
						url: "board.search?currentPage=" + $("#boardSearchPage").val() + "&keyword=" + $("#boardSearchText").val() + "&method=" + $("#boardSearchCategory").val(),
						type: "get",
						data: { },
						success: function(list) {
							let resultStr = "";
							for(let i in list) { resultStr += "<tr class='boardListLinkOnly' onclick=\"location.href='<%= contextPath %>/detail.bo?bno=" + list[i].boardNo + "'\"><td class='boardListNormal'>" + list[i].boardNo + "</td><td class='boardListNormal'>" + list[i].boardName + "</td><td class='boardListNormal'>" + list[i].boardInsert + "</td><td class='boardListNormal'>" + list[i].boardView + "</td></tr>"; }
							
							$(".boardList tbody").html($(".boardList tbody").html() + resultStr);
						},
						error: function() {
							console.log("댓글 조회 ajax 실패");
						}
					})
					//location.href = "<%= contextPath %>/board.search?currentPage=1&keyword=" + $("#boardSearchText").val() + "&method=" + $("#boardSearchCategory").val();
				})
			})
		</script>
		<script>
			function pagenation(num) {
				console.log(num)
				$("#boardSearchPage").val(num);
				var currentPage = num;
				console.log(currentPage);
				var plus = -5;
				$(".boardList tbody").html("");
				$(".pagePreview").attr("onClick", "pagenation(${currentPage - 1});");
				$(".pageNext").attr("onClick", "pagenation(${currentPage + 1});");
				$.ajax({
					url: "boardAccent.search",
					type: "get",
					data: { },
					success: function(accent) {
						let resultStr = "";
						for(let i in accent) { resultStr += "<tr class='boardListLinkAccent' onclick=\"location.href='<%= contextPath %>/detail.bo?bno=" + accent[i].boardNo + "'\"><td class='boardListAccent' style='color: orangered;'>" + "필독!&nbsp; - " + accent[i].boardNo + "</td><td class='boardListAccent'>" + accent[i].boardName + "</td><td class='boardListAccent'>" + accent[i].boardInsert + "</td><td class='boardListAccent'>" + accent[i].boardView + "</td></tr>"; }
						
						$(".boardList tbody").html($(".boardList tbody").html() + resultStr);
					},
					error: function() {
						console.log("댓글 조회 ajax 실패");
					}
				})
				$.ajax({
					url: "board.search?currentPage=" + num + "&keyword=" + $("#boardSearchText").val() + "&method=" + $("#boardSearchCategory").val(),
					type: "get",
					data: { },
					success: function(list) {
						let resultStr = "";
						for(let i in list) { resultStr += "<tr class='boardListLinkOnly' onclick=\"location.href='<%= contextPath %>/detail.bo?bno=" + list[i].boardNo + "'\"><td class='boardListNormal'>" + list[i].boardNo + "</td><td class='boardListNormal'>" + list[i].boardName + "</td><td class='boardListNormal'>" + list[i].boardInsert + "</td><td class='boardListNormal'>" + list[i].boardView + "</td></tr>"; }
						
						$(".boardList tbody").html($(".boardList tbody").html() + resultStr);
					},
					error: function() {
						console.log("댓글 조회 ajax 실패");
					}
				})
				if(num <= 1) {
					$(".pagePreview").attr('disabled', true);
				}
				else {
					$(".pagePreview").attr('disabled', false);
				}
				if(num >= <%= maxPage %>) {
					$(".pageNext").attr('disabled', true);
				}
				else {
					$(".pageNext").attr('disabled', false);
				}
				$(".pageOn").each(function(e) {
					if($("#pageOnArea").children().eq(e).val() <= 0) { $("#pageOnArea").children().eq(e).attr('style', "display:none;"); }
					else if($("#pageOnArea").children().eq(e).val() > <%= maxPage - 1 %>) { $("#pageOnArea").children().eq(e).attr('style', "display:none;"); }
					else if($("#pageOnArea").children().eq(e).val() == currentPage) { $("#pageOnArea").children().eq(e).attr('disabled', true); }
					else { $("#pageOnArea").children().eq(e).attr('disabled', false); }
					
					$("#pageOnArea").children().eq(e).val(currentPage + plus);
					plus = plus + 1;
				})
			}
			$(function() {
				var currentPage = 1;
				pagenation(1);
			})
		</script>
	</body>
</html>
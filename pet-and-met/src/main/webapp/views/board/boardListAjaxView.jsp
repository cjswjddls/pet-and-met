<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.common.model.vo.PageInfo, com.kh.board.model.vo.Board, java.util.ArrayList" %>
	<% 
		String pagePath = "./"; 
		String pageName = "공지사항";
		
		int currentPage = (Integer)(request.getAttribute("currentPage"));
	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.container hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; }
		.boardSearch { float: right; margin-right: 150px; }
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
		.boardPage { display: flex; justify-content: center; }
		@media (max-width: 800px) { .boardList td:nth-child(4), .boardList th:nth-child(4) { display: none; } }
		.adminNameBar { width:1000px; margin:auto; color: rgb(121, 172, 120) }
	 	.adminNameBar h1{ text-align:left; }
		.adminNameBar hr { background-color: rgb(121, 172, 120); width:1000px; border: 0; height: 4px; margin-right: 20%; }
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>

		<div class="adminNameBar">
			<br><br><br><br>
			<h1><%= pageName %></h1>
			<hr>
		</div>

		<%@ include file="/views/common/sidebarHotel.jsp" %>

		<% if ((currentPage > 0)) { %>
			<div class="container">
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
							
						</tbody>
					</table>
				</div>
				<% if((loginMember != null) && (loginMember.getMemberAdmin() == 1)) { %>
					<div style="display: flex; justify-content: right; margin-right: 100px;"><button type="button" class="btn btn-outline-info" onclick="location.href='<%= contextPath %>/insert.bo'">글쓰기</button></div>
				<% } %>
				<br><br>
				<div class="paging-area boardPage" style="align-items: center;">
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
					reload($("#boardSearchPage").val());
				})
				$("#boardSearchCategory").change(function() {
					reload($("#boardSearchPage").val());
				})
			})
		</script>
		<script>
			$(function() {
				reload(1);
				var currentPage = <%= request.getAttribute("currentPage") %>
			})
			function reload(e) {
				$(".boardList tbody").html("");
				$(".boardPage").html("");
				$("#boardSearchPage").val(e);
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
						console.log("");
					}
				})
				$.ajax({
					url: "list.boajax?currentPage=" + $("#boardSearchPage").val() + "&keyword=" + $("#boardSearchText").val() + "&method=" + $("#boardSearchCategory").val(),
					type: "get",
					data: { },
					success: function(list) {
						let resultStr = "";
						for(let i in list) { resultStr += "<tr class='boardListLinkOnly' onclick=\"location.href='<%= contextPath %>/detail.bo?bno=" + list[i].boardNo + "'\"><td class='boardListNormal'>" + list[i].boardNo + "</td><td class='boardListNormal'>" + list[i].boardName + "</td><td class='boardListNormal'>" + list[i].boardInsert + "</td><td class='boardListNormal'>" + list[i].boardView + "</td></tr>"; }
						
						$(".boardList tbody").html($(".boardList tbody").html() + resultStr);
					},
					error: function() {
						console.log("");
					}
				})
				$.ajax({
					url: "list.pageajax?currentPage=" + $("#boardSearchPage").val() + "&keyword=" + $("#boardSearchText").val() + "&method=" + $("#boardSearchCategory").val(),
					type: "get",
					data: { },
					success: function(pages) {
						let resultStr = "";
						if ($("#boardSearchPage").val() > 1) {
							resultStr += "<button onclick='reload(" + (pages.currentPage - 1) + ")'>&lt;</button>&nbsp;";
						}
						else {
							resultStr += "<button disabled>&lt;</button>&nbsp;";
						}
						for(let p = pages.startPage; p <= pages.endPage; p++) {
							if(p != pages.currentPage) { resultStr += "<button onclick='reload(" + p + ")'>" + p + "</button>&nbsp;"; }
							else { resultStr += "<button disabled>" + p + "</button>&nbsp;"; }
						}							
						if ($("#boardSearchPage").val() < pages.endPage) {
							resultStr += "<button onclick='reload(" + (pages.currentPage + 1) + ")'>&gt;</button>";
						}
						else {
							resultStr += "<button disabled>&gt;</button>";
						}
						
						$(".boardPage").html($(".boardPage").html() + resultStr);
					},
					error: function() {
						console.log("");
					}
				})
			}
		</script>
	</body>
</html>
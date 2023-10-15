<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% 
		String pagePath = "./"; 
		String pageName = "공지사항";
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
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>

		<%@ include file="/views/common/sidebarHotel.jsp" %>

		<div class="container">
			<h1><%= pageName %></h1>
			<hr>
			<div class="boardSearch">
				<form action="" method="get">
					<select name="boardSearchCategory" id="boardSearchCategory">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" required placeholder="키워드 입력">
					<button type="submit">검색</button>
				</form>
			</div>
			<br><br>
			<div class="boardList">
				<table style="width: 100%;">
					<thead>
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
			<div class="boardPage"></div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
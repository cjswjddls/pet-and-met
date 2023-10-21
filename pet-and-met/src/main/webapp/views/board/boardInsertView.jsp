<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.vo.Attachment" %>
	<% 
		String pagePath = "./"; 
		String pageName = "공지사항 작성";

		Board b = (Board)request.getAttribute("b");
		Attachment at = (Attachment)request.getAttribute("at");
	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.adminNameBar { width:1000px; margin:auto; color: rgb(121, 172, 120) }
	 	.pageName{ text-align:left; }
		.adminNameBar hr { background-color: rgb(121, 172, 120); width:1000px; border: 0; height: 4px; margin-right: 20%; }
		.boardInsertTable { border: 1px solid rgb(121, 172, 120); width: 1000px; }
		.boardInsertTable th { text-align: center; }
		.boardInsertTable tr { height: 30px; }
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>

		<div class="adminNameBar">
			<br><br><br><br>
			<h1 class="pageName"><%= pageName %></h1>
			<hr><br><br><br>
			<form action="<%= contextPath %>/insertDone.bo" method="post" enctype="multipart/form-data">
				<table class="boardInsertTable">
					<thead>
						<tr>
							<th colspan="8"><h1 align="center">게시글 등록</h1></th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="7"><input type="text" name="title" style="width: 100%; height: 60px;" placeholder="제목을 입력해주세요." required></td>
						</tr>
						<tr>
							<th rowspan="20">내용</th>
							<td rowspan="20"><textarea name="content" id="" style="resize: none; width: 100%; height: 800px;"></textarea></td>
						</tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr><th>필독!</th><td colspan="7"><input type="checkbox" name="isAccent">&nbsp;필독여부 지정</td></tr>
						<tr><th rowspan="3">첨부파일1</th><td colspan="7" rowspan="3"><input type="file" name="upfile1"></td></tr>
						<tr><td></td></tr>
						<tr><td></td></tr>
						<tr><th rowspan="3">첨부파일2</th><td colspan="7" rowspan="3"><input type="file" name="upfile2"></td></tr>
						<tr><td></td></tr>
						<tr><td></td></tr>
					</tbody>
				</table>
				<br><br>
				<div style="display: flex; justify-content: center;"><button type="submit" class="btn btn-outline-success">확인</button>&nbsp;&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-outline-warning">취소</button></div>
			</form>
		</div>
		<br><br><br>

		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
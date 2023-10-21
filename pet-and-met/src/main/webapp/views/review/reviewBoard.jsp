<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.vo.Attachment" %>
    <% 
		String pagePath = "./"; 
		String pageName = "리뷰게시판";

		Board b = (Board)request.getAttribute("b");
		Attachment at = (Attachment)request.getAttribute("at");
	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.container hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; }
		.boardViewTable { width: 100%; height: 800px; }
		.boardViewTable th, .boardViewTable td { height: 10px; text-align: center; }
		.boardViewTable th { background-color: beige; }
		.boardViewTableElements { border: 1px solid lightgray; }
		.boardViewTableButton { text-decoration: none; color: white; background-color: violet; font-size: x-large;}
		.boardViewTableButton:hover { text-decoration: none; color: violet; background-color: white; }
		.deleteButton{ text-decoration: none; color: white; background-color: violet; font-size: x-large; }
		.updateButton{ text-decoration: none; color: white; background-color: violet; font-size: x-large; }
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>

		<%@ include file="/views/common/sidebarHotel.jsp" %>
		
		<div class="container">
			<h1><%= pageName %></h1>
			<hr>
			<table class="boardViewTable boardViewTableElements">
				<tr>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: left;"><h5><b>리뷰게시판&nbsp;&nbsp;&#10095;</b></h5></td>
				</tr>
				<tr>
					<td colspan="6" style="border-bottom: 1px solid lightgray;"><h4><b><%= b.getBoardName() %></b></h4></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">아이디</th>
					<td class="boardViewTableElements">작성 아이디</td>
					<td colspan="4"></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">등록일시</th>
					<td class="boardViewTableElements">작성 등록일<%= b.getBoardInsert() %></td>
					<th class="boardViewTableElements">조회수</th>
					<td class="boardViewTableElements">숫자<%= b.getBoardView() %></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">첨부파일</th>
					<td colspan="5" class="boardViewTableElements">
						<% if(at == null) { %>
							첨부파일이 없습니다.
						<% } else { %>
							<a download="<%= at.getAttachmentOriginName() %>" href="<%= contextPath %>/<%= at.getAttachmentFilePath() + at.getAttachmentChangeName() %>"><%= at.getAttachmentOriginName() %></a>
						<% } %>
					</td>
				</tr>
				<tr>
					<td colspan="6" rowspan="20">
						<textarea name="" id="" readonly style="width: 100%; height: 100%; margin: 0; padding: 0px;">업데이트 한 내용<%= b.getBoardContent() %></textarea>
					</td>
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
			</table>
			<div style="float:left;"><a href="javascript:history.back();" 
				class="boardViewTableButton">&nbsp;&nbsp;목록으로&nbsp;&nbsp;</a></div></div>
			<div style="float:right;"><a href="" class="deleteButton">&nbsp;&nbsp;수정&nbsp;&nbsp;</a></div></div>
			<div style="float:right;"><a href="" class="updateButton">&nbsp;&nbsp;삭제&nbsp;&nbsp;</a></div></div>
		<br><br>
		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
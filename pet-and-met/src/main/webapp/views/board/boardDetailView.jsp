<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.vo.Attachment, java.util.ArrayList" %>
    <% 
		String pagePath = "./"; 
		String pageName = "공지사항";

		Board b = (Board)request.getAttribute("b");
		ArrayList<Attachment> at = (ArrayList<Attachment>)request.getAttribute("at");
	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>공지사항 상세보기</title>
	<style>
		.container hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; }
		.boardViewTable { width: 100%; height: 800px; }
		.boardViewTable th, .boardViewTable td { height: 10px; text-align: center; }
		.boardViewTable th { background-color: beige; }
		.boardViewTableElements { border: 1px solid lightgray; }
		.boardViewTableButton { text-decoration: none; color: white; background-color: violet; font-size: x-large; }
		.boardViewTableButton:hover { text-decoration: none; color: violet; background-color: white; }
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
					<td colspan="6" style="text-align: left;"><h5><b>공지사항&nbsp;&nbsp;&#10095;</b></h5></td>
				</tr>
				<tr>
					<td colspan="6" style="border-bottom: 1px solid lightgray;"><h4><b><%= b.getBoardName() %></b></h4></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">등록자명</th>
					<td class="boardViewTableElements">관리자</td>
					<td colspan="4"></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">등록일시</th>
					<td class="boardViewTableElements"><%= b.getBoardInsert() %></td>
					<th class="boardViewTableElements">조회수</th>
					<td class="boardViewTableElements"><%= b.getBoardView() %></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">첨부파일</th>
					<td colspan="5" class="boardViewTableElements">
						<% if(at == null) { %>
							첨부파일이 없습니다.
						<% } else { %>
							<% for(Attachment ats:at) { %>
								<a download="<%= ats.getAttachmentOriginName() %>" href="<%= contextPath %>/<%= ats.getAttachmentFilePath() + ats.getAttachmentChangeName() %>" style="text-decoration: none; color: teal"><%= ats.getAttachmentOriginName() %></a>
								<br>
							<% } %>
						<% } %>
					</td>
				</tr>
				<tr>
					<td colspan="6" rowspan="20">
						<div style="box-sizing: border-box; width: 100%; height: 100%;"><textarea name="" id="" readonly style="width: 100%; height: 100%; margin: 0px; padding: 0px; resize: none;"><%= b.getBoardContent() %></textarea></div>
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
			<div style="float: right;">
				<% if((loginMember != null) && (loginMember.getMemberAdmin() == 1)) { %>
					<a href="<%= contextPath %>/update.bo?bno=<%= b.getBoardNo() %>" class="boardViewTableButton">&nbsp;&nbsp;수정하기&nbsp;&nbsp;</a>
					<a href="javascript:void(0);" class="boardViewTableButton" onclick="reallyDelete();">&nbsp;&nbsp;삭제하기&nbsp;&nbsp;</a>
				<% } %>
				<a href="javascript:history.back();" class="boardViewTableButton">&nbsp;&nbsp;목록으로&nbsp;&nbsp;</a>
			</div>
			<script>
				function reallyDelete(){
					if (window.confirm("정말로 삭제하실래요?")) {
						location.href="<%= contextPath %>/delete.bo?bno=" + <%= b.getBoardNo() %>;
					}
				};
			</script>
		</div>
		<br><br>
		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
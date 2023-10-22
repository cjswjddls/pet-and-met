<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.vo.Attachment" %>
    <% 
		String pagePath = "./"; 
		String pageName = "리뷰게시판";

	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#container{width: 800PX; margin:auto;}
		#container hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; }
		.boardViewTable { width: 100%; height: 800px; }
		.boardViewTable th, .boardViewTable td { height: 10px; text-align: center; }
		.boardViewTable th { background-color: rgb(121, 172, 120); }
		.boardViewTableElements { border: 1px solid rgb(121, 172, 120); }
		.boardViewTableButton { text-decoration: none; color: white; background-color:rgb(121, 172, 120); font-size: x-large;}
		.boardViewTableButton:hover { text-decoration: none; color: rgb(121, 172, 120); background-color: white; }
		.deleteButton{ text-decoration: none; color: white; background-color: rgb(121, 172, 120); font-size: x-large; }
		.updateButton{ text-decoration: none; color: white; background-color: rgb(121, 172, 120); font-size: x-large; }
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>

		<%@ include file="/views/common/sidebarHotel.jsp" %>
		
		<div id="container">
			<h1 style="color: rgb(121, 172, 120);"><%= pageName %></h1>
			<hr>
			<br><br>
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
					<td colspan="1" style="text-align: left;"><h5><b>리뷰게시판&nbsp;&nbsp;&#10095;</b></h5></td>
					<td colspan="5" style="text-align: left;"><h5>제목 : 처음 방문했어요</h5></td>
				</tr>
				<tr>
					<td colspan="6" style="border-bottom: 1px solid rgb(121, 172, 120);"><h4><b></b></h4></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">아이디</th>
					<td class="boardViewTableElements">작성 아이디</td>
					<td colspan="4"></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">등록일시</th>
					<td class="boardViewTableElements">작성 등록일</td>
					<th class="boardViewTableElements">조회수</th>
					<td class="boardViewTableElements">숫자</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">첨부파일</th>
					<td colspan="5" class="boardViewTableElements">
					</td>
				</tr>
				<tr>
					<td colspan="6" rowspan="20">
					<div style="height:40%; width:100%; display:flex;">
					<img src="resources/img/portfolio/portfolio-1.jpg"
					style="width:25%; height:100%;">
					<img src="resources/img/portfolio/portfolio-2.jpg"
					style="width:25%; height:100%;">
					<img src="resources/img/portfolio/portfolio-3.jpg"
					style="width:25%; height:100%;">
					<img src="resources/img/portfolio/portfolio-4.jpg"
					style="width:25%; height:100%;">
					</div>
					<div style="height:50%; width:100%;">
						<textarea name="" id="" readonly
						style="width: 100%; height: 100%; margin: 0; padding: 0px; resize:none;">
업데이트 한 내용</textarea>
					</div>
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
			<br><br>
			<div style="float:left;"><a href="<%= contextPath %>/reviewList.rv" 
				class="boardViewTableButton">&nbsp;&nbsp;목록으로&nbsp;&nbsp;</a></div></div>
			<div style="width:800px; margin-left:70px;" align="center">			
			<div style="float:right; margin-left:20px;  margin-right:20px;"><a href="" class="deleteButton">&nbsp;&nbsp;수정&nbsp;&nbsp;</a></div>
			<div style="float:right;"><a href="" class="updateButton">&nbsp;&nbsp;삭제&nbsp;&nbsp;</a></div>
			</div>
		<br><br><br><br><br><br>
		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.review.model.vo.Files, com.kh.review.model.vo.Review, java.util.ArrayList" %>
    <% 
		String pagePath = "./"; 
		String pageName = "리뷰게시판";
		Review rv = (Review)request.getAttribute("rv");
		ArrayList<Files> list = (ArrayList<Files>)request.getAttribute("list");
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
		.boardViewTable th { background-color: rgb(176, 217, 177); }
		.boardViewTableElements { border-top: 1px solid rgb(121, 172, 120); border-bottom:1px solid rgb(121, 172, 120);}
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
					<td colspan="5" style="text-align: left;"><h5><%= rv.getReviewName() %></h5></td>
				</tr>
				<tr>
					<td colspan="6" style="border-bottom: 1px solid rgb(121, 172, 120);"><h4><b></b></h4></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">아이디</th>
					<td class="boardViewTableElements" colspan="2"><%= rv.getReviewAuthor() %></td>
					<th class="boardViewTableElements">글번호</th>
					<td class="boardViewTableElements" colspan="2"><%= rv.getReviewNo() %></td>
				</tr>
				<tr>
					<th class="boardViewTableElements">등록일자</th>
					<td class="boardViewTableElements" colspan="2"><%= rv.getReviewInsert() %></td>
					<th class="boardViewTableElements">조회수</th>
					<td class="boardViewTableElements" colspan="2"><%= rv.getReviewView() %></td>
				</tr>
				<tr>
					<td colspan="6" rowspan="18">
					<div style="height:50%; width:100%;">
					<textarea readonly
					style="width: 100%; height: 100%; margin: 0; border-radius:10px;
					padding: 0px; resize:none; border:1px solid rgb(121, 172, 120);">

<%= rv.getReviewContent() %></textarea>
					</div>
					<div style="height:40%; width:100%; display:flex;">
					<% if(list != null) { %>
						<% for(Files files : list) { %>
						<img src="<%= contextPath %>/<%= files.getFilesPath() %><%= files.getFilesChangeName() %>"
					style="width:25%; height:100%; margin:auto; border-radius:20px; margin-top:15px;">
						<% } %>
					<% } %>
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
			</table>
			<br><br>
			<div style="float:left;">
			<a href="<%= contextPath %>/reviewList.rv?currentPage=1" 
				class="boardViewTableButton" style="border-radius:10px;">
				&nbsp;&nbsp;목록으로&nbsp;&nbsp;
				</a>
				</div>
				</div>
			
				<div style="width:800px; margin-left:70px;" align="center">	
				<div style="float:right; margin-left:20px;  margin-right:20px;">
				<a href="<%= contextPath %>/delete.rv?rno=<%= rv.getReviewNo() %>" class="updateButton">&nbsp;&nbsp;삭제&nbsp;&nbsp;</a>
				</div>
				</div>
				
<script>
    $(document).ready(function() {
        // 세션에 담긴 loginMember의 ID와 rv.getReviewAuthor()가 일치하는지 확인
        // 세션에 담긴 loginMember가 null이 아닌 경우에만 a 태그를 보이게 합니다.
        <% if (session.getAttribute("loginMember") != null) { %>
            var loginMemberId = '<%= ((Member)session.getAttribute("loginMember")).getMemberId() %>';
            var reviewAuthorId = '<%= rv.getReviewAuthor() %>';
            if (loginMemberId == reviewAuthorId) {
                $('.updateButton').show();
            } else {
                $('.updateButton').hide();
            }
        <% } else { %>
            $('.updateButton').hide();
        <% } %>
    });
</script>

		<br><br><br><br><br><br>
		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
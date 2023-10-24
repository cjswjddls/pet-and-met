<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
	    String pagePath = "./"; 
		
		int result = (int)(request.getAttribute("result"));
	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>공지사항 삭제 결과</title>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>

		<%@ include file="/views/common/sidebarHotel.jsp" %>
		<div class="container">
			<% if(result > 0) { %>
				<span align="center">게시글 삭제에 성공하였습니다.</span>
			<% } else { %>
				<span align="center">게시글 삭제에 실패하였습니다.</span>
			<% } %>
			<a href="<%= contextPath %>/lists.bo?currentPage=1&keyword=&method=">공지사항 홈으로</a>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String pagePath = "./"; %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
			@font-face {
		            font-family: 'Pretendard-Regular';
		            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		            font-weight: 400;
		            font-style: normal;
		        }
		        * { font-family: 'Pretendard-Regular'; }
		 	 #test1 {
	            padding : 10px;
	            background-color : white;
	            border : 1px solid black;
	            width : 900px;
	            height : 500px;
	            margin-left:35%;
	            border-style: outset; /* 면적이 튀어나온 */ 
            	border-width: 10px;
	        }
	        
	        .adminNameBar { 
		 	margin: 0% 0% 0% 30%; 
		 	}
		 	
			.adminNameBar hr { 
			background-color: rgb(121, 172, 120); border: 0; height: 4px; margin-right: 20%; 
			}
			
    </style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		
		<div class="adminNameBar">
			<br><br><br>
			<h1>이용안내</h1>
			<hr>
		</div>
		
		<%@ include file="/views/common/sidebarHotel.jsp" %>
		<div id="test1" class="test"><img src="<%= pagePath %>resources/img/intro/er1.jpg" width="100%" height="100%"></img></div>
		<br><br><br>
        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
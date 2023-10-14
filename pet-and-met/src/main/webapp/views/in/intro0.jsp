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
	    .outher {
	        width : 100%;
	        
	    }       
	    .outher table { 
	    	margin-left: 20%; 
	    	width: 65%; 
	    	border-style: inset;
	    	height: 500px;
           
	    }
	    
	    .outher td { 
	   	    background-color: white; 
	    }
	    
	    .img {
	        right:200px;
	        top: 200px;
	    }
	            
        .adminNameBar { 
	 		margin: 0% 0% 0% 30%; 
	 	}
	 	
		.adminNameBar hr { 
			background-color: rgb(121, 172, 120); 
			border: 0; 
			height: 4px; 
			margin-right: 20%; 
		}
		
	    
    </style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		
		<div class="adminNameBar">
			<br><br><br><br>
			<h1>호텔 소개</h1>
			<hr>
		</div>
		
		<%@ include file="/views/common/sidebarHotel.jsp" %>
		
		<div class="img">
		    <fieldset class="outher">
		    <br>
		        <table border="1">
		            <tr align="center">
		                <td colspan="3" rowspan="2" height="180" width="30%" style="border: 5px solid green;"><img src="<%= pagePath %>resources/img/intro/er.jpg" ></img></td>
		                <td width="30%" height="30" style="border: 5px solid green;">제목</td>
		                <td width="85%" height="30" style="border: 5px solid green;">호텔소개</td>
		            </tr>
		            <tr align="center">
		                <td style="border: 3px solid green;">내용</td>
		                <td style="border: 3px solid green;">호텔 소개 상세</td>
		            </tr>
		        </table>
		        
		    </fieldset>    
		</div>
		<br><br><br>

        <%@ include file="/views/common/footer.jsp" %>
        
	</body>
</html>


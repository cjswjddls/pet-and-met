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
	        height: 800px;
	    }       
	    .outher table { 
	    	margin-left: 15.5%; 
	    	width: 69.5%; 
	    	border-style: inset;
           
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
			<h1>호텔 객실 및 소개</h1>
			<hr>
		</div>
		
		<%@ include file="/views/common/sidebarHotel.jsp" %>
		
		<div class="img">
		    <fieldset style="background-color: rgb(176, 217, 177)" class="outher">
		    <br>
		        <table border="1">
		            <tr align="center">
		                <td colspan="3" rowspan="2" height="180" width="30%" style="border: 5px solid green;"><img src="<%= pagePath %>resources/img/er.jpg" width="100%" height="90%"></img></td>
		                <td width="30%" height="30" style="border: 5px solid green;">제목</td>
		                <td width="85%" height="30" style="border: 5px solid green;">호텔소개</td>
		            </tr>
		            <tr align="center">
		                <td style="border: 3px solid green;">내용</td>
		                <td style="border: 3px solid green;">호텔 소개 상세</td>
		            </tr>
		        </table>
		        
		        <table border="1">
		            <tr align="center">
		                <td colspan="3" rowspan="4" height="230" width="30%" style="border: 5px solid green;"><img src="<%= pagePath %>resources/img/bono.jpg" width="100%"></img></td>
		                <td width="30%" height="30" style="border: 5px solid green;">타입</td>
		                <td width="85%" height="30" style="border: 5px solid green;">A타입</td>
		            </tr>
		            <tr align="center">
		                <td width="50" height="30" style="border: 2px solid green;">설명</td>
		                <td width="200" height="60" style="border: 2px solid green;">설명하는 내용</td>
		            </tr>
		            <tr align="center">
		                <td width="50" height="30" style="border: 2px solid green;">분류</td>
		                <td width="200" height="30" style="border: 2px solid green;">대형반려동물전용</td>
		            </tr>
		            <tr align="center">
		                <td width="50" height="30" style="border: 2px solid green;">가격</td>
		                <td width="200" height="60" style="border: 2px solid green;">가격</td>
		            </tr>
		        </table>
				
		        <table border="1">
		            <tr align="center">
		                <td colspan="3" rowspan="4" height="230" style="border: 5px solid green;" width="30%" ><img src="<%= pagePath %>resources/img/bono.jpg" width="100%"></img></td>
		                <td width="30%" height="30" style="border: 5px solid green;">타입</td>
		                <td width="85%" height="30" style="border: 5px solid green;">B타입</td>
		            </tr>
		            <tr align="center">
		                <td width="50" height="30" style="border: 2px solid green;">설명</td>
		                <td width="200" height="60" style="border: 2px solid green;">설명하는 내용</td>
		            </tr>
		            <tr align="center">
		                <td width="50" height="30" style="border: 2px solid green;">분류</td>
		                <td width="200" height="30" style="border: 2px solid green;">소형반려동물전용</td>
		            </tr>
		            <tr align="center">
		                <td width="50" height="30" style="border: 2px solid green;">가격</td>
		                <td width="200" height="60" style="border: 2px solid green;">가격</td>
		            </tr>
		        </table>
		    </fieldset>    
		</div>
        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
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
        * { font-family: 'Pretendard-Regular'; 
        }
	 	.maps {
	 		margin-left:25%;
	 	}
	 	
	 	.adminNameBar { 
	 	margin: 0% 25% 0% 35%; 
	 	}
	 	
		.adminNameBar hr { 
		background-color: rgb(121, 172, 120); border: 0; height: 4px; margin-right: 20%; 
		}
    </style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		<div class="adminNameBar">
			<br><br><br><br>
			<h3>회사 소개</h3>
			<h1>오시는 길</h1>
			<hr>
		</div>
		<%@ include file="/views/common/sidebarHotel.jsp" %>
		
			<div class="maps">
				<h1>Pet & Met</h1>
				<iframe style="border:0; width: 70%; height: 600px;"
		     			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d332.563553514725!2d126.89691663932159!3d37.533959339249066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec3afcd675b%3A0x1d3b8e50a735e00a!2z7J2066CI67mM65Sp!5e0!3m2!1sko!2skr!4v1694681996499!5m2!1sko!2skr" 
		     			frameborder="0" allowfullscreen></iframe>
			
		    	<u><h2>주소 : 서울특별시 영등포구 양평동</h2></u>
		    	<u><h2>호텔 체크인/아웃 가능시간 : 08:00~20:00</h2></u>
		    	<u><h2>전화번호 : 010-1234-5678</h2></u>
			</div>
        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
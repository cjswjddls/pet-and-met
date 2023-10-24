<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String pagePath = "./"; %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>오시는길 안내</title>
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
        	width:1000px;
        	margin:auto;
	 		color: rgb(121, 172, 120)
	 	}
	 	.adminNameBar h1{
	 	text-align:left;
	 	}
		.adminNameBar hr { 
			background-color: rgb(121, 172, 120);
			width:1000px;
			border: 0; 
			height: 4px; 
			margin-right: 20%; 
		}

		#info-area{
			width: 700px;
			margin:auto;
			margin-top:80px;
			margin-bottom:100px;
		}
		#info-area table{
			width: 700px;
			margin:auto;
		}
		.title-bar{
			display:inline-block;
			width:350px;
			height:50px;
			border:0px;
			text-align:center;
			font-size:25px;
			border-radius:20px;
			background-color:rgb(121, 172, 120);
			color: white;
			margin-top:30px;
			margin-bottom:30px;
			line-height:50px;
			
		}
		#info-area table th{
			width:30%;
		}
		#info-area table td{
			text-align:center;
			width:70%;
			font-size:22px;
		}
		#ppp{
		width: 1000px;
		margin-right: 70px;
		}
		
		#ppp img{
		width: 1000px;
		height:300px;

		}
		
    </style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		<div class="adminNameBar">
			<br><br><br><br>
			<h1>오시는 길</h1>
			<hr>
		</div>
		
		<%@ include file="/views/common/sidebarHotel.jsp" %>

			<div class="maps">
				<h1>Pet & Met</h1>
				<iframe style="border:0; width: 70%; height: 600px;"
		     			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d332.563553514725!2d126.89691663932159!3d37.533959339249066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec3afcd675b%3A0x1d3b8e50a735e00a!2z7J2066CI67mM65Sp!5e0!3m2!1sko!2skr!4v1694681996499!5m2!1sko!2skr" 
		     			frameborder="0" allowfullscreen></iframe>
			</div>
			
			<div id="info-area">
			<table>
				<tr>
					<th>
					<span class="title-bar">주소</span>
					</th>
					<td>
					서울특별시 영등포구 양평동
					</td>
				</tr>
				<tr>
					<th>
					<span class="title-bar">호텔 체크인 / 아웃 가능시간</span>
					</th>
					<td>
					08:00~20:00
					</td>
				</tr>
				<tr>
					<th>
					<span class="title-bar">이용문의</span>
					</th>
					<td>
					010-1234-5678
					</td>
				</tr>
			</table>
			
			<br><br>
			
				<div id="ppp">
				<img src="<%= contextPath %>/resources/img/intro/MAP.PNG">
				</div>
				
			</div>
			
			

        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
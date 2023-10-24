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
		.imgArea{
			width:800px;
			margin:auto;
		}
		.imgArea>img{
			width:80px;
			height:80px;
		}
		.img1Area>p{
			color:rgb(121, 172, 120);
			font-size:40px;
		}
	   #floor{
	   	width:800px;
	   	height:450px;
	   	margin:auto;
	   	border:3px solid rgb(121, 172, 120);
	   }   
    </style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		
		<div class="adminNameBar">
			<br><br><br><br>
			<h1>이용안내</h1>
			<hr>
		</div>
		
		<%@ include file="/views/common/sidebarHotel.jsp" %>
		<div class="img1Area" align="center">
			<p>&lt; 1F &gt;</p>
			<img src="<%=contextPath%>/resources/img/intro/floor.png" id="floor">
		</div>
	<br><br>
		<div class="imgArea" align="left">
			<img src="<%=contextPath%>/resources/img/intro/icons_parking.png">
			&nbsp;&nbsp;<span style="font-size:22px; color:rgb(121, 172, 220); font-weight:700;">호텔 정문 유료주차 (결제고객 3시간 무료)</span> 
		</div>
			<div class="imgArea" align="left">
			<img src="<%=contextPath%>/resources/img/intro/icons-notice.png">
			&nbsp;&nbsp;<span style="font-size:22px; color:rgb(151, 152, 120); font-weight:700;">주의사항 : </span>
			<p style="font-size:18px; color:rgb(151, 152, 120);">
			<br>
			1. 체크인 시간 30분 전에 방문하셔야 합니다.
			<br>
			2. 예약 취소는 온라인으로만 가능합니다.
			<br><br>
			<span style="font-size:22px;"><b>- 아래 내용에 해당하는 경우 위탁이 불가능합니다. -</b></span>
			<br><br>
			1. 필수 접종 5종이 확인되지 않는 아이
			<br>
			2. 사람에게 공격성이 있는 아이
			<br>
			3. 전염성 피부병을 앓고 있는 아이
			<br>
			4. 중성화가 안된 남아
			<br>
			5. 위중한 병에 걸렸거나 10살 이상의 노령견
			<br>
			6. 수술 후 치료중인 아이
			</p> 
		</div>
		<br><br><br>
        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
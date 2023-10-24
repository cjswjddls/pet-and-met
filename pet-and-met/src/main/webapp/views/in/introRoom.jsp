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
	       
	    .outher table { 
	    	margin-left: 15.5%; 
	    	width: 69.5%; 
	    	border-style: inset;
           
	    }
	    .img {
	        right:200px;
	        top: 200px;
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
		.RoomA {
			text-align:center;
			font-size:20px;
			color: black;
			height:300px;
		}
		.RoomB {
			text-align:center;
			font-size:20px;
			color: black;
			height:300px;	
		}

		#table span{
	    margin-left : 30px;
	    font-size : 40px;
		
	    }
		
	    
    </style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		
		<div class="adminNameBar" align=center>
			<br><br><br><br>
			<h1>객실 소개</h1>
			<hr>
		</div>
		
		<%@ include file="/views/common/sidebarHotel.jsp" %>
		
		<div class="">
		    
		    <fieldset class="outher">
		   
		    <br>
		        
		        <table class="RoomA">
		            
		            <tr>
		                <td colspan="3" rowspan="4" width="30%" height="70%" style="border: 1px solid black;">
		                <img src="<%= pagePath %>resources/img/intro/small.PNG" width="100%"  height="100%" style="border:0px; box-sizing:border-box;">
		                </td>
		                <td width="30%" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">타입</td>
		                <td width="85%" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">설명</td>
		            </tr>
		            
		            <tr>
		                <td width="50" height="30" style=" border-bottom:1px solid black;">A-타입</td>
		                <td width="200" height="80" style=" border-bottom:1px solid black;">소형견과 중형견들을 위한 방입니다.</td>
		            </tr>
		            
		            <tr>
		                <td width="50" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">가격</td>
		                <td width="200" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">분류</td>
		            </tr>
		            
		            <tr>
		                <td width="50" height="30" style=" border-bottom:1px solid black; ">80,000</td>
		                <td width="200" height="80" style=" border-bottom:1px solid black;">소형반려동물 전용</td>
		            </tr>
		            
		        </table>
				 
				 <br><br>
		        
		        <table class="RoomB">
		            
		            <tr>
		                <td colspan="3" rowspan="4" width="30%" height="70%" style="border: 1px solid black;">
		                <img src="<%= pagePath %>resources/img/intro/big.PNG" width="100%"  height="100%" style="border:0px; box-sizing:border-box;">
		                </td>
		                <td width="30%" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">타입</td>
		                <td width="85%" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">설명</td>
		            </tr>
		            
		            <tr>
		                <td width="50" height="30" style=" border-bottom:1px solid black;">B-타입</td>
		                <td width="200" height="80" style=" border-bottom:1px solid black;">대형 견종을 위한 방입니다.</td>
		            </tr>
		            
		            <tr>
		                <td width="50" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">가격</td>
		                <td width="200" height="30" style=" border-bottom:1px solid black; background-color: rgb(121, 172, 120);">분류</td>
		            </tr>
		            
		            <tr>
		                <td width="50" height="30" style=" border-bottom:1px solid black; ">120,000</td>
		                <td width="200" height="80" style=" border-bottom:1px solid black;">대형견 전용</td>
		            </tr>
		            
		        </table>
			
			</tr>
			<tr>
			  <td>
			  <br><br><br><br>
			  <div align="center">
					<img src="<%= pagePath %>resources/img/intro/sb.PNG" id="SB"
					style="border-radius:20px;">
					<br><br>
					<p style="font-size:32px; color:rgb(121, 172, 120);">"소중한 우리 아이를 위한 프리미엄 쉼터"</p>
			  </div>
			  </td>
		   </tr>

		    </fieldset>  
			
		</tr>
		</div>
		
		<br><br><br><br>

        <%@ include file="/views/common/footer.jsp" %>
        
	</body>
</html>
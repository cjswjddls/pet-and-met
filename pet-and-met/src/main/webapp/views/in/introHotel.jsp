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
		
	    #img-area{
	    width: 600px;
	    margin:auto;
	    }
	    #hotelImg{
	    width: 500px;
	    height:700px;
	    
	    }
	    #table { 
	    	margin-left: 20%; 
	    	width: 65%; 
	    	height: 500px;
           
	    }
	    #table p{
	    font-size:32px;
	    color:rgb(121, 172, 120);
	    font-weight:500;
	    }
	    
	    #subImg{ width : 400px; height: 250px;}
	    #table span{
	    margin-left:30px;
	    font-size:22px;
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
		
		<div class="body-area">
		
		    <div id="img-area">
		    <img src="<%= pagePath %>resources/img/intro/er.jpg" id="hotelImg"></img>
		    </div>
		    <br><br>
        <table id="table">
          <tr align="center">
	         <th colspan="2">
	         <p>
	             " 기존의 단순한 동물에서 벗어나 인생의 동반자로서 잊지못할 추억을 만들어주세요.<br>
				 바쁜 사회생활로 인해 피곤한 현대인들을 위한 서비스입니다. "
	         </p>
	         <br>
	         <hr>
	         </th>
		</tr>
	     <tr>
           <td>
           <br>
           	<img src="<%= pagePath %>resources/img/room/A_type.png" id="subImg"></img>
           </td>
           <td>
           	<span>
           	기존 반려동물 호텔링 서비스의 단점을 보완하고
			호텔식 예약 시스템을 융합하여 편의성 향상
			</span>
			<span>Very Good Hotel!</span>

           </td>
        </tr>
        </table>
		        
		</div>
		
		<br><br><br>

        <%@ include file="/views/common/footer.jsp" %>
        
	</body>
</html>


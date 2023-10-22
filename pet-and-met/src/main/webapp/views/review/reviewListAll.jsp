<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.vo.Attachment" %>
    <% 
		String pagePath = "./"; 
		String pageName = "리뷰게시판";

	%>
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
        #contain-area{
			margin:auto;
			width:1000px;
			box-sizing:border-box;
		}
		#contain-area>h2{color:rgb(121, 172, 120);}
		#contain-area>hr{background-color: rgb(121, 172, 120); border: 0; height: 4px;}
		
		.review{ 
            text-align: center; 
            width: 800px;
            height: 400px;
        }
        .review>thead th { 
            width: 50px;
            height: 50px;
        } 

        #sub{
            width: 800px;
            font-size: 20px;
        }
        #name{
            width: 300px;
            font-size: 20px;
        }
        .writingButton { 
            text-decoration: none; 
            color: white; 
            background-color: rgb(121, 172, 120); 
            font-size: x-large;
            border-style: solid;
            border-radius: 10px;
            border-color: rgb(121, 172, 120);
        }
		.writingButton:hover { 
            text-decoration: none; 
            color: black; 
            background-color: white; 
        }   
        .search {
            display: flex;
            justify-content: center;
        }
        #button{
            border-style: solid;
            border-radius: 10px;
            border-color: rgb(121, 172, 120);

        }

        .review th,
        .review td { 
            border-bottom: 1px solid rgb(121, 172, 120);
            border-collapse : collapse;
        }

	</style>
	</head>
	<body>
        <%@ include file="/views/common/header.jsp" %>
        <%@ include file="/views/common/sidebarHotel.jsp" %>
		<br><br><br><br>
        <div id="contain-area">
        	<h2>&nbsp;&nbsp;리뷰게시판</h2>
			<hr>
        

        <br><br>
        <div align="center">
            <div align="right" style="width:800px;">
                <p><select selected name="phone" class="btn btn-success">
                    <option value="byDate">최신순</option>
                    <option value="byView">조회순</option>
                    
                </select></p>
            </div>    
		<table class="review">
            <thead>
            <tr>
                <th>NO</th>
                <td id="sub"><span class="subject">제목</span></td>
                <td id="name">작성자</td>
            </tr>
            </thead>
            <tr>
                <th>1</th>
                <td></td>
                <td></td>
            </tr>  
            <tr>
                <th>1</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>1</th>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th>1</th>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th>2</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>3</th>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th>4</th>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th>5</th>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th>6</th>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th>7</th>
                <td></td>
                <td></td>
            </tr>
            
        </table>	
        </div>	
        <br><br>
        
        <!-- 페이징 버튼 영역 -->
        
        <div align="center" id="paging-btn-area">
        <button>1</button>
        <button>2</button>
        </div>
        
        
        <% if(loginMember != null) {  %>
        	<div align="right" style="width:900px;">
        	<a href="<%= contextPath %>/reviewWrite.rv" 
             class="writingButton">
             &nbsp;&nbsp;글쓰기&nbsp;&nbsp;
             </a>
         </div>
        <% } %>
        
    </div>

        <br><br><br><br>
        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
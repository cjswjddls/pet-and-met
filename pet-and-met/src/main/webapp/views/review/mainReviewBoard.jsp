<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.vo.Attachment" %>
    <% 
		String pagePath = "./"; 
		String pageName = "리뷰게시판";

		Board b = (Board)request.getAttribute("b");
		Attachment at = (Attachment)request.getAttribute("at");
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
            font-size: 24px;
        }
        #name{
            width: 300px;
            font-size: 24px;
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
            border-bottom: 1px solid black; 
            border-collapse : collapse;
        }

	</style>
	</head>
	<body>
        <%@ include file="/views/common/header.jsp" %>
		<br><br><br><br>
        <div>
        <h1>리뷰게시판</h1>
        </div>
        <hr>
        <br><br><br><br>
        <div align="center">
            <div align="right" style="width:800px;">
                <p><select name="phone">
                    <option value="최신순">최신순</option>
                    <option value="조회순">조회순</option>
                    
                </select></p>
            </div>    
		<table class="review">
            <thead>
            <tr>
                <th>NO</th>
                <td id="sub"><span class="subject">SUBJECT</span></td>
                <td id="name">NAME</td>
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
        <br>
        <div style="float:right;"><a href="javascript:history.back();" 
             class="writingButton">&nbsp;&nbsp;글쓰기&nbsp;&nbsp;</a></div></div>
          
        </div>   

        <br><br><br><br>
        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
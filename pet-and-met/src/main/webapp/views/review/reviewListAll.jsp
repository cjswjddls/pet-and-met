<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.common.model.vo.PageInfo, java.util.ArrayList, com.kh.review.model.vo.Review" %>
    <% 
		String pagePath = "./"; 
		String pageName = "리뷰게시판";
		
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
		int listCount = (int)request.getAttribute("listCount");
		
		int currentPage = pi.getCurrentPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		int maxPage = pi.getMaxPage();

	%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>리뷰게시판</title>
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
            width: 1000px;
            height: 400px;
        }
        .review>thead th { 
            width: 50px;
            height: 50px;
            color: rgb(121, 172, 120); 
        } 
        #sub{ width: 800px; font-size: 22px; color: rgb(121, 172, 120); }
        #name{ width: 200px; font-size: 22px; color: rgb(121, 172, 120); }
        #date{width:200px;  font-size: 22px; color: rgb(121, 172, 120); }
        #view{width:100px;  font-size: 22px; color: rgb(121, 172, 120); }
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
        

	 /* 페이지번호 버튼 */
        .paging-btn-area{
	        width: 800px;
	        margin:auto;
	        margin-top:50px;   
        }
        
        .paging-btn-area button{
        	border:0px;
        	width:40px;
        	height:40px;
        	background-color : rgb(121, 172, 120);
        	color:white;
        	border-radius:10px;
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
   
		<table class="review">
            <thead>
            <tr>
                <th>NO</th>
                <td id="sub"><span class="subject">제목</span></td>
                <td id="name">작성자</td>
                <td id="view">조회수</td>
                <td id="date">작성일</td>
            </tr>
            </thead>
            <tbody>
            <% if(list.isEmpty()) { %>
            <tr>
                	<td colspan="5">조회된 글이 없습니다.</td>
            </tr>
            <% } else { %>
            <% for(Review rv : list) { %>
            	<tr>
	                <th><%= rv.getReviewNo()  %></th>
	                <td><%= rv.getReviewName() %></td>
	                <td><%= rv.getReviewAuthor() %></td>
	                <td><%= rv.getReviewView() %></td>
	                <td><%= rv.getReviewInsert() %></td>
            	</tr>
            <% } %>
            <% } %>
			</tbody>
        </table>	
        </div>	
        <br><br>
        
        <!-- 페이징 버튼 영역 -->
        
    <!-- 페이징바 -->
    <div class="paging-btn-area" align="center">
    <% if(currentPage != 1) { %>
       		<!-- 1 페이지가 아닌 경우에만 이전페이지로 이동 가능하게끔 -->
        	<button id="pageBtnFirst">
        		&lt;
        	</button>
       	<% } %>
           <% for(int p = startPage; p <= endPage; p++) { %>
            
	           	<% if(p != currentPage) { %>
	           	
	            	<button type="button" class="pageBtns" value="<%= p %>">
	            		<%= p %>
	            	</button>
	           		
	           	<% } else { %>
	           		<!-- 현재 내가 보고있는 페이지일 경우 클릭 안되게끔 -->
	           		<button disabled style="color:yellow; font-weight:900;"><%= p %></button>
	           	<% } %>
	           
	        <% } %>
	           
	           <% if(currentPage != maxPage) { %>
	           
	           	<!-- 마지막 페이지가 아닌 경우에만 다음페이지로 이동하게끔 -->
	            <button id="pageBtnLast">
	            	&gt;
	            </button>       
       <% } %>
           
       </div>

        <% if(loginMember != null) {  %>
        <br><br>
        	<div align="right" style="width:1000px;">
        	<a href="<%= contextPath %>/reviewWrite.rv" 
             class="writingButton">
             &nbsp;&nbsp;글쓰기&nbsp;&nbsp;
             </a>
         </div>
        <% } %>	
        
    </div>
    
        <script>
    $(function() {
    	
    	let currentPage = <%= currentPage %>
    	let nextPage = <%= currentPage + 1 %>
    	let backPage = <%= currentPage - 1 %>
    	
        $(".review>tbody>tr").click(function() {
            let rno = $(this).children().eq(0).text();

            location.href = "<%= contextPath %>/detail.rv?rno=" + rno;
        });

        
        $(".pageBtns").click(function() {

            let c = $(this).val();
            location.href = '<%= contextPath %>/reviewList.rv?currentPage=' + c;
            
        });

        $("#pageBtnFirst").click(function() {
            location.href = '<%= contextPath %>/reviewList.rv?currentPage=' + backPage;
        });

        $("#pageBtnLast").click(function() {
            location.href = '<%= contextPath %>/reviewList.rv?currentPage=' + nextPage;
        });
        
    });
    </script>

        <br><br><br><br>
        <%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
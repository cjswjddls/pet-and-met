<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.kh.review.model.vo.Review" %>
    <% String pagePath = "./"; %>
    <% String pageName="리뷰게시판"; 
        ArrayList<Review>list = (ArrayList<Review>)(request.getAttribute("list"));
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminCheck</title>
    <style>

      @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
      }
      
      * { font-family: 'Pretendard-Regular'; }

      .NO-table{
		width: 800px;
		height: 350px;
        margin-right: 200px;
	  }
      table {
        border-spacing: 0px;
        margin-left:40%;
      }
      .btns1{    
        width: 120px;     
        height: 50px;
        background-color: rgb(176, 217, 177);
        border: 0px;
        border-radius: 10px;
        margin-left: 890px;
        font-size: 16px;
      }
      .NO-table td{
        text-align:center;
      }
      .btn-area1 {
      margin-left:11%;
      }
		
    </style>
    
    
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
</head>
<body>

	<%@ include file="/views/common/adminAttachment.jsp" %>
	<br><br><br>
    <form action="search.do" method="get">
    <div style="margin-left: 35%; display: flex;">
        <div style="float: left; width: 48%;">
            <h4>게시글 목록</h4> 
        </div>
        <div style="width: 40%;">
        NO: <input type="text" name="keyword">
            <input type="submit" value="검색">
        </form>
        </div>
    </div>
    <br>
    <table border="1" class="NO-table">
      <thead>
        <tr style="background-color: lightgray; text-align: center;">
            <th></th>
            <th width="50">NO</th>
            <th width="200">NAME</th>
            <th width="200">Author</th>
            
        </tr>
      </thead>
      <tbody>
         <tr>
            <td colspan="4">아래 항목들이 모든 리스트입니다.</td>
          </tr>
          
            <tr>
              <th style="text-align: center;" width="30"><input type="checkbox"></th>
              <td>1</td>
              <td></td>
              <td></td>
            </tr>
                <% if(list.isEmpty()) { %>
                  <tr>
                    <td colspan="6">조회된 리스트가 없습니다.</td>
                  </tr>
                <% } else { %>
                  <% for(Review r : list) { %>
                    <tr>
                      <th width="20"  height="15"><input type="checkbox"></th>
                      <td><%= r.getReviewNo() %></td>
                      <td><%= r.getReviewName() %></td>
                      <td><%= r.getReviewAuthor() %></td>
                    </tr>
                  <% } %>
                <% } %> 
       </tbody>
    </table>

    <br>

    <div class="btn-area" align="center">
      
       <button type="button" class="btns1" data-toggle="modal" data-target="#myModal2" id="delete-room-btn">게시글 삭제</button>
    </div>
    
  <!-- 객실삭제 모달창 -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header"></div>
        
        <!-- Modal body -->
        <div class="modal-body" style="margin-right: 20%;">
          <table border="1" height="100px">
            
            <tr style="background-color: lightgray;" >
                <td colspan="2" height="50px">게시글을 정말 삭제하시겠습니까?</td>
            </tr>

            <tr style="background-color: lightgreen;">
                <td><button type="button" class="insert" style="background-color: lightgreen;" id="dog" onclick="checkbox();">YES</button></td>
                <td><button type="button" class="insert" style="background-color: lightgreen;">NO</button></td>
            </tr>

         </table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
    
</form>
</body>
</html>
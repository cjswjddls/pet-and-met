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
    <title>리뷰관리자</title>
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
        height: 150px;
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
      .insert {
        border-radius: 15px;
        margin-right: 35px;
        width: 70px;
        height: 45px;
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
    <form action="reviewListController" method="get">
    <div style="margin-left: 35%; display: flex;">
        <div style="float: left; width: 48%;">
            <h4>게시글 목록</h4> 
        </div>
        <div style="width: 40%;">
        <input type="hidden" value="1" name="currentPage">
        NO: <input type="text" name="keyword" id="keyword">
            <input type="submit" value="검색">
        </form>
        </div>
    </div>
    <br>
    <table border="1" class="NO-table">
    
      <thead>
        <tr style="background-color: lightgray; text-align: center;">
            <th><input id="selectAll" type="checkbox"></th>
            <th width="50">NO</th>
            <th width="200">NAME</th>
            <th width="200">Author</th>
        </tr>
      </thead>
      <tbody>
                <% if(list.isEmpty()) { %>
                  <tr>
                    <td colspan="4">조회된 리스트가 없습니다.</td>
                  </tr>
                <% } else { %>
                  <% for(Review r:list) { %>
                    <tr>
                      <th width="20"  height="15" style="text-align: center;"><input type="checkbox" class="deleteCheck"></th>
                      <td><%= r.getReviewNo() 	%></td>
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
          <table height="100px">
            <tr>
                <td><button type="button" class="insert" style="background-color: rgb(160, 214, 161);" id="dog" onclick="checkbox();">YES</button></td>
                <td><button type="button" class="insert" style="background-color: rgb(160, 214, 161);">NO</button></td>
            </tr>
         </table>
        </div>
        <img src="" alt="">
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
    
  <script>
    $(function() {
      $("#selectAll").change(function(){
          $(".deleteCheck").attr("checked", $("#selectAll").is(":checked"));
      });
    });

    function checkbox(){
      
      let str = "";
      let count = 0;
     
      
      $(".NO-table tbody").children().each(function(e) {
        
        if($(this).children().eq(0).children().eq(0).is(':checked')) {
          count += 1;
         
          str += $(".NO-table tbody").children().eq(e).children().eq(1).text() + "/";
        }
      })
     
      if (count != 0) {
        str = str.slice(0, -1); 
        location.href = '<%=contextPath %>/AdminReviewDeleteController?rev=' + str; 
      }
    }
</script>
</form>
</body>
</html>
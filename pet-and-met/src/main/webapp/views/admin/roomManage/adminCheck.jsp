<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.kh.reservation.model.vo.Room" %>
    <% String pagePath = "./"; %>
    <% String pageName="객실 현황"; %>
    <% ArrayList<Room> ro = (ArrayList<Room>)(request.getAttribute("list")); %>
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

      table {
        border-spacing: 0px;
        margin-left:35%;
        margin-bottom: 40px;
      }
          
      .btns{    
        width: 120px;     
        height: 50px;
        background-color: rgb(176, 217, 177);
        border: 0px;
        border-radius: 10px;
        margin-right: 45px;
        margin-left: 15px;
        font-size: 16px;
      }
          
      .btns:hover{
        cursor: pointer;
      }

      #room-table td{
        text-align:center;
        
      }
      
      .btn-area {
      margin-left:11%;
      }
      
      .insert {
        width: 100%; 
        height: 100%; 
        margin: 0px;
      }

      #in {
        margin-left:38%;
        text-align:center;
        
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
    <form action="" method="post">
    <table border="1" id="room-table">
      <thead>
        <tr style="background-color: lightgray; text-align: center;">
            <th width="5" height="15"></th>
            <th width="70">객실번호</th>
            <th width="120">객실타입</th>
            <th width="140">객실요금</th>
            <th width="300">객실사용가능여부</th>
            <th width="140">객실면적</th>
        </tr>
      </thead>
      <tbody>
        <% if(ro.isEmpty()) { %>
          <tr>
            <td colspan="6">조회된 리스트가 없습니다.</td>
          </tr>
        <% } else { %>
          <% for(Room r:ro) { %>
            <tr>
              <th width="20"  height="15"><input type="checkbox"></th>
              <td><%= r.getRoomNo() %></td>
              <td><%= r.getRoomType() %></td>
              <td><%= r.getRoomFee() %></td>
              <td><%= r.getRoomUseable() %></td>
              <td><%= r.getRoomSize() %></td>
            </tr>
          <% } %>
        <% } %> 
       </tbody>
    </table>



    <div class="btn-area" align="center">
       <button type="button" class="btns" data-toggle="modal" data-target="#myModal" id="insert-room-btn">객실 추가</button>
       <button type="button" class="btns" data-toggle="modal" data-target="#myModal2" id="delete-room-btn">객실 삭제</button>
    </div>
    
    <!-- 객실추가 모달창 -->
  <div class="modal" id="myModal">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header"></div>
        
        <!-- Modal body -->
        <div class="modal-body" style="margin-right: 20%;">
        <br>
          <table border="1" height="70" width="242px">
          <tr rowspan="2">
            	<input type="number" value="0" id="in" name="" min="0">
            </tr>
            <tr>
                <td><button type="button" class="insert" id="insertA"> A 타입객실 추가</button></td>
                <td><button type="button" class="insert" id="insertB"> B 타입객실 추가</button></td>
            </tr>
          </table>  
        </div>
        <script>
          $(function() {
            $("#insertA").click(function() {
              let roomNo = $("#in").val();
              location.href='<%= contextPath %>/adminCheckInsertController?roomNo=' + roomNo;
            });
          })
          
          $(function() {
            $("#insertB").click(function() {
              let roomNo = $("#in").val();
              location.href='<%= contextPath %>/adminCheckInsertController2?roomNo=' + roomNo;
            });
          }) 
        </script>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">나가기</button>
        </div>
      </div>
    </div>
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
                <td colspan="2" height="50px">정말 객실을 삭제하시겠습니까?</td>
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
    <script>
            function checkbox(){
              
              // 1번 table > tr의 첫번째 자손에는 input[checkbox], 얘가 체크드이면
              // 2번 문자열에 += 두번째 자손인 방번호를 읽어와서 중간자를 하나 덧붙여 만들어
              // 3번 근데 주의할점은 맨마지막에서 1글자는 빼서 보내면됨.
              // 4번 location.href = '~/~?ros=문자열';
              
              let str = "";
              let count = 0;
              // 문자열 초기화
              
              $("#room-table tbody").children().each(function(e) {
                
                // console.log($("#room-table tbody").children().eq(e).children().eq(0).html());
                // console.log($("input[type='checkbox']:checked").parent().parent().children().eq(1).text());
                // (위의 두개는 안되는것들의 잔해)
                
                if($(this).children().eq(0).children().eq(0).is(':checked')) {
                  count += 1;
                  // $("#room-table tbody").children().eq(e).children().eq(1).html()
                  // (잔해)

                  str += $("#room-table tbody").children().eq(e).children().eq(1).text() + "/";
                }
              })
             
              // ("input[type='checkbox']").prop('checked');
              // (잔해 )

              if (count != 0) {
                str = str.slice(0, -1); // 문자열 뺀거
                location.href = '<%=contextPath %>/checkDelete?ros=' + str; 
              }
            }
        </script>
</form>
</body>
</html>
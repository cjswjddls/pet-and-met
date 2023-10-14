<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String pagePath = "./"; %>
    <% String pageName="객실 현황"; %>
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
        <tr style="background-color: lightgray;">
            <th width="5" height="15"></th>
            <th width="70">객실번호</th>
            <th width="120">객실타입</th>
            <th width="140">객실요금</th>
            <th width="300">객실사용가능여부</th>
            <th width="140">객실면적</th>
        </tr>
		
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>1</td>
        <td>A타입</td>
        <td></td>
        <td>YES OR NO</td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>2</td>
        <td>B타입</td>
        <td></td>
        <td>YES OR NO</td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>3</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>4</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>5</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>6</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>7</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>8</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>9</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>10</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>11</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
       <tr>
        <th width="20"  height="15"><input type="checkbox"></th>
        <td>12</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
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
            <tr>
                <td><button class="insert"> A 타입객실 추가</button></td>
                <td><button class="insert"> B 타입객실 추가</button></td>
            </tr>
          </table>  
        </div>
        
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
                <td><button class="insert" style="background-color: lightgreen;">YES</button></td>
                <td><button class="insert" style="background-color: lightgreen;">NO</button></td>
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
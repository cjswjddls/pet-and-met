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
	<title>리뷰 등록</title>
	<style>
		#contain-area{
			margin:auto;
			width:1000px;
			box-sizing:border-box;
			margin-bottom:10%;
		}
		#contain-area>h2{color:rgb(121, 172, 120);}
		#reviewTitle{
			width:100%;
			border:2px solid rgb(121, 172, 120);
		}
		#upFile{
			border:2px solid rgb(121, 172, 120);
		}
		#plus{ width : 40px; height: 40px; border:0px; border-radius:10px;}
		
		.container hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; }
		.Table { width: 100%; height: 500px; box-sizing:border-box; 	}
		.Table th, .Table td { height: 10px; text-align: center; }
		.Table th { background-color: rgb(121, 172, 120); border-radius: 10px; height: 40px; width:20%;}
		#goList { text-decoration: none; color: white; background-color: rgb(121, 172, 120); font-size: 24px; border-style: solid; border-radius: 10px;}
		#goList:hover { text-decoration: none; color: rgb(121, 172, 120); background-color: white; }
        
		.deleteButton{ text-decoration: none; color: white; background-color:rgb(121, 172, 120); font-size: 24px; border-style: solid; border-radius: 10px;}
		.deleteButton:hover { text-decoration: none; color: rgb(121, 172, 120); background-color: white; }
		#updateButton{ height:35px; text-decoration: none; color: white; background-color: rgb(121, 172, 120);  border: 0px; border-radius: 10px;}
		#updateButton:hover { height:35px; box-sizing:border-box; text-decoration: none;  border: 3px solid rgb(121, 172, 120); border-radius: 10px; color: rgb(121, 172, 120); background-color: white; }
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		<br><br><br>
		<div class="container" id="contain-area">	
			<h2>&nbsp;&nbsp;리뷰 등록</h2>
			<hr>
			<br>
			<form action="reviewEnroll.rv" method="post" enctype="multipart/form-data">
			<table class="Table Elements">
				<tr>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
					<td width="100;"></td>
				</tr>
				<tr>
					<th class="Elements">제목</th>
					<td colspan="5" class="Elements">
						<input type="text"  name="reviewName" id="reviewTitle" class="form-control reviewInput">
						<input type="hidden" name="memberNo" value="<%= loginMember.getMemberNo()%>">
					</td>			
				</tr>
				<tr>
					<td colspan="6" rowspan="20">
					<br><br><br><br><br><br><br>

						<textarea name="reviewContent" 
                        				style="width: 100%;
                        				border:2px solid rgb(121, 172, 120);
                                        height: 120%; 
                                        margin: 0px; 
                                        padding: 0px;
                                        box-sizing:border-box;
                                        resize:none;">
</textarea>
<br><br><br><br><br>
					</tr>                  
				<tr>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
                <tr><td>
						<br><br><br><br><input type="file" id="upFile1"  name="upFile1" class="form-control form-control"></td></tr>
                        <tr><td><input type="file" id="upFile2"  name="upFile2" class="form-control form-control"></td></tr>
                        <tr><td><input type="file" id="upFile3"  name="upFile3" class="form-control form-control"></td></tr>
                        <tr><td><input type="file" id="upFile4"  name="upFile4" class="form-control form-control"></td></tr>
			</table>
	
            <br><br>
			<div style="float:left;"><a href="javascript:history.back();" 
				class="But	ton" id="goList">&nbsp;&nbsp;목록&nbsp;&nbsp;</a>
			</div>
			<div style="float:right;"><a href="javascript:history.back()" class="deleteButton">&nbsp;&nbsp;취소&nbsp;&nbsp;</a></div>
			<div style="float:right;"><button type="submit"  id="updateButton">&nbsp;&nbsp;등록&nbsp;&nbsp;</button></div>
		<br><br>
		</form>
</div>
		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
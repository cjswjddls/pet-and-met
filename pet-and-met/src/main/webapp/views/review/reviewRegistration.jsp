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
		.container hr { background-color: rgb(121, 172, 120); border: 0; height: 4px; }
		.Table { width: 100%; height: 500px; }
		.Table th, .Table td { height: 10px; text-align: center; }
		.Table th { background-color: rgb(121, 172, 120); border-radius: 10px; height: 40px;}
		.Button { text-decoration: none; color: white; background-color: rgb(121, 172, 120); font-size: x-large; border-style: solid; border-radius: 10px;}
		.Button:hover { text-decoration: none; color: rgb(121, 172, 120); background-color: white; }
        .Element { width: 100%; height: 130px; border-radius: 20px;}
		.deleteButton{ text-decoration: none; color: white; background-color:rgb(121, 172, 120); font-size: x-large; border-style: solid; border-radius: 10px;}
		.updateButton{ text-decoration: none; color: white; background-color: rgb(121, 172, 120); font-size: x-large; border-style: solid; border-radius: 10px;}
	</style>
	</head>
	<body>
		<%@ include file="/views/common/header.jsp" %>
		<%@ include file="/views/common/sidebarHotel.jsp" %>
		<div class="container">
			<h1>리뷰게시판</h1>
			<hr>
			<br><br><br>
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
					</td>
				</tr>
				<tr>
					<td colspan="6" rowspan="20">
						<textarea name="" id="" 
                        readonly style="width: 100%; 
                                        height: 100%; 
                                        margin: 0; 
                                        padding: 0px;">리뷰내용
                        </textarea>

					</td>
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
				<tr></tr>
                <table class="Element" >
                    <tr>
                        <td style="border: 2px solid rgb(121, 172, 120); border-radius: 10px;">첨부파일</td>
                        <td style="border: 2px solid rgb(121, 172, 120); border-radius: 10px;">대충 첨부파일 내용</td>
                    </tr>
                    <tr>
                        <td style="width: 70px; border: 2px solid rgb(121, 172, 120); border-radius: 10px;">첨부파일</td>
                        <td style="border: 2px solid rgb(121, 172, 120); border-radius: 10px;">대충 첨부파일 내용</td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid rgb(121, 172, 120); border-radius: 10px;">첨부파일</td>
                        <td style="border: 2px solid rgb(121, 172, 120); border-radius: 10px;">대충 첨부파일 내용</td>
                    </tr>
                </table>
			</table>

            <br><br>
			<div style="float:left;"><a href="javascript:history.back();" 
				class="Button">&nbsp;&nbsp;목록&nbsp;&nbsp;</a></div></div>
			<div style="float:right;"><a href="javascript:history.back()" class="deleteButton">&nbsp;&nbsp;취소&nbsp;&nbsp;</a></div></div>
			<div style="float:right;"><a href="javascript:history.back()" class="updateButton">&nbsp;&nbsp;등록&nbsp;&nbsp;</a></div></div>
		<br><br>
		<%@ include file="/views/common/footer.jsp" %>
	</body>
</html>
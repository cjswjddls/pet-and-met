<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.member.model.vo.Member" %>
    
<%
	String pagePath = "./";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery 라이브러리 연동 (온라인 방식) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>

        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; }
        
        .mypage-area{
            width: 1000px;
            height: 600px;
            box-sizing: border-box;
            margin: auto;
            margin-bottom:250px;
        }
       .mypage-head{
            border-bottom: 3px solid rgb(121, 172, 120);
            box-sizing: border-box;
            margin: auto;
            width: 800px;
            height: 20%;
        }
        .mypage-head>h4{ /* 헤드 텍스트 */
            font-size: 26px;
            font-weight: 700;
            color: rgb(121, 172, 120);
            display: inline-block;
            margin-top: 60px;
            margin-left: 25px;
        }
        .mypage-body{
            box-sizing: border-box;
            margin: auto;
            width: 800px;
            height: 80%;
        }
        /*----------------------------------*/

        .mypage-body>p { /* "기본 정보" */
            font-size: 18px;
            font-weight: 700;
            color: rgb(121, 172, 120);
        }

        /* 테이블, 행렬 사이즈 */
        #profile-update-table{
            width: 800px;
            border: 1px dotted rgb(121, 172, 120);
        }
        #profile-update-table th{
            text-align: center;
            padding: 20px;
            width:120px;     
        }


        /* 입력칸 사이즈 */	
        .input{ width: 400px; }
        .email-input{ width: 400px; }
        .address-input{ width: 400px; }
        #profile-img{
            margin-left: 50px;
            width: 200px;
            height: 200px;
        }

        #introduce{ 
            width: 400px;
            height: 80px;      
            margin-bottom : 10px;
        }

        #btn-action button{ /* 변경, 취소 버튼 */
            width: 100px;
            height: 40px;
            border: 0px;
            border-radius: 10px;
        }
        #btn-action>button[type=submit]{
            background-color: rgb(121, 172, 120);
            color: white;
            font-size: 16px;
            font-weight: bold;
        }
        #btn-action>button[type=reset]{
            background-color: rgb(241, 241, 23);
            font-size: 16px;
            font-weight: bold;
        }
        #btn-imgUpload{
        	margin-left:50px;
        	margin-top : 8px;
            border: 0px;
            font-size: 14px;
        }
        #extext{
        margin-left:50px;
        color:red;
        }


    </style>

</head>
<body>

	<%@ include file="../../common/header.jsp" %>
	
	<div style="display:flex">
	<%@ include file="../../common/sidebarMember.jsp" %>
	</div>
	
    <div class="mypage-area">
        <div class="mypage-head">
            <h4>프로필 수정</h4>
        </div>
        <div class="mypage-body">
            <br><br>
            <p>기본 정보</p>
            <form action="updateExecute.mp" method="post" enctype="multipart/form-data">
            <table id="profile-update-table">
                <tr>
                    <th>아이디</th>
                    <td>
                        <input class="input form-control" type="text" readonly value="<%= loginMember.getMemberId()%>">
                    </td>
                    <td rowspan="5">
                    <img id="profile-img" src="resources/img/profile/<%= loginMember.getMemberNo() %>.png">
                    <div style="display:flex"  align="right">	
                        <input type="file" name="file" id="btn-imgUpload">
                    </div>
                    <span id="extext">파일은 .png 로 업로드해주세요.</span>
                    </td>
                </tr>
                <tr>
                    <th>성명</th>
                    <td>
                        <input class="input form-control" type="text" readonly value="<%= loginMember.getMemberName()%>">
                    </td>
                </tr>
                <tr>    
                    <th>휴대전화</th>
                    <td>
                        <input class="input form-control" type="text" name="memberPhone" value="<%= loginMember.getMemberPhone()%>">
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                    <div style="display:flex;">
                        <input class="email-input form-control form-control" name="memberEmail" type="email" value="<%= loginMember.getMemberEmail()%>">
                    </div>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input class="address-input form-control" type="text" name="memberAddress" value="<%= loginMember.getMemberAddress()%>">
                    </td>
                <tr>
                	<th>상세주소</th>
                	<td>
                        <input class="address-input form-control" type="text" name="memberAddressDetail" value="<%= loginMember.getMemberAddressDetail()%>">
                    </td>
                	
                </tr>
                <tr>
                <th>회원 소개</th>
                    <td colspan="2">
                        <textarea id="introduce" name="memberDescription" class="form-control" style="resize: none;"><% if(loginMember.getMemberDescription() != null) { %><%= loginMember.getMemberDescription() %><% } %></textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <div align="center" id="btn-action">
                <button type="submit">변경하기</button>
                <button type="reset">취소</button>
            </div>
        </form>
        </div>
    </div>
    
    <script>
    $(function(){
    	
		$("#profile-img").on("error", function() {
			
	        $(this).attr("src", "resources/img/profile/Default-Profile-Picture.png");
	        
	    });
		
	})
	</script>
    
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>
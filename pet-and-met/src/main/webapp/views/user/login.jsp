<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% String pagePath = "./"; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
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

        * {
            font-family: 'Pretendard-Regular';
        }

        #login-form{ /* 로그인 폼 영역 */
            margin-top: 10%;
            text-align: center;
        }
        #login-area{
        	margin-bottom: 150px;
        }

        .form-group { /* 폼 안쪽 요소들 */
        width: 500px;
        text-align: left;
        margin : auto;
       }

        #loginTitle { /* 로그인 타이틀 */
            font-size: 30px;
            font-weight: bold;
            color: rgb(121, 172, 120);
            text-align: center;
            margin-top: 5%;
            margin-bottom: 5%;
        }

        #login-form input, #login-form button { /* 입력칸, 로그인 버튼 공통 사이즈 */
            height : 45px;
            box-sizing : border-box;
            font-size : 20px;
            margin-bottom : 20px;
        }

        .form-group label{ /* ID: PW: */
            font-size: 20px;
            text-align: center;
        }

        #login-btn { /* 로그인 버튼 */
            margin-top: 20px;
            width: 100%;
            background-color: rgb(121, 172, 120);
        }

        #login-form div a{ /* 회원가입 / 아이디비번찾기 연결링크 */
            text-decoration: none;  
            margin-left: 10px;                     
            margin-right: 10px;
            font-size: 16px;
            color : gray;
            font-weight: 500;
        }        
    </style>
</head>
<body>
    <%@ include file="./../common/header.jsp" %>
    
    <div id="login-area">       
        <form id="login-form" action="" method="post">
            <h2 align="center" id="loginTitle">회원 로그인</h2>
                <div class="form-group">                   
                    <label id="id-label" for="userId">ID :</label>
                    <input type="text" class="form-control" id="userId" required>
                  </div>
                  <div class="form-group">
                    <label for="userPwd">Password :</label>
                    <input type="password" class="form-control" id="userPwd" required>
                  </div> 
                  <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg" id="login-btn">로그인</button>
                  </div> 
                  <br>
                  <div class="form-group-etc">
                    <a href="<%= contextPath %>/views/user/account/registerAgreements.jsp">회원가입</a> 
                    <a href="<%= contextPath %>/find.ac">ID / PW 찾기</a>
                  </div>
        </form>
    </div>
    <%@ include file="./../common/footer.jsp" %>
</body>
</html>
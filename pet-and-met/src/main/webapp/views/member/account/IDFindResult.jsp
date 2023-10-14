<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String pagePath="./"; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery 라이브러리 연동 (온라인 방식) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; }

        #head-line{ /* 녹색선 */
            width: 900px;
            margin: auto;
            margin-top: 10%;
            border-bottom: 3px solid rgb(121, 172, 120);;
        }

        #display-result-area>p{ /* 텍스트 문구 화면 영역 */
            text-align: center;
            line-height: 500px;
            width: 900px;
            height: 500px;
            margin: auto;
            font-size: 22px;
            font-weight: bold;
            color: rgb(121, 172, 120);
        }
        #display-result-area span{
            color: black;
        }

        #btn-login{
            background-color: rgb(121, 172, 120);
            color: white;
            border: 0px;
            border-radius: 10px;
            width: 120px;
            height: 50px;
        }
    </style>
</head>
<body>

	<%@ include file="../../common/header.jsp" %>

    <div id="head-line"></div>
    <div id="display-result-area">
        <p>
            회원님의 아이디는 <span>[userId]</span> 입니다
        </p>
    </div>

    <!-- 로그인 화면으로 포워딩 -->
    <div align="center">
        <button type="button" id="btn-login">
            로그인
        </button>
    </div>
    
    <%@ include file="../../common/footer.jsp" %>

</body>
</html>
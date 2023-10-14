<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" %>
    
<% String pagePath = "./"; %>
<% String memberName = (String)request.getAttribute("memberName"); %>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; }
        
        #register-title-area{ /* 상단 텍스트 영역 */
            width: 900px;
            margin: auto;
            margin-top: 10%;
            border-bottom: 3px solid rgb(121, 172, 120);;
        }
        #register-title-area>p{ /* 상단 텍스트 */
            font-size: 26px;
            font-weight: bold;
            color: rgb(121, 172, 120);
            letter-spacing: 3px;
        }
        .register-title-menu{ /* 상단슬롯 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }
        .register-title-menu:hover{ /* 상단슬롯 호버효과삭제 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }

        #display-success-area>div{ /* 텍스트 문구 화면 영역 */
            text-align: center;
            width: 900px;
            height: 500px;
            margin: auto;
        }

        #display-success-area>div>h1{
            color: rgb(121, 172, 120);
            font-weight: 500;
            line-height: 300px;
        }
        #display-success-area>div>p{
            color: black;
            font-size: 18px;
            font-weight: 600;
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
    <div id="register-title-area">
        <p>
            회원가입
                <span class="register-title-menu btn btn-sm disabled" style="background-color: green;">가입완료</span>
                <span class="register-title-menu btn btn-sm disabled">정보입력</span>
                <span class="register-title-menu btn btn-sm disabled">약관동의</span>
        </p>
    </div>
    <div id="display-success-area">
        <div>
            <h1>감사합니다.</h1>
            <p><%= memberName %> 님의 가입이 완료되었습니다.</p>
        </div>        
    </div>

    <div align="center">
        <button type="button" id="btn-login" onclick="sendLogin();">
            로그인
        </button>
    </div>

    <br><br><br>
    
    <%@ include file="../../common/footer.jsp" %>
    
    <script>
    	function sendLogin () {
    		location.href = "<%= contextPath %>/login.mb";
    	}
    </script>

</body>
</html>
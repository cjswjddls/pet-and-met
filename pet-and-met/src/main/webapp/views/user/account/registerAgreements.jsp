<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pagePath = "./"; %>
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

        #agreement-area{ /* 약관 공통 영역 */
            width: 900px;
            margin: auto;
        }

        .title-text{ /* 제목텍스트 + 내용 영역 */
            width: 400px;
            margin-left: 20px;
            margin-right: 20px;
            float: left;            
        }

        .title-text>p{ /* 약관 타이틀 텍스트 */
            font-size: 20px;
            font-weight: 700;
        }

        #agreement-use, #agreement-info{ /* 약관 내용 텍스트박스 */
            width: 400px;
            height: 300px;
            border: 2px solid lightgray;
            resize: none;
            background-color: white;
        }

        #use-true, #info-true{ /* 체크박스 */
            width: 20px;
            height: 20px;
            margin-top: 8px;
            vertical-align: middle;
        }

        .agree-text{ /* "동의합니다." */
            font-size: 18px;
            vertical-align: text-top; 
        }

        #btn-nextPage{ /* 다음버튼 */
            width: 120px;
            height: 50px;
            border: 0px;
            border-radius: 10px;
            font-size: 18px;
            margin-top: 100px;
            background-color: rgb(121, 172, 120);
            color: white;
        }
        #btn-nextPage:hover{
            background-color: rgb(82, 116, 82);
        }
    </style>
</head>
<body>
    <%@ include file="../../common/header.jsp" %>
    <div id="register-title-area">
        <p>
            회원가입
                <span class="register-title-menu btn btn-sm disabled">가입완료</span>
                <span class="register-title-menu btn btn-sm disabled">정보입력</span>
                <span class="register-title-menu btn btn-sm disabled" style="background-color: green;">약관동의</span>
        </p>
    </div>
    <br><br><br>

        <div id="agreement-area">
            <form action="<%= contextPath %>/register.ac" method="post">
                <div class="title-text">
                <p>서비스 이용약관</p>
                <textarea class="form-control" rows="5" id="agreement-use" readonly></textarea>
                <br>
                <input type="checkbox" id="use-true" required value="true"> &nbsp;
                <label for="use-true" class="agree-text">동의합니다.</label>
            </div>

            <div class="title-text">
                <p>개인정보처리방침</p>   
                <textarea class="form-control" rows="5" id="agreement-info" align="center" readonly></textarea>
                <br>
                <input type="checkbox" id="info-true" required value="true"> &nbsp;
                <label for="info-true" class="agree-text">동의합니다.</label>
            </div>

            <div align="center">
                <button type="submit" id="btn-nextPage">다음</button>
            </div>
            </form>
        </div>   
    <br><br>
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>
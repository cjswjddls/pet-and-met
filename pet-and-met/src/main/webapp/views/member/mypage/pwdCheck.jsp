<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String pagePath = "./"; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        margin: auto;
        margin-top: 150px;
    }
    .mypage-body span{ font-size: 20px; color: dimgray; }
    .mypage-body input{
        font-size: 20px;
        margin-left: 20px;
    }

    #btn-check{
        margin-top: 150px;
        background-color: rgb(121, 172, 120);
        color: white;
        border: 0px;
        border-radius: 10px;
        width: 120px;
        height: 50px;
        font-size: 18px;
    }

    </style>
</head>
<body>
    
    <%@ include file="../../common/header.jsp" %>
    
    <div class="mypage-area">
        <div class="mypage-head">
            <h4>회원 탈퇴</h4>
        </div>

        <div class="mypage-body" align="center">
            <form action="" method="post">
                <table>
                    <tr>
                        <th>
                            <span>비밀번호 재입력</span>
                        </th>
                        <td>
                            <input type="password" required id="check-pwd" class="form-control form-control">
                        </td>
                    </tr>
                </table>

                <div align="center">
                    <button type="submit" id="btn-check">
                        확인
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>
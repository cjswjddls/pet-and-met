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
        margin-top: 50px;

    }

    #info{ /* 유의사항 영역 및 텍스트 */
        width: 620px;
        height: 100px;
        text-align: left;
        font-size: 14px;
        background-color: beige;
        padding-top: 18px;
        padding-left: 10px;
        border: 1px solid rgb(221, 221, 197);
        box-sizing: border-box;
    }

    .mypage-body span{ font-size: 20px; color: dimgray; }
    .mypage-body input{
        font-size: 20px;
        margin-left: 20px;
    }

    #reason{ margin-top: 70px; }
    #select-reason{ 
        width: 300px;
        display: inline-block; }
    #btn-withdraw{
        margin-top: 120px;
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
                <div id="info">
                    <p>
                        - 개인정보보호법에 따라 고객님의 호텔 이용기록, 개인정보 및 문의내역 기록도 모두 삭제됩니다.
                        <br><br>
                        - 탈회 신청이 완료되면 즉시 홈페이지 로그인이 제한됩니다.
                    </p>
                </div>
                <div align="center" id="reason">
                    <span>
                        탈퇴 사유(선택)
                    </span>
                    <select id="select-reason" class="form-control form-control">
                        <option>원하는 서비스가 아님</option>
                        <option>타사 사이트 이용</option>
                        <option>회원 혜택 부족</option>
                        <option>기타</option>
                    </select>
                </div>
                <div align="center">
                    <button type="submit" id="btn-withdraw">
                        탈퇴하기
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>
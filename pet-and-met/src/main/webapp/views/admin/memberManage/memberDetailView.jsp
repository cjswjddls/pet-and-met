<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
       
       .head-area{
           width: 1000px;
           height: 600px;
           box-sizing: border-box;
           margin: auto;
       }
      .head-area{
           border-bottom: 3px solid rgb(121, 172, 120);
           box-sizing: border-box;
           margin: auto;
           width: 800px;
           height: 20%;
       }
       .head-title>h4{ /* 헤드 텍스트 */
           font-size: 26px;
           font-weight: 700;
           color: rgb(121, 172, 120);
           display: inline-block;
           margin-top: 60px;
           padding-bottom:10px;
           margin-left: 25px;
       }
       #detailView-table{
        margin-top: 50px;
        width: 650px;
        height: 350px;
        border: 2px solid rgb(121, 172, 120);
       }
       #detailView-table th{
        width: 100px;
        height: 50px;
        font-size: 16px;
        text-align: center;
       }
       #detailView-table td{
        width: 550px;
        font-size: 14px;
        padding-left: 10px;
       }

       #btn-goList{
        border: 0px;
        border-radius: 10px;
        width: 100px;
        height: 40px;
        margin-top: 30px;
        margin-bottom: 30px;
        color: white;
        background-color: rgb(121, 172, 120);
       }

       #selectStatus{ width: 80px; height: 25px;}
       #btn-updateStatus{
        width: 80px;
        height: 25px;
        border: 0px;
        border-radius: 10px;
       }

</style>

</head>


<body>

    <div class="head-area">
        <div class="head-title">
            <h4>회원 상세정보</h4>
        </div>
    </div>

    <div class="detailView-body" align="center">

        <form action="" method="get">
            <table id="detailView-table">
                <tr>
                    <th>회원번호</th>
                    <td>11111</td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>user01</td>
                </tr>
                <tr>
                    <th>회원명</th>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td>010-9090-8888</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        서웉특별시 영등포구 양평동3가
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>hong97@naver.com</td>
                </tr>
                <tr>
                    <th>가입일</th>
                    <td>2023-10-12</td>
                </tr>
                <tr>
                    <th>회원상태</th>
                    <td>
                        <select id="selectStatus">
                            <option selected>이용중</option>
                            <option>이용중지</option>
                        </select>
                        <button type="submit" id="btn-updateStatus">
                            변경하기
                        </button>
                    </td>
                </tr>
                <tr>
                    <th>탈퇴일자</th>
                    <td>-</td>
                </tr>
            </table>
            
            <button type="button" id="btn-goList">
                목록으로
            </button>

        </form>

    </div>

</body>
</html>
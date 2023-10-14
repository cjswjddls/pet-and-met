<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String pagePath = "../";

		String pageName = "회원 조회";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 조회</title>
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
        
        .head-area{ /* 헤드 영역 */
            width: 1000px;
            height: 600px;
            box-sizing: border-box;
            margin: auto;
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

        /* 조회된 건수 : default-전체조회 */
        #select-result{ width: 800px; }

        /* 검색창 영역 */
        #search-area{
            width: 550px;
            margin-top: 30px;
        }
        
        #condition-select{ width: 120px;} /* 검색조건 */
        #search-user{ /* 입력창 */
            width: 330px;
            margin: auto;
        }
        #btn-search{ /* 검색버튼 */
            width: 80px;
            height: 35px;
            border: 0px;
            border-radius: 10px;
            background-color: rgb(121, 172, 120);
            color: white;
            margin: auto;
        }

        /* 회원리스트 테이블 */
        #userList-table{
            width: 800px;
            text-align: center;
        }
        #userList-table>thead{
            background-color: rgb(121, 172, 120);
            border: 1px solid lightgray;
            box-sizing: border-box;
        }
        #userList-table tbody{ border-top: 2px solid black;}
        #userList-table td{
            border: 1px solid lightgray;
            box-sizing: border-box;
        }
        /* 제목줄 */
        #th-userNo{width: 80px;}
        #th-userName{width: 120px;}
        #th-userStatus{width: 70px;}
        #th-userEmail{width: 250px;}
        #th-userPhone{width: 150px;}

        /* 페이지번호 버튼 */
        .page-btn{
            border: 0px;
            width: 30px;
            height: 30px;
            background-color: rgb(121, 172, 120);
            color: white;
        }
    </style>      
</head>
<body>
    <%@ include file="../../common/adminAttachment.jsp" %>
    <!-- 
	<div class="head-area">
        <div class="head-title">
            <h4>회원 조회</h4>
        </div>
    </div>
    -->
    
    <div class="userListAll-body" align="center">
        <form action="" method="get">
        <div style="display: flex;" id="search-area">
        <select id="condition-select" class="form-control form-control">
            <option selected>회원번호</option>
            <option>아이디</option>
            <option>회원명</option>
        </select>
        <input type="text" id="search-user" class="form-control form-control">
        <button type="submit" id="btn-search">
            검색
        </button>
        </div>
        <br>
        <div>
            <div id="select-result" align="right">
                100 건 조회됨
            </div>
            <table id="userList-table">
                <thead>
                <tr>
                    <th id="th-userNo">회원번호</th>
                    <th id="th-userId">아이디</th>
                    <th id="th-userName">회원명</th>
                    <th id="th-userPhone">연락처</th>
                    <th id="th-userEmail">이메일</th>
                    <th id="th-userStatus">상태</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>010-9090-8888</td>
                    <td>hong@naver.com</td>
                    <td>이용중</td>
                </tr>
                </tbody>
            </table>
        
        </div>
    </form>
    <br>
    <div align="center">
        <button class="page-btn"><</button>
        <button class="page-btn">1</button>
        <button class="page-btn">2</button>
        <button class="page-btn">3</button>
        <button class="page-btn">4</button>
        <button class="page-btn">5</button>
        <button class="page-btn">></button>
    </div>

    </div>

</body>
</html>
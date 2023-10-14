<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pagePath = "./"; %>
<!DOCTYPE html>
<html lang="en">
<head>
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

        /* 폼 영역 */
        #find-id-area{
            display: block;
        }
        #find-pwd-area{
            display: none;
        }

        /* 호버 속성 */
        #find-id:hover{
            background-color: rgb(82, 116, 82);
            cursor: pointer;
        }
        #find-pwd:hover{
            background-color: rgb(82, 116, 82);
            cursor: pointer;
        }

        #find-title-area{ /* 타이틀 텍스트 영역 */
            width: 900px;
            margin: auto;
            margin-top: 50px;
            border-bottom: 3px solid rgb(121, 172, 120);
        }

        #find-title-area>span{ /* 타이틀 텍스트 */
            font-size: 22px;
            font-weight: 600;
            text-align: center;
            background-color: rgb(121, 172, 120);
            color: white;
            letter-spacing: 3px;
            display: inline-block;
            margin: auto;
            width: 200px;
        }

        /* 테이블 공통 속성 */
        .find-form-table{
            width: 500px;
            margin: auto;
            margin-top: 120px;
        }
        .find-form-table th {
            text-align: center;
            font-size: 18px;
            width:100px;
            color: dimgray;
        }
        .find-form-table td { padding: 25px; }

        
        /* 입력칸 크기 조절 */
        .userId{ width: 320px; }
        .userName{ width: 320px; }
        .email{ width: 145px; }
        .domain{ width: 150px; }
        .phone{ width: 107px; }
        
        .find-form-table span{
            font-size: 20px;
            margin-left: 5px;
            margin-right: 5px;
        }

        .find-submit-btn{ /* 확인버튼 */
            background-color: rgb(121, 172, 120);
            color: white;
            width: 120px;
            height: 50px;
            border: 0px;
            border-radius: 10px;
            font-size: 18px;
            margin: auto;
            margin-top: 40px;
            margin-bottom:100px;
        }

        /* Modal 안쪽 비밀번호 변경창 */
        .modal-title{
            color: rgb(121, 172, 120);
            font-weight: bold;
            margin-left: 15px;
        }
        .modal-body{
            height: 400px;
        }

        .change-pwd-table{
            width: 400px;
            margin: auto;
        }
        .change-pwd-table th{
            text-align: center;
            font-size: 16px;
            width: 100px;
            color: dimgray;
        }
        .change-pwd-table td{ padding: 20px; }
        .change-pwd-table p{ font-size: 12px; }
        .change-pwd-table input{ margin-top: 20px; }
    </style>

</head>
<body>

	<%@ include file="../../common/header.jsp" %>

    <div id="find-title-area">
        <span id="find-id">아이디찾기</span>
        <span id="find-pwd">비밀번호찾기</span>
    </div>

    <!-- 아이디 찾기 영역 -->
    <div id="find-id-area">
        <form action="" method="post">
            <table class="find-form-table">
                <tr>
                    <th>성명</th>
                    <td>
                        <input type="text" name="userName" class="userName form-control form-control" required> 
                    </td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td>
                    <div style="display:flex">
                        <select name="telecom" class="telecom phone form-control form-control">
                            <option selected>SKT</option>
                            <option>KT</option>
                            <option>LG U+</option>
                        </select>
                        <input type="text" name="phone1" class="phone form-control form-control" required>
                        <input type="text" name="phone2" class="phone form-control form-control" required>
                    </div>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                    <div style="display:flex">
                        <input type="text" name="email" class="email form-control form-control" required>
                        <span>@</span>
                        <select class="domain form-control form-control">
                            <option selected>직접입력</option>
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                         </select>
                    </div>
                    </td>
                </tr>
            </table>

            <div align="center">
                <button type="submit" class="find-submit-btn">확인</button>
            </div>
        </form>   
    </div>

    <!-- 비밀번호 찾기 영역 -->
    <div id="find-pwd-area">
        <form action="" method="post">
            <table class="find-form-table">
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" name="userId" class="userId form-control form-control" required> 
                    </td>
                </tr>
                <tr>
                    <th>성명</th>
                    <td>
                        <input type="text" name="userName" class="userName form-control form-control" required> 
                    </td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td>
                    <div style="display:flex">
                        <select name="telecom" class="telecom phone form-control form-control">
                            <option selected>SKT</option>
                            <option>KT</option>
                            <option>LG U+</option>
                        </select>
                        <input type="text" name="phone1" class="phone form-control form-control" required>
                        <input type="text" name="phone2" class="phone form-control form-control" required>
                    </div>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                    <div style="display:flex">
                        <input type="text" name="email" class="email form-control form-control" required>
                        <span>@</span>
                        <select class="domain form-control form-control">
                            <option selected>직접입력</option>
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                         </select>
                    </div>
                    </td>
                </tr>
            </table>

           <!-- 확인버튼을 누르면 Modal 열림 -->
           <div align="center">
           <button type="button" class="find-submit-btn" data-toggle="modal" data-target="#myModal">
            확인
            </button>
           </div>

            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">
                        새 비밀번호 변경
                    </h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <table class="change-pwd-table" align="center">
                            <tr>
                                <th>새 비밀번호</th>
                                <td>
                                    <input type="password" name="newUserPwd" required class="userPwd form-control form-control"
                                    minlength="8" maxlength="20" required>
                                    <p>영문, 숫자, 특수기호 포함 8-20자</p>
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호 확인</th>
                                <td>
                                    <input type="password" required class="checkPwd form-control form-control"
                                    minlength="8" maxlength="20" required>
                                    <p>영문, 숫자, 특수기호 포함 8-20자</p>
                                </td>
                            </tr>
                            </table>

                        <div align="center">
                            <button type="submit" class="btn-changePwd find-submit-btn" data-dismiss="modal">
                            변경하기
                            </button>
                        </div>

                    </div>            
                </div>
                </div>
            </div>
        </form>
    </div>
    
    <script>
        $(function() {        
            $("#find-id").click(function () {
                $("#find-id-area").show();
                $("#find-pwd-area").hide();
            });

            $("#find-pwd").click(function () {
                $("#find-pwd-area").show();
                $("#find-id-area").hide();
            });

        });
    </script>
    
    <%@ include file="../../common/footer.jsp" %>
    

</body>
</html>
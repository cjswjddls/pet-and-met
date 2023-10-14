<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String pagePath = "./"; 
    String g_siteKey = "6LfllG4jAAAAAHl2gmj51tnVeIKQArzfQ0g2RdnL";
%>
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
    <!-- 구글 recaptcha 2 -->
    <script src='https://www.google.com/recaptcha/api.js'></script>

    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; }

        #register-title-area{ /* 회원가입 텍스트 영역 */
            width: 900px;
            margin: auto;
            margin-top: 10%;
            border-bottom: 3px solid rgb(121, 172, 120);;
        }

        #register-title-area>p{ /* 회원가입 텍스트 */
            font-size: 26px;
            font-weight: bold;
            color: rgb(121, 172, 120);
            letter-spacing: 3px;
        }

        .register-title-menu{ /* 상단 슬롯 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }
        .register-title-menu:hover{ /* 상단슬롯 호버효과제거 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }

        #table-area-default>p{ /* "기본정보입력" */
            padding: 10px;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            color: rgb(121, 172, 120);
            letter-spacing: 2px;
        }

        #register-form-table{ /* 테이블 */
            width: 1000px;
            margin: auto;
        }
        #register-form-table th{ /* 테이블 제목열 */
            width: 300px;
            text-align: right;
            font-size: 18px;
            color: dimgray;
            padding-bottom: 3%;
        }
        #register-form-table td{ /* 테이블 입력칸들 */
            width: 700px;
            text-align: left;
            font-size: 16px;
            padding-left: 5%;
            padding-bottom: 3%;
        }

        #userName{ width: 300px; }  /* 성명 입력칸 */
        #userBirth{ width: 300px; } /* 생년월일 입력칸 */
        #email{ width: 140px; } /* 이메일 계정명 */
        #domain{ width: 145px; } /* 도메인주소 */

        /* 휴대폰번호 입력칸 */
        #telecom{ width: 90px;
        }
        .phone{
        width: 80px;
        }


        #address, #sAddress{ /* 주소입력칸 */
            width: 300px;
        }
        .nessesary{ color: red; } /* 별 표시 */


        #account-title{ /* "아이디/비밀번호 설정" */
            padding: 10px;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            color: rgb(121, 172, 120);
            letter-spacing: 2px;
            display: block;
        }

        #table-area-account { /* 테이블 영역 */
            padding: 10px;
            text-align: left;
            margin-top: 7%;
            margin-bottom: 10%;
        }

        #account-form-table{ /* 아이디 비번설정 테이블 */
            width: 1000px;
            margin: auto;
        }

        #account-form-table th{ /* 테이블 제목열 */
            width: 300px;
            text-align: right;
            font-size: 18px;
            color: dimgray;
            padding-bottom: 30px;
            
        }
        #account-form-table td{ /* 테이블 입력칸 영역 */
            width: 700px;
            text-align: left;
            font-size: 16px;
            padding-left: 5%;
        }

        #account-form-table input{ /* 테이블 INPUT 태그 */
            width: 300px;
            display: inline-block;
        }

        #duplicate-check{ /* 아이디 중복확인 버튼 */
            margin-left: 20px;
            border: 0px;
            background-color: rgb(121, 172, 120);
            color: white;
            border-radius: 25px;
            width: 100px;
        }
        #duplicate-check:hover{
            background-color: rgb(82, 116, 82);
        }

        #account-form-table p{ /* ID/PWD 조건텍스트 */
            font-size: 12px;
        }

        #reset-form, #submit-form{ /* 초기화, 다음버튼 공통 */
            width: 120px;
            height: 50px;
            border: 0px;
            border-radius: 10px;
            font-size: 18px;
            margin: 0px 0px 20px 20px;
        }

        #submit-form:hover{
            font-weight: bold;
        }
        #reset-form:hover{
            font-weight: bold;
        }

        #reset-form{
            background-color: rgb(240, 217, 12);
        }
        #submit-form{
            background-color: rgb(121, 172, 120);
            color: white;
        }
    </style>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>
    <div id="register-title-area">
        <p>
            회원가입
                <span class="register-title-menu btn btn-sm disabled">가입완료</span>
                <span class="register-title-menu btn btn-sm disabled" style="background-color: green;">정보입력</span>
                <span class="register-title-menu btn btn-sm disabled">약관동의</span>
        </p>
        
    </div>
 
    <form action="" method="post"  id="register-form">
        <br>
        <div id="table-area-default">
            <p>기본정보입력</p>
            <br>
            <table id="register-form-table" align="center">
                <tr>
                    <th><span class="nessesary">*</span> 성명 : </th>
                    <td colspan="3">
                        <input type="text" id="userName" name="userName" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 생년월일 : </th>
                    <td colspan="3">
                        <input type="date" id="userBirth" name="userBirth" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 휴대폰번호</th>
                    <td>
                        <div style="display:flex; width: 300px;">
                            <select id="telecom" name="telecom"  class="phone form-control form-control">
                                <option selected>SKT</option>
                                <option>KT</option>
                                <option>LG U+</option>
                            </select>
                            <input type="text" name="phone1" class="phone form-control form-control" >
                            <input type="text" name="phone2" class="phone form-control form-control">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 이메일</th>
                    <td colspan="3">
                        <div style="display:flex; width: 330px;">
                            <input type="text" id="email" name="email" required class="email form-control form-control"> @ 
                            <select id="domain" class="email form-control form-control">
                                <option selected>직접입력</option>
                                <option>naver.com</option>
                                <option>daum.net</option>
                                <option>gmail.com</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 주소</th>
                    <td colspan="3">
                        <input type="text" id="address" name="address" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td colspan="3">
                        <input type="text" id="sAddress" name="sAddress" class="form-control form-control">
                    </td>
                </tr>
            </table>
        </div>

        <div id="table-area-account">
            <span id="account-title">아이디 / 비밀번호 설정</span>
            <br>
            <table id="account-form-table" align="center">
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" id="userId" name="userId" required class="form-control form-control"
                        minlength="5" maxlength="15">
                        <button type="button" id="duplicate-check">중복확인</button>
                        <p>영문, 숫자 포함 5-15자</p>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" id="userPwd" name="userPwd" required class="form-control form-control"
                        minlength="8" maxlength="20">
                        <p>영문, 숫자, 특수기호 포함 8-20자</p>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td>
                        <input type="password" id="checkPwd" required class="form-control form-control">
                        <p>영문, 숫자, 특수기호 포함 8-20자</p>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td><div class="g-recaptcha" data-sitekey="<%= g_siteKey %>"></div></td>
                </tr>
            </table>
        </div>

        <div align="center">
            <button type="reset" id="reset-form">초기화</button>
            <button type="submit" id="submit-form">다음</button>
        </div>
    </form>
    <br><br>
	<%@ include file="../../common/footer.jsp" %>
</body>
</html>